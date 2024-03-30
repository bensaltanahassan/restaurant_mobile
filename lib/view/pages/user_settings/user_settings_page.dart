import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/user_settings/user_settings_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserSettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
        leading: const CustomBackButton(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
                left: AppDimensions.mainPadding,
                right: AppDimensions.mainPadding,
                bottom: AppDimensions.mainPadding)
            .r,
        child: CustomButton(
          buttonColor: AppColors.secondColor,
          title: "Save",
          titleColor: AppColors.whiteColor,
          titleSize: 20.sp,
          fontWeight: FontWeight.bold,
          onPressed: () {},
        ),
      ),
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
                  backgroundColor: AppColors.secondColor,
                  child: CircleAvatar(
                    radius: 50.r,
                    child: Stack(
                      children: [
                        if (controller.image == null)
                          CustomNetworkImage(
                            imageUrl: controller.ms.user!.image?.url,
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Full Name",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              CustomTextFormField(
                controller: controller.fullNameController,
                hintText: "Full Name",
              ),
              SizedBox(height: 20.h),
              Text(
                "Email",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              CustomTextFormField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
              SizedBox(height: 20.h),
              Text(
                "Phone",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              CustomTextFormField(
                controller: controller.phoneController,
                hintText: "Phone",
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
