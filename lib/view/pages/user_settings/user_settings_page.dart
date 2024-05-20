import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/user_settings/user_settings_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_animated_switcher.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_loading_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserSettingsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.userSettings),
        leading: const CustomBackButton(),
      ),
      bottomNavigationBar: GetBuilder<UserSettingsController>(
          id: "updateButton",
          builder: (_) {
            return Container(
              height: 80.h,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
              child: CustomAnimatedSwitcher(
                condition: controller.statusRequest == StatusRequest.loading,
                firstChild: CustomLoadingButton(
                  height: 80.h,
                ),
                secondChild: CustomButton(
                  height: 80.h,
                  width: double.maxFinite,
                  buttonColor: AppColors.secondColor,
                  onPressed: controller.updateUser,
                  widget: Text(
                    AppLocalizations.of(context)!.saveChanges,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
      body: Padding(
        padding: const EdgeInsets.only(
                left: AppDimensions.mainPadding,
                right: AppDimensions.mainPadding,
                top: AppDimensions.mainPadding)
            .r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 53.r,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 50.r,
                    child: GetBuilder<UserSettingsController>(
                        id: "image",
                        builder: (controller) {
                          return Stack(
                            children: [
                              if (controller.image == null)
                                ClipOval(
                                  child: CustomNetworkImage(
                                    width: double.maxFinite.w,
                                    height: double.maxFinite.h,
                                    imageUrl: controller.ms.user!.image?.url,
                                  ),
                                )
                              else
                                ClipOval(
                                  child: Image.file(
                                    controller.image!,
                                    width: 100.w,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: AppColors.whiteColor,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      controller.changePhoto(context);
                                    },
                                    icon: const Icon(Icons.camera_alt_outlined,
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.fullName,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              CustomTextFormField(
                controller: controller.fullNameController,
                hintText: AppLocalizations.of(context)!.fullName,
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.adress,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              CustomTextFormField(
                hintText: AppLocalizations.of(context)!.adress,
                keyboardType: TextInputType.text,
                controller: controller.adressController,
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.phoneNum,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              CustomTextFormField(
                controller: controller.phoneController,
                hintText: AppLocalizations.of(context)!.phoneNum,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 40.h)
            ],
          ),
        ),
      ),
    );
  }
}
