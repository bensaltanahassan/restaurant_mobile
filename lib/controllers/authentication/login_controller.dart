import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/auth/login_data.dart';
import 'package:restaurant_mobile/data/exceptions/auth/login_exception.dart';
import 'package:restaurant_mobile/data/model/login_model.dart';
import 'package:restaurant_mobile/data/model/user_model.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ld = LoginData(Get.find<Crud>());
  final myServices = Get.find<MyServices>();
  final loginException = LoginException();

  StatusRequest? statusRequest;
  bool showPassword = false;
  void setShowPassword() {
    showPassword = !showPassword;
    update(["password"]);
  }

  void goToRegisterPage() {
    Get.offNamed(AppRoutes.signUp);
  }

  void goToForgetPasswordPage() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  void login() async {
    if (formState.currentState!.validate()) {
      // hide the keyboard
      FocusScope.of(Get.context!).unfocus();
      statusRequest = StatusRequest.loading;
      update(["login"]);

      var response = await ld.postData(
          email: emailController.text, password: passwordController.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Map<String, dynamic> responseMap = response as Map<String, dynamic>;
        LoginModel loginModel = LoginModel.fromJson(responseMap);

        if (loginModel.status == true) {
          UserModel userModel = loginModel.data!.user!;
          userModel.token = loginModel.data!.token;
          await Future.wait([
            myServices.saveUser(userModel),
            myServices.sharedPreferences.setBool("login", true),
          ]);

          Get.offAllNamed(AppRoutes.containerPage);
        } else {
          if (loginModel.message!
              .toLowerCase()
              .trim()
              .contains("Email is not verified!".toLowerCase())) {
            goToVerifyEmailPage();
          }
          String message =
              loginException.handleException(message: loginModel.message!);
          showCustomSnackBar(
            title: 'Failed',
            message: message,
            duration: const Duration(seconds: 3),
          );
        }
      } else {
        showCustomSnackBar(
          title: 'Failed',
          message: 'Login Failed',
          duration: const Duration(seconds: 3),
        );
      }
      update(['login']);
    }
  }

  goToVerifyEmailPage() {
    Get.toNamed(AppRoutes.verifyEmail,
        arguments: {'email': emailController.text});
  }
}
