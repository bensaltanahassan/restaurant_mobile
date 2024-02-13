import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/booking/booking_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Table'),
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: const EdgeInsets.all(20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: AppColors.greyColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "12/12/2021",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: AppColors.whiteColor,
                    size: 30.r,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Time",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: const EdgeInsets.all(20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: AppColors.greyColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "12:00 PM",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Icon(
                    Icons.access_time,
                    color: AppColors.whiteColor,
                    size: 30.r,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Number of Person",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Expanded(
                  child: CustomTextFormFieldAuth(
                    borderColor: AppColors.greyColor,
                    hintText: "Number of Person",
                    fontColor: AppColors.greyColor,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.person,
                  color: AppColors.whiteColor,
                  size: 30.r,
                )
              ],
            ),
            const Spacer(),
            CustomButton(
              buttonColor: AppColors.secondColor,
              title: "Book Now",
              titleColor: AppColors.whiteColor,
              onPressed: () {},
              fontWeight: FontWeight.bold,
              titleSize: 18.sp,
              width: double.maxFinite,
            ),
          ],
        ),
      ),
    );
  }
}
