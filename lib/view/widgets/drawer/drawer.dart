import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<ContainerController>();
    return GetBuilder<ContainerController>(builder: (controller) {
      return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: AppColors.secondColor))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10).r,
                    child: CustomNetworkImage(
                      imageUrl: controller.myServices.user!.image?.url,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.myServices.user!.fullName!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            style: const ButtonStyle(
                                padding:
                                    MaterialStatePropertyAll(EdgeInsets.zero)),
                            onPressed: () {
                              controller.onDrawerChanged(4, context);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.viewProfile,
                              style:
                                  const TextStyle(color: AppColors.secondColor),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDrawetItem(
                    title: "Home",
                    icon: Icons.home_outlined,
                    onPressed: () {
                      controller.onDrawerChanged(0, context);
                    },
                    isSelected: controller.currentIndex == 0,
                  ),
                  SizedBox(height: 10.h),
                  CustomDrawetItem(
                    title: "Cart",
                    icon: Icons.shopping_basket_outlined,
                    onPressed: () {
                      controller.onDrawerChanged(1, context);
                    },
                    isSelected: controller.currentIndex == 1,
                  ),
                  SizedBox(height: 10.h),
                  CustomDrawetItem(
                    title: AppLocalizations.of(context)!.search,
                    icon: Icons.search_outlined,
                    onPressed: () {
                      controller.onDrawerChanged(2, context);
                    },
                    isSelected: controller.currentIndex == 2,
                  ),
                  SizedBox(height: 10.h),
                  CustomDrawetItem(
                    title: AppLocalizations.of(context)!.favorites,
                    icon: Icons.favorite_outline,
                    onPressed: () {
                      controller.onDrawerChanged(3, context);
                    },
                    isSelected: controller.currentIndex == 3,
                  ),
                  SizedBox(height: 10.h),
                  CustomDrawetItem(
                    title: AppLocalizations.of(context)!.contactUs,
                    icon: Icons.phone_outlined,
                    onPressed: () {},
                  ),
                  SizedBox(height: 10.h),
                  CustomDrawetItem(
                    title: AppLocalizations.of(context)!.changeLanguage,
                    icon: Icons.translate_outlined,
                    onPressed: controller.goToChangeLanguagePage,
                  ),
                  SizedBox(height: 10.h),
                  CustomDrawetItem(
                    title: AppLocalizations.of(context)!.bookTable,
                    icon: Icons.table_chart_outlined,
                    onPressed: controller.goToReservationPage,
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: CustomButton(
                radius: 30,
                buttonColor: AppColors.secondColor,
                title: AppLocalizations.of(context)!.logout,
                titleColor: AppColors.whiteColor,
                onPressed: controller.logout,
              ),
            ),
            SizedBox(height: 20.h)
          ],
        ),
      );
    });
  }
}

class CustomDrawetItem extends StatelessWidget {
  const CustomDrawetItem({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      ),
      label: Text(
        title,
        style: TextStyle(
            color: isSelected ? AppColors.primaryColor : AppColors.whiteColor),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(isSelected
              ? AppColors.secondColor
              : AppColors.primaryColor.withBlue(40)),
          minimumSize:
              const MaterialStatePropertyAll(Size(double.maxFinite, 1)),
          alignment: Alignment.centerLeft,
          padding: MaterialStatePropertyAll(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r)),
    );
  }
}
