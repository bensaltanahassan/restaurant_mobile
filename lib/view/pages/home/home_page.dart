import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/home/home_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/drawer/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30.0,
                color: AppColors.whiteColor,
              );
            },
          ),
        ),
        drawer: const CustomDrawer(),
        body: ListView(
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
        ));
  }
}

class CustomCategoryWithDivider extends StatelessWidget {
  const CustomCategoryWithDivider({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: ColoredBox(
            color: Colors.grey,
            child: SizedBox(height: 3),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(0),
            ),
          ),
          child: const Text('View All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.secondColor,
              )),
        )
      ],
    );
  }
}

class CustomProductHome extends StatelessWidget {
  const CustomProductHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(AppImageAsset.pizza),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'PIZZA HOT  czac zac GAM',
            style: TextStyle(
              height: 1.5,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '\$ 20.00',
            style: TextStyle(
              height: 1.5,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 5),
          CustomButton(
            title: "Add Cart",
            fontWeight: FontWeight.bold,
            titleColor: Colors.white,
            buttonColor: AppColors.secondColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class CustomCardSlider extends StatelessWidget {
  const CustomCardSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      height: 250,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.secondColor,
          image: DecorationImage(
            image: AssetImage(AppImageAsset.pizza),
            fit: BoxFit.fill,
            opacity: 0.5,
          )),
      child: const Text(
        'Different kind of food',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
