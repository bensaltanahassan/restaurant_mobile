import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomProductHome extends StatelessWidget {
  const CustomProductHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productdetail);
      },
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(AppImageAsset.pizza),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'PIZZA HOT  czac zac GAM',
              style: TextStyle(
                height: 1.5,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '\$ 20.00',
              style: TextStyle(
                height: 1.5,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
              title: "Add Cart",
              fontWeight: FontWeight.bold,
              titleColor: Colors.white,
              buttonColor: AppColors.secondColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
