import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionController extends GetxController {
  final introKey = GlobalKey<IntroductionScreenState>();
  void onDone() {}
  void onSkip() {}

  @override
  void onClose() {
    introKey.currentState?.dispose();
    super.onClose();
  }
}
