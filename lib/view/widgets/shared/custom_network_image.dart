import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const Center(
        child: Icon(
          Icons.person_outline,
          color: AppColors.secondColor,
          size: 50,
        ),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width?.w,
        height: height?.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(color: AppColors.secondColor),
        ),
      );
    }
  }
}
