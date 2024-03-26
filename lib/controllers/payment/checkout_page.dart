import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/checkout/checkout_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          leading: const CustomBackButton(),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          children: [
            Text(
              "Shopping Cart",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8).r,
                        child: Image.asset(
                          AppImageAsset.pizza,
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "cartModel.product!.name!",
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "x23",
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
