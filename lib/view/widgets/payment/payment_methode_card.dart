import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class ChoicePaymentMethode extends StatelessWidget {
  const ChoicePaymentMethode(
      {super.key,
      required this.title,
      this.onPressed,
      required this.icon,
      required this.isSelected,
      required this.id});

  final String title;
  final String id;
  final void Function()? onPressed;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20).r,
        height: 150.h,
        width: 170.w,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.secondColor : AppColors.greyColor,
            borderRadius: BorderRadius.circular(10).r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10).r,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.greyColor.withOpacity(.4)
                    : AppColors.primaryColor.withOpacity(.15),
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Icon(
                icon,
                color:
                    isSelected ? AppColors.primaryColor : AppColors.secondColor,
                size: 40.r,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color:
                    isSelected ? AppColors.primaryColor : AppColors.secondColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
