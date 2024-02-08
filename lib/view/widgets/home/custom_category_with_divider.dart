import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class CustomCategoryWithDivider extends StatelessWidget {
  const CustomCategoryWithDivider({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: ColoredBox(
            color: Colors.grey,
            child: SizedBox(height: 3.h),
          ),
        ),
        SizedBox(width: 10.w),
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(0),
            ),
          ),
          child: Text('View All',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondColor,
              )),
        )
      ],
    );
  }
}
