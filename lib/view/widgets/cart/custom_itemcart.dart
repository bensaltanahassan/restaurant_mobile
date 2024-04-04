import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/localization/changelocal.dart';
import 'package:restaurant_mobile/data/model/cart_model.dart' as cm;
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({super.key, required this.cartModel});

  final cm.CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();
    final isEnglish = Get.find<LocaleController>().isEnglish;

    return SizedBox(
      height: 150.h,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () =>
            controller.goToProductDetail(productModel: cartModel.product!),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: cartModel.product!.productImages![0].image!.publicId!,
                child: CustomNetworkImage(
                  imageUrl: cartModel.product!.productImages![0].image!.url!,
                  width: 100,
                  height: 150,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            isEnglish
                                ? cartModel.product!.nameAn!
                                : cartModel.product!.name!,
                            style: TextStyle(
                              fontSize: 20.sp,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            )),
                        Text(
                          isEnglish
                              ? cartModel.product!.descriptionAn!
                              : cartModel.product!.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CustomButton(
                              width: 1,
                              buttonColor: AppColors.secondColor,
                              title: "-",
                              titleColor: AppColors.whiteColor,
                              titleSize: 20.sp,
                              onPressed: () {
                                controller.changeQuantity(
                                    quantity: -1, cart: cartModel);
                              },
                            ),
                            const SizedBox(width: 10),
                            GetBuilder<CartController>(
                                id: "quantity/${cartModel.id}",
                                builder: (context) {
                                  return Text(
                                    cartModel.quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.whiteColor,
                                    ),
                                  );
                                }),
                            SizedBox(width: 10.w),
                            CustomButton(
                              width: 1,
                              buttonColor: AppColors.secondColor,
                              title: "+",
                              titleColor: AppColors.whiteColor,
                              titleSize: 20.sp,
                              onPressed: () {
                                controller.changeQuantity(
                                    quantity: 1, cart: cartModel);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("${cartModel.product!.price} DH",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondColor,
                                )),
                            const Spacer(),
                            GetBuilder<CartController>(
                                id: "delete/${cartModel.id}",
                                builder: (controller) {
                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child: controller.statusRequest ==
                                            StatusRequest.loading
                                        ? const CircularProgressIndicator()
                                        : IconButton(
                                            onPressed: () =>
                                                controller.delete(cartModel),
                                            icon: Icon(
                                              Icons.delete_outline,
                                              color: AppColors.whiteColor,
                                              size: 25.r,
                                            )),
                                  );
                                })
                          ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
