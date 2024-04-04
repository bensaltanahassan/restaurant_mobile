import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class BottomNavBarHome extends StatelessWidget {
  const BottomNavBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<ContainerController>();
    return GetBuilder<ContainerController>(builder: (controller) {
      return ConvexAppBar(
        height: 60,
        style: TabStyle.react,
        backgroundColor: AppColors.primaryColorGradient,
        activeColor: AppColors.secondColor,
        color: AppColors.greyColor,
        items: [
          TabItem(
              icon: Icons.home_outlined,
              title: AppLocalizations.of(context)!.home),
          TabItem(
              icon: Icons.shopping_basket_outlined,
              title: AppLocalizations.of(context)!.cart),
          TabItem(
              icon: Icons.search, title: AppLocalizations.of(context)!.search),
          TabItem(
              icon: Icons.favorite_outline,
              title: AppLocalizations.of(context)!.favorites),
          TabItem(
              icon: Icons.person_outline,
              title: AppLocalizations.of(context)!.profile),
        ],
        onTap: controller.onBottomNavBarChanged,
        controller: controller.tabController,
        initialActiveIndex: 0,
      );
    });
  }
}
