import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/change_password_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/core/functions/validationtextformfield/validinput.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: GetBuilder<ChangePasswordController>(builder: (controller) {
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
                          'Change Password!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  CustomTextFormField(
                    labelText: 'New Password',
                    hintText: 'New Password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (p0) => AppValidation.validInput(
                      val: p0 ?? "",
                      type: "password",
                      lowerCase: true,
                      upperCase: true,
                      specialChar: true,
                      min: 6,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: controller.confirmPasswordController,
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (p0) {
                      if (p0 != controller.newPasswordController.text) {
                        return "Password not match";
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    title: "Change Password",
                    titleSize: 20.sp,
                    titleColor: Colors.white,
                    buttonColor: AppColors.secondColor,
                    fontWeight: FontWeight.bold,
                    onPressed: controller.changePassword,
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
