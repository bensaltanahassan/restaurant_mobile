import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void changePassword() {
    if (formState.currentState!.validate()) {
      print('change password');
      goToLoginPage();
    }
  }

  void goToLoginPage() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
