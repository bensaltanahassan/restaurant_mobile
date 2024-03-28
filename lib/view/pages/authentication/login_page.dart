import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/login_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/core/functions/validationtextformfield/validinput.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_animated_switcher.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_loading_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: controller.goToRegisterPage,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.secondColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
        body: GetBuilder<LoginController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Form(
              key: controller.formState,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100.h),
                    Row(
                      children: [
                        Image.asset(
                          AppImageAsset.logo,
                          width: 200.w,
                          height: 200.h,
                        ),
                        Expanded(
                          child: Text(
                            'Welcome Back!',
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
                    CustomTextFormField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (p0) => AppValidation.validInput(
                          val: p0 ?? "", type: "email"),
                    ),
                    SizedBox(height: 20.h),
                    GetBuilder<LoginController>(
                        id: 'password',
                        builder: (controller) {
                          return CustomTextFormField(
                              controller: controller.passwordController,
                              validator: (p0) =>
                                  AppValidation.validInput(val: p0 ?? ""),
                              hintText: 'Password',
                              labelText: 'Password',
                              prefixIcon: Icons.lock,
                              isPassword: !controller.showPassword,
                              suffixIcon: IconButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.only(right: 10).r,
                                  ),
                                ),
                                onPressed: () {
                                  controller.setShowPassword();
                                },
                                icon: AnimatedSwitcher(
                                  duration: const Duration(seconds: 5),
                                  switchInCurve: Curves.easeInCubic,
                                  switchOutCurve: Curves.easeOutCubic,
                                  child: controller.showPassword
                                      ? const Icon(Icons.visibility,
                                          color: Colors.white)
                                      : const Icon(Icons.visibility_off,
                                          color: Colors.white),
                                ),
                              ));
                        }),
                    const SizedBox(height: 20),
                    GetBuilder<LoginController>(
                        id: 'login',
                        builder: (context) {
                          return CustomAnimatedSwitcher(
                            condition: controller.statusRequest ==
                                StatusRequest.loading,
                            firstChild: const CustomLoadingButton(),
                            secondChild: CustomButton(
                              title: "Login",
                              titleSize: 20.sp,
                              titleColor: Colors.white,
                              buttonColor: AppColors.secondColor,
                              fontWeight: FontWeight.bold,
                              onPressed: controller.login,
                              width: double.infinity,
                            ),
                          );
                        }),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: controller.goToForgetPasswordPage,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //  Spacer(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
