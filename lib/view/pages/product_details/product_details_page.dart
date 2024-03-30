import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/controllers/product_details/product_details_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsController controller =
        Get.put(ProductDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.productModel.name!),
        leading: const CustomBackButton(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
                left: AppDimensions.mainPadding,
                right: AppDimensions.mainPadding,
                bottom: AppDimensions.mainPadding)
            .w,
        child: Row(
          children: [
            Expanded(
              child: GetBuilder<ProductDetailsController>(
                  id: "addToCartButton",
                  builder: (controller) {
                    return SizedBox(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: controller.statusRequest == StatusRequest.loading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                width: double.maxFinite,
                                buttonColor: AppColors.secondColor,
                                title: "Add to Cart",
                                titleColor: AppColors.whiteColor,
                                titleSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                onPressed: () {
                                  controller.addToCart();
                                }),
                      ),
                    );
                  }),
            ),
            SizedBox(width: 10.w),
            GetBuilder<FavorisController>(builder: (favController) {
              bool isFavorite = favController.favorites.indexWhere((element) =>
                      element.product!.id == controller.productModel.id) >=
                  0;
              return IconButton(
                onPressed: () {
                  if (isFavorite) {
                    favController.deleteFavorite(favController.favorites
                        .firstWhere((element) =>
                            element.product!.id == controller.productModel.id));
                  } else {
                    favController.addToFavoris(controller.productModel);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                  color: AppColors.secondColor,
                ),
              );
            })
          ],
        ),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.mainPadding),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0.h,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: controller.productModel.productImages!
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8).r,
                          child: Hero(
                            tag: e.image!.publicId!,
                            child: CustomNetworkImage(
                              imageUrl: e.image!.url!,
                              height: 250.h,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10).r,
                      child: Text(
                        controller.productModel.name!,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "\$${controller.productModel.price}",
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Description',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 20.sp,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                controller.productModel.description!,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16.sp,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: 20.h),
              Text("Quantity",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20.sp,
                    color: AppColors.whiteColor,
                  )),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50).r,
                      border: Border.all(color: AppColors.secondColor),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ).r,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            color: AppColors.primaryColor,
                            onPressed: controller.decrement,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GetBuilder<ProductDetailsController>(
                            id: "quantity",
                            builder: (controller) {
                              return Text(
                                controller.quantity.toString(),
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20.sp,
                                  color: AppColors.whiteColor,
                                ),
                              );
                            }),
                        SizedBox(width: 10.w),
                        Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ).r,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            color: AppColors.primaryColor,
                            onPressed: controller.increment,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<ProductDetailsController>(
                      id: "quantity",
                      builder: (context) {
                        return Text(
                          "${controller.totalPrice.toStringAsFixed(2)}\$",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 20.sp,
                            color: AppColors.secondColor,
                          ),
                        );
                      })
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
