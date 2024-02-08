import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomProductCategory extends StatelessWidget {
  const CustomProductCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10).r,
              image: const DecorationImage(
                image: AssetImage(AppImageAsset.pizza),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pizza',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Icon(Icons.favorite_outline,
                        color: AppColors.secondColor),
                  ],
                ),
                Expanded(
                    child: Text(
                  "data " * 100,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.greyColor,
                  ),
                )),
                Row(
                  children: [
                    Text(
                      '\$ 50.00',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      title: "Add Cart",
                      titleColor: AppColors.whiteColor,
                      buttonColor: AppColors.secondColor,
                      fontWeight: FontWeight.bold,
                      onPressed: () {},
                      radius: 20.r,
                      height: 30.h,
                      width: 00,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
