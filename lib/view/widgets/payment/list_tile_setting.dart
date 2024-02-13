import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonText,
  });

  final String title;
  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.secondColor,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
