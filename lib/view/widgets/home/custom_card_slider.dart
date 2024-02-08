import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class CustomCardSlider extends StatelessWidget {
  const CustomCardSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      height: 250,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.secondColor,
          image: DecorationImage(
            image: AssetImage(AppImageAsset.pizza),
            fit: BoxFit.fill,
            opacity: 0.5,
          )),
      child: const Text(
        'Different kind of food',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
