import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/functions/showsnackbar.dart';
import 'package:restaurant_mobile/data/datasource/remote/auth/register_data.dart';
import 'package:restaurant_mobile/data/exceptions/auth/register_exception.dart';

class RegisterController extends GetxController {
  StatusRequest? statusRequest;
  final rd = RegisterData(Get.find<Crud>());
  final registerException = RegisterException();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  void goToLoginPage() {
    Get.offNamed(AppRoutes.login);
  }

  void register() async {
    if (formState.currentState!.validate() &&
        statusRequest != StatusRequest.loading) {
      statusRequest = StatusRequest.loading;
      await Future.delayed(const Duration(seconds: 1));
      update(['register']);
      statusRequest = StatusRequest.success;
      update(['register']);

      return showCustomSnackBar(
        title: 'Success',
        message:
            'An email has been sent to your email address, please verify your email address to login',
        duration: const Duration(seconds: 3),
        onClosed: (p0) => goToVerifyEmailPage(),
      );

      var response = await rd.postData(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        adress: "",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == true) {
          showCustomSnackBar(
            title: 'Success',
            message:
                'An email has been sent to your email address, please verify your email address to login',
            duration: const Duration(seconds: 3),
            onClosed: (p0) => goToVerifyEmailPage(),
          );
        } else {
          String message =
              registerException.handleException(message: response["message"]);
          showCustomSnackBar(
            title: 'Failed',
            message: message,
            duration: const Duration(seconds: 3),
          );
        }
      } else {
        Get.snackbar('Failed', 'Register Failed');
      }
      update(['register']);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  goToVerifyEmailPage() {
    Get.toNamed(AppRoutes.verifyEmail,
        arguments: {'email': emailController.text});
  }
}
