import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    super.key,
    required this.tag,
    this.onTap,
  });

  final String tag;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: tag,
                child: Image.asset(
                  AppImageAsset.pizza,
                  width: 80.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pizza hot gamberi",
                            style: TextStyle(
                              fontSize: 20.sp,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            )),
                        Text(
                          "Lorem " * 20,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CustomButton(
                              width: 1,
                              buttonColor: AppColors.secondColor,
                              title: "-",
                              titleColor: AppColors.whiteColor,
                              titleSize: 20.sp,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            CustomButton(
                              width: 1,
                              buttonColor: AppColors.secondColor,
                              title: "+",
                              titleColor: AppColors.whiteColor,
                              titleSize: 20.sp,
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("\$500.00",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondColor,
                                )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: AppColors.whiteColor,
                                  size: 25.r,
                                ))
                          ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
