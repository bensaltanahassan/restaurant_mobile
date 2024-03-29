import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(
        AppImageAsset.loadingButton,
        fit: BoxFit.fill,
        height: height ?? 100,
      ),
    );
  }
}
