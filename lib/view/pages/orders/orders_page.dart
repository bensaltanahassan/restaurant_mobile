import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/orders/orders_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        leading: const CustomBackButton(),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.mainPadding,
                vertical: AppDimensions.mainPadding / 2)
            .r,
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 30.h,
            color: AppColors.greyColor,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: const Text('Order #1234'),
            subtitle: const Text('Order Date: 12/12/2021'),
            trailing: const Text('Total: \$100.00'),
            onTap: () {
              Get.toNamed(AppRoutes.orderdetails);
            },
          );
        },
      ),
    );
  }
}
