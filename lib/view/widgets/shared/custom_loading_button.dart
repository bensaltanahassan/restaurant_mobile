import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(
        AppImageAsset.loadingButton,
        fit: BoxFit.fill,
        height: 100,
      ),
    );
  }
}
