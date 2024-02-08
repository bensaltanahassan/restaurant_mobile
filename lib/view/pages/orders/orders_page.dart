import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/orders/orders_controller.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mainPadding,
            vertical: AppDimensions.mainPadding / 2),
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 30,
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
