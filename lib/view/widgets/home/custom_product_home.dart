import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomProductHome extends StatelessWidget {
  const CustomProductHome({
    super.key,
    required this.onTap,
    required this.product,
  });

  final void Function()? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20).r,
                child: Hero(
                  tag: product.productImages!.first.image!.publicId!,
                  child: CustomNetworkImage(
                      imageUrl: product.productImages?.first.image?.url),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              product.name!,
              style: TextStyle(
                height: 1.5,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '\$ ${product.price}',
              style: TextStyle(
                height: 1.5,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 5.h),
            CustomButton(
              title: "Add Cart",
              fontWeight: FontWeight.bold,
              titleColor: Colors.white,
              buttonColor: AppColors.secondColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
