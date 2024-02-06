import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  void goToLoginPage() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
