import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/welcome_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20).r,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImageAsset.logo, width: 200.w, height: 200.h),
                Text(
                  'Restaurant Akhawayn',
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.subtitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  title: AppLocalizations.of(context)!.login,
                  titleColor: AppColors.whiteColor,
                  titleSize: 20.sp,
                  buttonColor: AppColors.secondColor,
                  width: double.infinity,
                  fontWeight: FontWeight.bold,
                  onPressed: controller.goToLoginPage,
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  title: AppLocalizations.of(context)!.register,
                  titleColor: AppColors.secondColor,
                  titleSize: 20.sp,
                  buttonColor: AppColors.whiteColor,
                  width: double.infinity,
                  fontWeight: FontWeight.bold,
                  onPressed: controller.goToRegisterPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
