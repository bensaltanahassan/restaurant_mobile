import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ProfileController extends GetxController {
  final ContainerController containerController =
      Get.find<ContainerController>();
  void goToUserSettings() => Get.toNamed(AppRoutes.userSettings);
  void goToChangePassword() async {
    await showModalBottomSheet(
        backgroundColor: AppColors.primaryColor,
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            height: 500,
            padding: const EdgeInsets.all(AppDimensions.mainPadding),
            child: Column(
              children: [
                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomTextFormFieldAuth(
                  hintText: "New Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                const CustomTextFormFieldAuth(
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const Spacer(),
                CustomButton(
                  width: double.maxFinite,
                  buttonColor: AppColors.secondColor,
                  title: "Save",
                  titleColor: AppColors.whiteColor,
                  onPressed: () {},
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

  void goToFavorite() => containerController.onDrawerChanged(3);
}
