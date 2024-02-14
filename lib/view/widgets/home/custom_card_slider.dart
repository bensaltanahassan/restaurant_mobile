import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class CustomCardSlider extends StatelessWidget {
  const CustomCardSlider({
    super.key,
    required this.tag,
    this.onTap,
  });

  final String tag;
  final void Function()? onTap;

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
              child: Hero(
                tag: tag,
                child: Image.asset(
                  AppImageAsset.pizza,
                  width: double.maxFinite,
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 250.h,
              color: Colors.black.withOpacity(0.3),
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20.w),
              child: Text(
                'Different kind of food',
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
