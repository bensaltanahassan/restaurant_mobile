import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ForgetPasswordController extends GetxController {
  final formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void searchEmail() {
    if (formState.currentState!.validate()) {
      goToVerifyCodePage();
    }
  }

  void goToVerifyCodePage() {
    Get.toNamed(AppRoutes.verifyCodeForgetPassword,
        arguments: {"email": emailController.text});
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
