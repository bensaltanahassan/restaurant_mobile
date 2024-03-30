import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/view/widgets/favoris/custom_favorisitem.dart';
import 'package:restaurant_mobile/view/widgets/favoris/favoris_loading.dart';
import 'package:restaurant_mobile/view/widgets/favoris/no_favoris.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<FavorisController>()) {
      Get.find<FavorisController>();
    } else {
      Get.put(FavorisController());
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20).r,
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
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                loadingWidget: const FavorisLoading(),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getAllFavoris();
                  },
                  child: controller.favorites.isEmpty
                      ? const NoFavorisWidget()
                      : ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.favorites.length,
                          separatorBuilder: (c, i) => Divider(height: 30.h),
                          itemBuilder: (c, i) => CustomItemFavoris(
                              favoris: controller.favorites[i],
                              onTap: () => controller.goToProductDetail(
                                  productModel:
                                      controller.favorites[i].product!),
                              onDelete: () => controller
                                  .deleteFavorite(controller.favorites[i])),
                        ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
