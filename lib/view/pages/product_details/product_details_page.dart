import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/product_details/product_details_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Hotgaaam'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
                left: AppDimensions.mainPadding,
                right: AppDimensions.mainPadding,
                bottom: AppDimensions.mainPadding)
            .w,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                  buttonColor: AppColors.secondColor,
                  title: "Add to Cart",
                  titleColor: AppColors.whiteColor,
                  titleSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  onPressed: () {}),
            ),
            SizedBox(width: 10.w),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: AppColors.secondColor,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.mainPadding),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20).r,
              child: Image.asset(
                AppImageAsset.pizza,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 300.h,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10).r,
                    child: Text(
                      'Delicious Pizza Hotgaaam',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  "\$99.00",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Description',
              style: TextStyle(
                height: 1.5,
                fontSize: 20.sp,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Lorem " * 20,
              style: TextStyle(
                height: 1.5,
                fontSize: 16.sp,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: 20.h),
            Text("Quantity",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 20.sp,
                  color: AppColors.whiteColor,
                )),
            SizedBox(height: 10.h),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50).r,
                border: Border.all(color: AppColors.secondColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ).r,
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '1',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 20.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 50.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ).r,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
