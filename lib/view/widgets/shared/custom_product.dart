import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/controllers/products_category/products_category_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_animated_switcher.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_loading_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomProductCategory extends StatelessWidget {
  const CustomProductCategory({
    super.key,
    this.onTap,
    required this.product,
  });

  final void Function()? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Get.find<ProductsCategoryController>();
    Get.isRegistered<FavorisController>()
        ? Get.find<FavorisController>()
        : Get.put(FavorisController());
    Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController());

    return SizedBox(
      height: 180.h,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10).r,
              child: Hero(
                tag: product.productImages![0].image!.publicId!,
                child: CustomNetworkImage(
                  imageUrl: product.productImages![0].image!.url!,
                  height: 150.h,
                  width: 150.w,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        GetBuilder<FavorisController>(
                            id: "favButton/${product.id}",
                            builder: (favController) {
                              bool isFavorite = favController.favorites
                                      .indexWhere((element) =>
                                          element.product!.id == product.id) >=
                                  0;
                              return IconButton(
                                onPressed: () {
                                  if (isFavorite) {
                                    favController.deleteFavorite(favController
                                        .favorites
                                        .firstWhere((element) =>
                                            element.product!.id == product.id));
                                  } else {
                                    favController.addToFavoris(product);
                                  }
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: AppColors.secondColor,
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  Expanded(
                      child: Text(
                    product.description!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  )),
                  Row(
                    children: [
                      Text(
                        '\$ ${product.price}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const Spacer(),
                      GetBuilder<CartController>(
                          id: "button/${product.id}",
                          builder: (controller) {
                            return CustomAnimatedSwitcher(
                              condition: controller.loadingButtons,
                              secondChild: CustomButton(
                                title: "Add Cart",
                                titleColor: AppColors.whiteColor,
                                buttonColor: AppColors.secondColor,
                                fontWeight: FontWeight.bold,
                                onPressed: () {
                                  controller.addToCart(
                                      productId: product.id.toString());
                                },
                                radius: 20.r,
                                height: 30.h,
                                width: 00,
                              ),
                              firstChild: CustomLoadingButton(height: 60.h),
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
