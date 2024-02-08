import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/change_password_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: Padding(
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
                const CustomTextFormFieldAuth(
                  labelText: 'New Password',
                  hintText: 'New Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                SizedBox(height: 20.h),
                const CustomTextFormFieldAuth(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
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
        ),
      ),
    );
  }
}
