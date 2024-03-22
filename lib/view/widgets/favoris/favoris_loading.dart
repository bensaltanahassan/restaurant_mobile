import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavorisLoading extends StatelessWidget {
  const FavorisLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
      separatorBuilder: (c, i) => Divider(height: 40.h),
      itemBuilder: (c, i) {
        return SizedBox(
          height: 100.h,
          child: Row(
            children: [
              Container(
                width: 80.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
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
                          Container(
                            height: 20.h,
                            width: 100.w,
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
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 20.h,
                                width: 100.w,
                                color: Colors.grey,
                              ),
                              const Spacer(),
                              Container(
                                height: 20.h,
                                width: 20.w,
                                color: Colors.grey,
                              ),
                            ])),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
