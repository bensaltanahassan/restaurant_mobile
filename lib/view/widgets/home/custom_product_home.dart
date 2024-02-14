import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomProductHome extends StatelessWidget {
  const CustomProductHome({
    super.key,
    required this.tag,
    required this.onTap,
  });

  final String tag;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 150.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20).r,
              child: Hero(
                tag: tag,
                child: Image.asset(
                  AppImageAsset.pizza,
                  fit: BoxFit.cover,
                  width: 150.w,
                  height: 150.w,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'PIZZA HOT  czac zac GAM',
              style: TextStyle(
                height: 1.5,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '\$ 20.00',
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
