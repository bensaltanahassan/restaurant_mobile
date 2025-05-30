import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ProfileController extends GetxController {
  final ms = Get.find<MyServices>();
  final ContainerController containerController =
      Get.find<ContainerController>();
  void goToUserSettings() => Get.toNamed(AppRoutes.userSettings);
  void goToChangePassword() async {
    await showModalBottomSheet(
        backgroundColor: AppColors.primaryColor,
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            height: 500.h,
            padding: const EdgeInsets.all(AppDimensions.mainPadding),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.changePassword,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: AppLocalizations.of(context)!.newPassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: AppLocalizations.of(context)!.confirmPassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const Spacer(),
                CustomButton(
                  width: double.maxFinite,
                  buttonColor: AppColors.secondColor,
                  title: AppLocalizations.of(context)!.save,
                  titleColor: AppColors.whiteColor,
                  onPressed: () {},
                  titleSize: 20.sp,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          );
        });
  }

  void goToRecentOrders() => Get.toNamed(AppRoutes.myOrders);
  void goToNotifications() => Get.toNamed(AppRoutes.notifications);
  Future<void> logout() async {
    await Get.offAllNamed(AppRoutes.login);
  }

  void goToFavorite() => containerController.onDrawerChanged(3, Get.context!);
}
