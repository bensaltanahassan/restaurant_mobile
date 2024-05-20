import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:restaurant_mobile/controllers/authentication/verify_code_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: GetBuilder<VerifyCodeController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Image.asset(
                      AppImageAsset.logo,
                      width: 200.w,
                      height: 200.h,
                    ),
                    Expanded(
                      child: Text(
                        'Verify Code',
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter the code sent to your email ${controller.email}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Pinput(
                  controller: controller.pinController,
                  length: 5,
                  onCompleted: (pin) {},
                  defaultPinTheme: PinTheme(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.secondColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)).r,
                    ),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 2).r,
                  ),
                ),
                SizedBox(height: 20.h),
                TextButton(
                    onPressed: controller.resendCode,
                    child: Text('Resend Code',
                        style: TextStyle(
                          color: AppColors.secondColor,
                          fontSize: 18.sp,
                        ))),
                const Spacer(),
                CustomButton(
                  title: "Verify Code",
                  titleSize: 20.sp,
                  titleColor: Colors.white,
                  buttonColor: AppColors.secondColor,
                  fontWeight: FontWeight.bold,
                  width: double.infinity,
                  onPressed: controller.verifyCode,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        }),
      ),
    );
  }
}
