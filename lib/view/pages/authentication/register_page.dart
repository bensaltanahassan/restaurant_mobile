import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/register_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImageAsset.logo,
                              width: 200.w,
                              height: 200.h,
                            ),
                            Expanded(
                              child: Text(
                                'Welcome!',
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
                        const CustomTextFormFieldAuth(
                          hintText: 'First Name',
                          labelText: 'First Name',
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(height: 20.h),
                        const CustomTextFormFieldAuth(
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(height: 20.h),
                        const CustomTextFormFieldAuth(
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: 20.h),
                        const CustomTextFormFieldAuth(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        SizedBox(height: 20.h),
                        const CustomTextFormFieldAuth(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          title: "Register",
                          titleSize: 20.sp,
                          titleColor: Colors.white,
                          buttonColor: AppColors.secondColor,
                          fontWeight: FontWeight.bold,
                          onPressed: () {},
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: controller.goToLoginPage,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.secondColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
