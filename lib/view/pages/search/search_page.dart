import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_mobile/controllers/search/search_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/view/widgets/search/no_food.dart';
import 'package:restaurant_mobile/view/widgets/search/search_for_food.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodsController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.mainPadding)
          .copyWith(top: AppDimensions.mainPadding)
          .r,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  hintText: AppLocalizations.of(context)!.search,
                  controller: controller.searchController,
                  trailing: [
                    IconButton(
                      onPressed: controller.searchForProduct,
                      icon: Icon(
                        Icons.search_outlined,
                        color: AppColors.primaryColor,
                        size: 30.r,
                      ),
                    )
                  ],
                  side: const MaterialStatePropertyAll(
                      BorderSide(color: AppColors.secondColor)),
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text(AppLocalizations.of(context)!.all),
                      onTap: () {
                        controller.categoryId = null;
                      },
                    ),
                    ...controller.categories
                        .map((e) => PopupMenuItem(
                              value: e.id,
                              child: Text(e.name!),
                              onTap: () {
                                controller.categoryId = e.id;
                              },
                            ))
                        .toList()
                  ];
                },
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.secondColor,
                  size: 30.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
              child: GetBuilder<SearchFoodsController>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: PagedListView<int, ProductModel>(
                pagingController: controller.pagingController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
                builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                  noItemsFoundIndicatorBuilder: (context) => const Center(
                    child: NoFoodWidget(),
                  ),
                  firstPageErrorIndicatorBuilder: (context) => const Center(
                    child: SearchForFood(),
                  ),
                  itemBuilder: (context, item, i) => CustomProductCategory(
                    product: item,
                    onTap: () => controller.goToProductDetail(product: item),
                  ),
                ),
              ),
            );
          })),
        ],
      ),
    );
  }
}
