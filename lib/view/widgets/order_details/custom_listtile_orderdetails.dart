import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class CustomListTileOrderDetails extends StatelessWidget {
  const CustomListTileOrderDetails({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
