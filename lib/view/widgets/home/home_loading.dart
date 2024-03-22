import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
      children: [
        Container(
          height: 200.h,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              width: 150.w,
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ColoredBox(
                color: Colors.grey,
                child: SizedBox(height: 3.h),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 50.w,
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 320.h,
          child: ListView.separated(
            itemBuilder: (c, i) => Container(
                width: Get.width / 3,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey,
                )),
            separatorBuilder: (c, i) => const SizedBox(width: 20),
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              width: 150.w,
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ColoredBox(
                color: Colors.grey,
                child: SizedBox(height: 3.h),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 50.w,
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 320.h,
          child: ListView.separated(
            itemBuilder: (c, i) => Container(
                width: Get.width / 3,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey,
                )),
            separatorBuilder: (c, i) => const SizedBox(width: 20),
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
