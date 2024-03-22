import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/home/home_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/view/widgets/home/custom_card_slider.dart';
import 'package:restaurant_mobile/view/widgets/home/custom_category_with_divider.dart';
import 'package:restaurant_mobile/view/widgets/home/custom_product_home.dart';
import 'package:restaurant_mobile/view/widgets/home/home_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
        id: 'home_status',
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            loadingWidget: const HomeLoading(),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0.h,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    aspectRatio: 16 / 9,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return CustomCardSlider(
                      tag: "slider$i",
                      onTap: () =>
                          controller.goToProductDetail(tag: "slider$i"),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10.h),
                CustomCategoryWithDivider(
                    title: 'PIZZA', onPressed: controller.goToProductsCategory),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 320.h,
                  child: ListView.separated(
                    itemBuilder: (c, i) => CustomProductHome(
                      tag: "pizza$i",
                      onTap: () => controller.goToProductDetail(tag: "pizza$i"),
                    ),
                    separatorBuilder: (c, i) => const SizedBox(width: 20),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                  ),
                ),
                CustomCategoryWithDivider(
                    title: 'BURGER',
                    onPressed: controller.goToProductsCategory),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 320.h,
                  child: ListView.separated(
                    itemBuilder: (c, i) => CustomProductHome(
                      tag: "burger$i",
                      onTap: () =>
                          controller.goToProductDetail(tag: "burger$i"),
                    ),
                    separatorBuilder: (c, i) => const SizedBox(width: 20),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
