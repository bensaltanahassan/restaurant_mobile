import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  void changePassword() {
    goToLoginPage();
  }

  void goToLoginPage() {
    Get.offAllNamed(AppRoutes.login);
  }
}
