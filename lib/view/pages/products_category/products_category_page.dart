import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_mobile/controllers/products_category/products_category_controller.dart';
import 'package:restaurant_mobile/core/class/handlingdataview.dart';
import 'package:restaurant_mobile/core/localization/changelocal.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/view/pages/products_category/products_category_loading.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_network_image.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_product.dart';

class ProductsCategoryPage extends StatelessWidget {
  const ProductsCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsCategoryController());
    final bool isEnglish = Get.find<LocaleController>().isEnglish;
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              floating: true,
              leading: const SizedBox(),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(isEnglish
                    ? controller.category.nameAn!
                    : controller.category.name!),
                background: CustomNetworkImage(
                    imageUrl: controller.category.image?.url),
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GetBuilder<ProductsCategoryController>(
              id: "main",
              builder: (controller) {
                return HandlingDataView(
                  // statusRequest: controller.statusRequest,
                  loadingWidget: const ProductsCategoryLoading(),
                  child: PagedListView<int, ProductModel>(
                    pagingController: controller.pagingController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                            .r,
                    builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                      itemBuilder: (context, item, i) => CustomProductCategory(
                        product: item,
                        onTap: () =>
                            controller.goToProductDetail(product: item),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
