import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/data/model/favorismodel.dart' as fv;

class CustomItemFavoris extends StatelessWidget {
  const CustomItemFavoris({
    super.key,
    this.onTap,
    required this.favoris,
  });

  final fv.FavorisModel favoris;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10).r,
              child: Hero(
                tag: favoris.id!,
                child: Image.network(
                  favoris.product!.productImages![0].image!.url!,
                  width: 80.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(favoris.product!.name!,
                            style: TextStyle(
                              fontSize: 20.sp,
                              height: 1,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            )),
                        Text(
                          favoris.product!.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("\$${favoris.product!.price}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondColor,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: AppColors.secondColor,
                                size: 25.r,
                              ))
                        ]),
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
