import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/pages/cart/cart_page.dart';
import 'package:restaurant_mobile/view/pages/favoris/favoris_page.dart';
import 'package:restaurant_mobile/view/pages/home/home_page.dart';
import 'package:restaurant_mobile/view/pages/profile/profile_page.dart';
import 'package:restaurant_mobile/view/pages/search/search_page.dart';
import 'package:restaurant_mobile/view/widgets/bottomnavbar/bottom_navbar_home.dart';
import 'package:restaurant_mobile/view/widgets/drawer/drawer.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<ContainerController>()
        ? Get.find<ContainerController>()
        : Get.put(ContainerController(), permanent: true);
    return Scaffold(
        bottomNavigationBar: const BottomNavBarHome(),
        appBar: AppBar(
          title: const Text("Restaurant App"),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30.h,
                color: AppColors.whiteColor,
              );
            },
          ),
        ),
        drawer: const CustomDrawer(),
        body: PopScope(
          canPop: false,
          onPopInvoked: controller.onPopInvoked,
          child: GetBuilder<ContainerController>(builder: (controller) {
            return PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: const [
                HomePage(),
                CartPage(),
                SearchPage(),
                FavorisPage(),
                ProfilePage(),
              ],
            );
          }),
        ));
  }
}
