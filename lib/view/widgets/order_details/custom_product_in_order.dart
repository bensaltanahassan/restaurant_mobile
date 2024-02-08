import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class CustomProductInOrder extends StatelessWidget {
  const CustomProductInOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      textColor: AppColors.whiteColor,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: Image.asset(AppImageAsset.pizza)),
      title: const Text("Pizza"),
      subtitle: Text("\$50.000",
          style: TextStyle(fontSize: 16.sp, color: AppColors.greyColor)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("\$100.00", style: TextStyle(fontSize: 16.sp)),
          Text("x2",
              style: TextStyle(fontSize: 16.sp, color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
