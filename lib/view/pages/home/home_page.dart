import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/home/home_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/data/model/home_model.dart' as hm;
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
    if (Get.isRegistered<HomeController>() == false) {
      Get.put(HomeController(), permanent: true);
    } else {
      Get.find<HomeController>().getHomeData();
    }
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
                    items: controller.homeModel?.topProducts!.map((e) {
                      return CustomCardSlider(
                        product: e,
                        onTap: () => controller.goToProductDetail(product: e),
                      );
                    }).toList()),
                SizedBox(height: 10.h),
                if (controller.homeModel != null)
                  ...controller.homeModel!.categories!.map(
                    (e) => CustomItemsHome(
                      category: e,
                    ),
                  )
              ],
            ),
          );
        });
  }
}

class CustomItemsHome extends StatelessWidget {
  const CustomItemsHome({
    super.key,
    required this.category,
  });

  final hm.Categories category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCategoryWithDivider(
            title: "${category.category!.name}",
            onPressed: () {
              controller.goToProductsCategory(category: category.category!);
            }),
        SizedBox(height: 10.h),
        SizedBox(
          height: 320.h,
          child: ListView.separated(
            itemBuilder: (c, i) => CustomProductHome(
              onTap: () => {
                controller.goToProductDetail(product: category.products![i])
              },
              product: category.products![i],
            ),
            separatorBuilder: (c, i) => const SizedBox(width: 20),
            itemCount: category.products?.length ?? 0,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        )
      ],
    );
  }
}
