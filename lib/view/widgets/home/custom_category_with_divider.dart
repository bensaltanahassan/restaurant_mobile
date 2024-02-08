import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class CustomCategoryWithDivider extends StatelessWidget {
  const CustomCategoryWithDivider({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: ColoredBox(
            color: Colors.grey,
            child: SizedBox(height: 3),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(0),
            ),
          ),
          child: const Text('View All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.secondColor,
              )),
        )
      ],
    );
  }
}
