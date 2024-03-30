import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class NoFavorisWidget extends StatelessWidget {
  const NoFavorisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImageAsset.nofav, height: 200.h, width: 200.w),
        SizedBox(height: 20.h),
        Text(
          'No Favoris Found, Go to Home and add some',
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
