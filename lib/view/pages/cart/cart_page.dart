import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/cart/cart_loading.dart';
import 'package:restaurant_mobile/view/widgets/cart/custom_itemcart.dart';
import 'package:restaurant_mobile/view/widgets/cart/empty_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CartController>() == false) {
      Get.put(CartController());
    } else {
      Get.find<CartController>();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          Expanded(
            child: GetBuilder<CartController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                loadingWidget: const CartLoading(),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getAllProductsInCart();
                  },
                  child: controller.carts.isEmpty
                      ? const EmptyCartWidget()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: controller.carts.length,
                                separatorBuilder: (c, i) =>
                                    Divider(height: 20.h),
                                itemBuilder: (c, i) => CustomItemCart(
                                    cartModel: controller.carts[i]),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total price",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                GetBuilder<CartController>(
                                    id: "totalPrice",
                                    builder: (context) {
                                      return Text(
                                        "${controller.totalPrice.toStringAsFixed(2)} DH",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.secondColor,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            CustomButton(
                              width: double.maxFinite,
                              title: "Order",
                              titleColor: AppColors.whiteColor,
                              buttonColor: AppColors.secondColor,
                              fontWeight: FontWeight.bold,
                              titleSize: 20.sp,
                              onPressed: () {
                                controller.goToPaymentPage();
                              },
                            )
                          ],
                        ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
