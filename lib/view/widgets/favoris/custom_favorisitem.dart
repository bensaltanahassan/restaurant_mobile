import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomItemFavoris extends StatelessWidget {
  const CustomItemFavoris({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImageAsset.pizza,
              width: 80,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Pizza hot gamberi",
                          style: TextStyle(
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          )),
                      Text(
                        "Lorem " * 20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.greyColor,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CustomButton(
                            width: 1,
                            buttonColor: AppColors.secondColor,
                            title: "-",
                            titleColor: AppColors.whiteColor,
                            titleSize: 20,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "1",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            width: 1,
                            buttonColor: AppColors.secondColor,
                            title: "+",
                            titleColor: AppColors.whiteColor,
                            titleSize: 20,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("\$500.00",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondColor,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: AppColors.whiteColor,
                                size: 25,
                              ))
                        ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
