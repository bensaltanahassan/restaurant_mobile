import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int currentIndex = 0;
  final pageController = PageController();
  late TabController tabController;

  void onPageChanged(int index) {
    currentIndex = index;
    tabController.animateTo(index);
    update();
  }

  void onBottomNavBarChanged(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  void onDrawerChanged(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    tabController.animateTo(index);
    update();
  }

  void goToReservationPage() {
    Get.toNamed(AppRoutes.reservation);
  }

  void onPopInvoked(bool didPop) {
    if (currentIndex == 0) {
      Get.defaultDialog(
        title: "Exit",
        middleText: "Do you want to exit the app?",
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("Yes"),
          ),
        ],
      );
    } else {
      currentIndex = 0;
      pageController.jumpToPage(0);
      tabController.animateTo(0);
      update();
    }
  }

  void logout() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    tabController.dispose();

    super.onClose();
  }
}
