import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

void showCustomSnackBar(
    {required String title,
    required String message,
    Duration? duration,
    FutureOr Function(void)? onClosed}) {
  Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.all(10),
      maxWidth: Get.width - 20,
      borderRadius: 4,

      animationDuration: const Duration(seconds: 2),
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      duration: duration ?? const Duration(seconds: 1, milliseconds: 500),
      backgroundColor: AppColors.secondColor,
      // backgroundGradient: const LinearGradient(
      //   colors: [
      //     // AppColors.primaryColor,
      //     AppColors.secondColor,
      //     AppColors.secondColor,
      //   ],
      // ),
    ),
  ).future.then((value) {
    if (onClosed != null) {
      onClosed(value);
    }
  });
}
