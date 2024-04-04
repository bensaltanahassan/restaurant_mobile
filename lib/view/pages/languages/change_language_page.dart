import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/languages/change_language_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeLanguageController());
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.h,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
        child: CustomButton(
          height: 80.h,
          width: double.maxFinite,
          buttonColor: AppColors.secondColor,
          onPressed: () {
            controller.changeLanguage();
          },
          widget: Text(
            AppLocalizations.of(context)!.save,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.changeLanguage),
        leading: const CustomBackButton(),
      ),
      body: GetBuilder<ChangeLanguageController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourLanguage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  AppLocalizations.of(context)!.selectTheLanguage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(height: 50.h),
                CustomLanguageChoice(
                  language: AppLocalizations.of(context)!.english,
                  flag: AppImageAsset.usa,
                  onTap: () {
                    controller.onLanguageSelected("en");
                  },
                  isSelected: controller.selectedLanguage == "en",
                ),
                SizedBox(height: 20.h),
                CustomLanguageChoice(
                  language: AppLocalizations.of(context)!.french,
                  flag: AppImageAsset.france,
                  onTap: () {
                    controller.onLanguageSelected("fr");
                  },
                  isSelected: controller.selectedLanguage == "fr",
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CustomLanguageChoice extends StatelessWidget {
  const CustomLanguageChoice({
    super.key,
    required this.language,
    required this.flag,
    required this.onTap,
    required this.isSelected,
  });
  final String language;
  final String flag;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondColor : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isSelected ? AppColors.whiteColor : AppColors.secondColor,
          width: 2.w,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            ClipOval(
              child: SvgPicture.asset(
                flag,
                width: 50.w,
                height: 50.h,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              language,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
