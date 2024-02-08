import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/user_settings/user_settings_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserSettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                    backgroundImage: const AssetImage(AppImageAsset.hassan),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.whiteColor,
                        child: const Icon(Icons.camera_alt_outlined,
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "First Name",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              const CustomTextFormFieldAuth(
                hintText: "First Name",
                initialValue: "HASSAN",
              ),
              SizedBox(height: 20.h),
              Text(
                "Last Name",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              const CustomTextFormFieldAuth(
                hintText: "Last Name",
                initialValue: "BENSALTANA",
              ),
              SizedBox(height: 20.h),
              Text(
                "Email",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              const CustomTextFormFieldAuth(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                initialValue: "bensaltanahassan@gmail.com",
              ),
              SizedBox(height: 20.h),
              Text(
                "Phone",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              const CustomTextFormFieldAuth(
                hintText: "Phone",
                keyboardType: TextInputType.phone,
                initialValue: "1234567890",
              ),
              SizedBox(height: 40.h)
            ],
          ),
        ),
      ),
    );
  }
}
