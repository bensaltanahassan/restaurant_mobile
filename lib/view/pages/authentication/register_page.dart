import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/authentication/register_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/core/functions/validationtextformfield/validinput.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/authentication/stack_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_animated_switcher.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_loading_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return StackAuth(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(.01),
        body: GetBuilder<RegisterController>(builder: (controller) {
          return Padding(
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
                                  AppLocalizations.of(context)!.welcome,
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
                            controller: controller.firstNameController,
                            hintText: AppLocalizations.of(context)!.firstName,
                            labelText: AppLocalizations.of(context)!.firstName,
                            prefixIcon: Icons.person,
                            validator: (p0) => AppValidation.validInput(
                              val: p0 ?? "",
                              type: "name",
                              min: 3,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            controller: controller.lastNameController,
                            hintText: AppLocalizations.of(context)!.lastName,
                            labelText: AppLocalizations.of(context)!.lastName,
                            prefixIcon: Icons.person,
                            validator: (p0) => AppValidation.validInput(
                              val: p0 ?? "",
                              type: "name",
                              min: 3,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                              controller: controller.emailController,
                              hintText: AppLocalizations.of(context)!.email,
                              labelText: AppLocalizations.of(context)!.email,
                              prefixIcon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (p0) => AppValidation.validInput(
                                  val: p0 ?? "", type: "email")),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            controller: controller.passwordController,
                            hintText: AppLocalizations.of(context)!.password,
                            labelText: AppLocalizations.of(context)!.password,
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
                            hintText:
                                AppLocalizations.of(context)!.confirmPassword,
                            labelText:
                                AppLocalizations.of(context)!.confirmPassword,
                            prefixIcon: Icons.lock,
                            validator: (p0) {
                              if (p0 != controller.passwordController.text) {
                                return AppLocalizations.of(context)!
                                    .passwordsNotMatch;
                              }
                              return null;
                            },
                            isPassword: true,
                          ),
                          SizedBox(height: 20.h),
                          GetBuilder<RegisterController>(
                              id: "register",
                              builder: (_) {
                                return CustomAnimatedSwitcher(
                                  condition: controller.statusRequest ==
                                      StatusRequest.loading,
                                  firstChild: const CustomLoadingButton(),
                                  secondChild: CustomButton(
                                    title:
                                        AppLocalizations.of(context)!.register,
                                    titleSize: 20.sp,
                                    titleColor: Colors.white,
                                    buttonColor: AppColors.secondColor,
                                    fontWeight: FontWeight.bold,
                                    onPressed: controller.register,
                                    width: double.infinity,
                                  ),
                                );
                              })
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
                        AppLocalizations.of(context)!.alreadyHaveAccount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: controller.goToLoginPage,
                          child: Text(
                            AppLocalizations.of(context)!.login,
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
          );
        }),
      ),
    );
  }
}
