import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restaurant_mobile/controllers/introduction/introduction_controller.dart';
import 'package:restaurant_mobile/data/datasource/static/static.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final IntroductionController controller = Get.put(IntroductionController());
    return IntroductionScreen(
        key: controller.introKey,
        done: const Text("Done"),
        next: const Text("Next"),
        skip: const Text("Skip"),
        onDone: controller.onDone,
        onSkip: controller.onSkip,
        showSkipButton: true,
        showNextButton: true,
        curve: Curves.fastLinearToSlowEaseIn,
        pages: StaticData.onBoardingList
            .map((e) => PageViewModel(
                  title: e.title,
                  body: e.body,
                  image: Center(
                      child: Image.asset(
                    e.image,
                    height: 200,
                  )),
                ))
            .toList());
  }
}
