import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/favoris/custom_favorisitem.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Favoris",
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
              separatorBuilder: (c, i) => const Divider(height: 30),
              itemBuilder: (c, i) => const CustomItemFavoris(),
            ),
          ),
        ],
      ),
    );
  }
}
