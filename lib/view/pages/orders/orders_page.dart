import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_mobile/controllers/orders/orders_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myOrders),
        leading: const CustomBackButton(),
      ),
      body: GetBuilder<OrdersController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          loadingWidget: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.mainPadding,
                    vertical: AppDimensions.mainPadding / 2)
                .r,
            itemCount: controller.getOrdersResponse.orders!.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 30.h,
                color: AppColors.greyColor,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return CustomOrder(
                order: controller.getOrdersResponse.orders![index],
                onTap: () {
                  controller.goToOrderDetail(
                      order: controller.getOrdersResponse.orders![index]);
                },
              );
            },
          ),
        );
      }),
    );
  }
}

class CustomOrder extends StatelessWidget {
  const CustomOrder({
    super.key,
    required this.order,
    required this.onTap,
  });

  final OrderModel order;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    final DateTime orderDate = DateTime.parse(order.createdAt!);
    final String formattedDate = dateFormat.format(orderDate);
    return ListTile(
      title: Text(AppLocalizations.of(context)!.orderWithId(order.id!)),
      subtitle: Text(
        AppLocalizations.of(context)!.orderDate(formattedDate),
      ),
      trailing: Text('Total: ${order.totalPrice} DH'),
      onTap: onTap,
    );
  }
}
