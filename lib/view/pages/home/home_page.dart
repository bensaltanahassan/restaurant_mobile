import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/home/home_controller.dart';
import 'package:restaurant_mobile/view/widgets/home/custom_card_slider.dart';
import 'package:restaurant_mobile/view/widgets/home/custom_category_with_divider.dart';
import 'package:restaurant_mobile/view/widgets/home/custom_product_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            aspectRatio: 16 / 9,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return const CustomCardSlider();
          }).toList(),
        ),
        const SizedBox(height: 10),
        CustomCategoryWithDivider(
            title: 'PIZZA', onPressed: controller.goToProductsCategory),
        const SizedBox(height: 10),
        SizedBox(
          height: 320,
          child: ListView.separated(
            itemBuilder: (c, i) => const CustomProductHome(),
            separatorBuilder: (c, i) => const SizedBox(width: 20),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ),
        CustomCategoryWithDivider(
            title: 'BURGER', onPressed: controller.goToProductsCategory),
        const SizedBox(height: 10),
        SizedBox(
          height: 320,
          child: ListView.separated(
            itemBuilder: (c, i) => const CustomProductHome(),
            separatorBuilder: (c, i) => const SizedBox(width: 20),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
