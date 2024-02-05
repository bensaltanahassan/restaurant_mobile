import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class StackAuth extends StatelessWidget {
  const StackAuth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: .08,
          child: Image.asset(
            AppImageAsset.pizza,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        child
      ],
    );
  }
}
