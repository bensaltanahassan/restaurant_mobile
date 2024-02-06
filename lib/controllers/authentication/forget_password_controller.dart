import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ForgetPasswordController extends GetxController {
  final formState = GlobalKey<FormState>();

  void goToVerifyCodePage() {
    Get.toNamed(AppRoutes.verifyCodeForgetPassword);
  }
}
