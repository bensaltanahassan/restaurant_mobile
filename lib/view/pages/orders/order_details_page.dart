import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/order_details/custom_listtile_orderdetails.dart';
import 'package:restaurant_mobile/view/widgets/order_details/custom_product_in_order.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ORDER #1234'),
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
      body: Padding(
        padding:
            const EdgeInsets.all(AppDimensions.mainPadding).copyWith(bottom: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomListTileOrderDetails(
                title: "Status",
                subtitle: "Delivered",
              ),
              const SizedBox(height: AppDimensions.mainSpacing / 2),
              const CustomListTileOrderDetails(
                title: "Address",
                subtitle: "Jl. Raya Kedung Baruk No. 1",
              ),
              const SizedBox(height: AppDimensions.mainSpacing / 2),
              const Row(
                children: [
                  Expanded(
                    child: CustomListTileOrderDetails(
                      title: "Phone",
                      subtitle: "08123456789",
                    ),
                  ),
                  SizedBox(width: AppDimensions.mainSpacing / 2),
                  Expanded(
                    child: CustomListTileOrderDetails(
                      title: "Date",
                      subtitle: "12/12/2021",
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppDimensions.mainSpacing / 2),
              const CustomListTileOrderDetails(
                title: "Email",
                subtitle: "bensaltanahassan@gmail.com",
              ),
              const SizedBox(height: AppDimensions.mainSpacing / 2),
              const CustomListTileOrderDetails(
                title: "Payment Method",
                subtitle: "Cash",
              ),
              const SizedBox(height: AppDimensions.mainSpacing / 2),
              const CustomListTileOrderDetails(
                title: "Comment",
                subtitle: "No Comment",
              ),
              const SizedBox(height: AppDimensions.mainSpacing / 2),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.mainSpacing / 2,
                            vertical: AppDimensions.mainSpacing / 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Products in order",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor),
                            ),
                            CustomProductInOrder(),
                            SizedBox(height: AppDimensions.mainSpacing / 2),
                            CustomProductInOrder(),
                            SizedBox(height: AppDimensions.mainSpacing / 2),
                            CustomProductInOrder(),
                            SizedBox(height: AppDimensions.mainSpacing / 2),
                            CustomProductInOrder(),
                            SizedBox(height: AppDimensions.mainSpacing / 2),
                            CustomProductInOrder()
                          ],
                        ),
                      ),
                      ColoredBox(
                          color: AppColors.greyColor,
                          child: Column(
                            children: [
                              ListTile(
                                textColor: AppColors.primaryColor,
                                title: Text(
                                  "Subtotal",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "\$100.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                textColor: AppColors.primaryColor,
                                title: Text(
                                  "Shipping",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "\$10.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                textColor: AppColors.primaryColor,
                                title: Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "\$110.00",
                                  style: TextStyle(
                                    fontSize: 16,
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
  }
}
