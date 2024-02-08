import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class CustomProductInOrder extends StatelessWidget {
  const CustomProductInOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: AppColors.whiteColor,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(AppImageAsset.pizza)),
      title: const Text("Pizza"),
      subtitle: const Text("\$50.000",
          style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
      trailing: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("\$100.00", style: TextStyle(fontSize: 16)),
          Text("x2",
              style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
