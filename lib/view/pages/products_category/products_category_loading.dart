import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCategoryLoading extends StatelessWidget {
  const ProductsCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
      separatorBuilder: (context, i) => const SizedBox(height: 10),
      itemCount: 10,
      itemBuilder: (context, i) {
        return SizedBox(
          height: 150.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
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
                        Container(
                          height: 20.h,
                          width: 100.w,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 10.h,
                      width: double.maxFinite,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 10.h,
                      width: double.maxFinite,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 10.h,
                      width: double.maxFinite,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 10.h,
                      width: double.maxFinite,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
