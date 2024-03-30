import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_mobile/controllers/order_details/order_details_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/order_details/custom_listtile_orderdetails.dart';
import 'package:restaurant_mobile/view/widgets/order_details/custom_product_in_order.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_back_button.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderDetailsController());
    final dateFormat = DateFormat("dd/MM/yyyy");

    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER #${controller.orderArg.id}'),
        leading: const CustomBackButton(),
      ),
      body: GetBuilder<OrderDetailsController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          loadingWidget: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.mainPadding)
                .copyWith(bottom: 0)
                .r,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: controller.getOrderDetailsResponse.order == null
                    ? []
                    : [
                        CustomListTileOrderDetails(
                          title: "Status",
                          subtitle: controller
                              .getOrderDetailsResponse.order!.orderStatus!,
                        ),
                        SizedBox(height: (AppDimensions.mainSpacing / 2).h),
                        CustomListTileOrderDetails(
                          title: "Address",
                          subtitle:
                              controller.getOrderDetailsResponse.order!.adress!,
                        ),
                        SizedBox(height: (AppDimensions.mainSpacing / 2).h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomListTileOrderDetails(
                                title: "Phone",
                                subtitle: controller.getOrderDetailsResponse
                                    .order!.phoneNumber!,
                              ),
                            ),
                            SizedBox(width: (AppDimensions.mainSpacing / 2).w),
                            Expanded(
                              child: CustomListTileOrderDetails(
                                title: "Date",
                                subtitle: dateFormat.format(DateTime.parse(
                                    controller.getOrderDetailsResponse.order!
                                        .createdAt!)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: (AppDimensions.mainSpacing / 2).h),
                        CustomListTileOrderDetails(
                          title: "Payment Method",
                          subtitle: controller
                              .getOrderDetailsResponse.order!.paymentMethod!,
                        ),
                        SizedBox(height: (AppDimensions.mainSpacing / 2).h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10).r,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.greyColor),
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal:
                                              AppDimensions.mainSpacing / 2,
                                          vertical:
                                              AppDimensions.mainSpacing / 3)
                                      .r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Products in order",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor),
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .getOrderDetailsResponse
                                            .order!
                                            .orderItems!
                                            .length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                              height:
                                                  (AppDimensions.mainSpacing /
                                                          2)
                                                      .r);
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CustomProductInOrder(
                                            onTap: () {
                                              controller.goToProductDetail(
                                                productModel: controller
                                                    .getOrderDetailsResponse
                                                    .order!
                                                    .orderItems![index]
                                                    .product!,
                                              );
                                            },
                                            orderItem: controller
                                                .getOrderDetailsResponse
                                                .order!
                                                .orderItems![index],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                ColoredBox(
                                    color: AppColors.greyColor,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          textColor: AppColors.primaryColor,
                                          title: Text(
                                            "Total",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing: Text(
                                            "${controller.getOrderDetailsResponse.order!.totalPrice} DH",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
