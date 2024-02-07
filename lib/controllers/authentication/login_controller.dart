import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/services/services.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final MyServices myServices = Get.find();
  void goToRegisterPage() {
    Get.offNamed(AppRoutes.signUp);
  }

  void goToForgetPasswordPage() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  void login() async {
    await myServices.sharedPreferences.setBool("login", true);
    Get.offAllNamed(AppRoutes.containerPage);
  }
}
