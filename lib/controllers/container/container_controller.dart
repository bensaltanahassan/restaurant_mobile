import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
