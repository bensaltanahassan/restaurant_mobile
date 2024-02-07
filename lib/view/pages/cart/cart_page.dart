import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';
import 'package:restaurant_mobile/view/widgets/cart/custom_itemcart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              separatorBuilder: (c, i) => const Divider(height: 20),
              itemBuilder: (c, i) => const CustomItemCart(),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total price",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                "\$500.00",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomButton(
            width: double.maxFinite,
            title: "Order",
            titleColor: AppColors.whiteColor,
            buttonColor: AppColors.secondColor,
            fontWeight: FontWeight.bold,
            titleSize: 20,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
