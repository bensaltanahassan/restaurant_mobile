import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class SearchForFood extends StatelessWidget {
  const SearchForFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImageAsset.searchFood, height: 200.h, width: 200.w),
        const SizedBox(height: 20),
        Text(
          'Please search for food',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
