import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class VerifyCodeController extends GetxController {
  final TextEditingController pinController = TextEditingController();
  void resendCode() {}
  void verifyCode() {
    if (pinController.text.length == 5) {
      goToChangePasswordPage();
    }
  }

  void goToChangePasswordPage() {
    Get.toNamed(AppRoutes.changePassword);
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
