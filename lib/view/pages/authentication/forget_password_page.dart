import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/forget_password_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/core/functions/validationtextformfield/validinput.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: GetBuilder<ForgetPasswordController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Form(
              key: controller.formState,
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
                          'Forget Password!',
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
                      'Enter your email to reset your password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) => AppValidation.validInput(
                      val: p0 ?? "",
                      type: "email",
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    title: "Search",
                    titleSize: 20.sp,
                    titleColor: Colors.white,
                    buttonColor: AppColors.secondColor,
                    fontWeight: FontWeight.bold,
                    onPressed: controller.searchEmail,
                    width: double.infinity,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
