import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restaurant_mobile/controllers/introduction/introduction_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/data/datasource/static/static.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final IntroductionController controller = Get.put(IntroductionController());
    return Scaffold(
      body: StackAuth(
        child: IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            key: controller.introKey,
            done: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8).r,
                    side: const BorderSide(color: AppColors.secondColor),
                  ))),
              onPressed: controller.onDone,
              child: const Text(
                "Done",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.secondColor),
              ),
            ),
            next: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8).r,
                    side: const BorderSide(color: AppColors.secondColor),
                  ))),
              onPressed: controller.introKey.currentState?.next,
              child: const Text(
                "Next",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.secondColor),
              ),
            ),
            skip: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8).r,
                    side: const BorderSide(color: AppColors.secondColor),
                  ))),
              onPressed: controller.onSkip,
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.secondColor),
              ),
            ),
            onDone: controller.onDone,
            onSkip: controller.onSkip,
            showSkipButton: true,
            showNextButton: true,
            curve: Curves.fastLinearToSlowEaseIn,
            pages: StaticData.onBoardingList
                .map((e) => PageViewModel(
                      titleWidget: Text(
                        e.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      bodyWidget: Text(
                        e.body,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          height: 1.5,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      image: Center(
                          child: Image.asset(
                        e.image,
                        height: 200.h,
                      )),
                    ))
                .toList()),
      ),
    );
  }
}
