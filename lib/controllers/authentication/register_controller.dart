import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class RegisterController extends GetxController {
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
    if (formState.currentState!.validate()) {
      print('register');
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
}
