import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/checkout/checkout_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomProductCheckout extends StatelessWidget {
  const CustomProductCheckout({
    super.key,
    required this.orderItem,
  });

  final OrderItems orderItem;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckOutController>();
    return GestureDetector(
      onTap: () =>
          controller.goToProductDetail(productModel: orderItem.product!),
      child: SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8).r,
              child: Hero(
                tag: orderItem.product!.productImages![0].image!.publicId!,
                child: CustomNetworkImage(
                  imageUrl: orderItem.product!.productImages![0].image!.url!,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              orderItem.product!.name!,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            const Spacer(),
            Text(
              "x${orderItem.quantity}",
              style: TextStyle(
                fontSize: 14.sp,
                height: 1,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
