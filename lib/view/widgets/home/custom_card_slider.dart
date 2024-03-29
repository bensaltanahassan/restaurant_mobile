import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';

class CustomCardSlider extends StatelessWidget {
  const CustomCardSlider({
    super.key,
    this.onTap,
    required this.product,
  });

  final void Function()? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 250.h,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20).r,
              child: CustomNetworkImage(
                imageUrl: product.productImages?.first.image?.url,
                width: double.maxFinite,
                height: 250.h,
              ),
            ),
            Container(
              height: 250.h,
              color: Colors.black.withOpacity(0.3),
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20.w),
              child: Text(
                product.name!,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
