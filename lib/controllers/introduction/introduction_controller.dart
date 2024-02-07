import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/services/services.dart';

class IntroductionController extends GetxController {
  final introKey = GlobalKey<IntroductionScreenState>();
  final MyServices myServices = Get.find();
  void onDone() async {
    await myServices.sharedPreferences.setBool("intro", true);
    await Get.offAllNamed(AppRoutes.welcome);
  }

  void onSkip() async {
    await myServices.sharedPreferences.setBool("intro", true);
    await Get.offAllNamed(AppRoutes.welcome);
  }

  @override
  void onClose() {
    introKey.currentState?.dispose();
    super.onClose();
  }
}
