import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_mobile/controllers/authentication/verify_email_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_animated_switcher.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_loading_button.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyEmailController controller = Get.put(VerifyEmailController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Lottie.asset(
                    AppImageAsset.emailSent,
                    width: 150.w,
                    height: 150.h,
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.pleaseVerify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.verifyEmailDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                title: AppLocalizations.of(context)!.iHaveVerified,
                buttonColor: AppColors.secondColor,
                titleColor: AppColors.whiteColor,
                height: 50.h,
                fontWeight: FontWeight.bold,
                titleSize: 16.sp,
                width: double.maxFinite,
                onPressed: () {
                  controller.goToLoginPage();
                },
              ),
              SizedBox(height: 20.h),
              GetBuilder<VerifyEmailController>(
                  id: "resendEmailVerification",
                  builder: (controller) {
                    return CustomAnimatedSwitcher(
                      condition:
                          controller.statusRequest == StatusRequest.loading,
                      firstChild: const CustomLoadingButton(),
                      secondChild: TextButton(
                        onPressed: controller.resendEmailVerification,
                        child: Text(
                          AppLocalizations.of(context)!.resendVerificationEmail,
                          style: TextStyle(
                            color: AppColors.secondColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
