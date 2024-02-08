import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Hotgaaam'),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: AppDimensions.mainPadding,
            right: AppDimensions.mainPadding,
            bottom: AppDimensions.mainPadding),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                  buttonColor: AppColors.secondColor,
                  title: "Add to Cart",
                  titleColor: AppColors.whiteColor,
                  titleSize: 20,
                  fontWeight: FontWeight.bold,
                  onPressed: () {}),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: AppColors.secondColor,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.mainPadding),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppImageAsset.pizza,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 300,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Text(
                      'Delicious Pizza Hotgaaam',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "\$99.00",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(
                height: 1.5,
                fontSize: 20,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Lorem " * 20,
              style: const TextStyle(
                height: 1.5,
                fontSize: 16,
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Quantity",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 20,
                  color: AppColors.whiteColor,
                )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.secondColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '1',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
