import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/favoris/custom_favorisitem.dart';
import 'package:restaurant_mobile/view/widgets/favoris/favoris_loading.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavorisController());
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: GetBuilder<FavorisController>(
          id: "main",
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              loadingWidget: const FavorisLoading(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favoris",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<FavorisController>(builder: (controller) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.favorites.length,
                        separatorBuilder: (c, i) => Divider(height: 30.h),
                        itemBuilder: (c, i) => CustomItemFavoris(
                          favoris: controller.favorites[i],
                          onTap: () =>
                              controller.goToProductDetail(tag: "pizza$i"),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
