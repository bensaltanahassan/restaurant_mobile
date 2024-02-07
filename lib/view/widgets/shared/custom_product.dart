import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomProductCategory extends StatelessWidget {
  const CustomProductCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AppImageAsset.pizza),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pizza',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Icon(Icons.favorite_outline, color: AppColors.secondColor),
                  ],
                ),
                Expanded(
                    child: Text(
                  "data " * 100,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                )),
                Row(
                  children: [
                    const Text(
                      '\$ 50.00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      title: "Add Cart",
                      titleColor: AppColors.whiteColor,
                      buttonColor: AppColors.secondColor,
                      fontWeight: FontWeight.bold,
                      onPressed: () {},
                      radius: 20,
                      height: 30,
                      width: 00,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
