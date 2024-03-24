import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/model/image_model.dart';
import 'package:restaurant_mobile/data/model/user_model.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  void setShowPassword() {
    showPassword = !showPassword;
    update(["password"]);
  }

  final MyServices myServices = Get.find();
  void goToRegisterPage() {
    Get.offNamed(AppRoutes.signUp);
  }

  void goToForgetPasswordPage() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  void login() async {
    if (formState.currentState!.validate()) {
      await myServices.sharedPreferences.setBool("login", true);
      // TEST USER
      UserModel userModel = UserModel(
          id: 9,
          email: "test@gmail.com",
          fullName: "FullName Test",
          phone: "0677777777",
          address: "Address Test",
          createdAt: "2024-03-24T20:23:46.5916166Z",
          updatedAt: "2024-03-24T20:23:46.5916171Z",
          image: ImageModel(
            id: 23,
            publicId: "gkh62kktemvvy6hexesi",
            url:
                "https://res.cloudinary.com/dciymidzk/image/upload/v1711107569/gkh62kktemvvy6hexesi.png",
          ));
      await myServices.saveUser(userModel);
      Get.offAllNamed(AppRoutes.containerPage);
    }
  }
}
