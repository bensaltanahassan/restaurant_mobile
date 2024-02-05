import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  void goToRegisterPage() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
