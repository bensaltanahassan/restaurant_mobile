import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/data/datasource/remote/items/itemsdata.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/data/model/responses/search_response.dart';

class SearchFoodsController extends GetxController {
  StatusRequest? statusRequest;
  final searchController = TextEditingController();
  final pd = ProductsData(Get.find<Crud>());
  final PagingController<int, ProductModel> pagingController =
      PagingController(firstPageKey: 1);

  final _pageSize = 3;
  int currentPage = 1;
  SearchResponse searchResponse = SearchResponse(
    status: false,
    products: [],
  );

  void goToProductDetail({required ProductModel product}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": product});
  }

  Future<void> searchForProduct() async {
    FocusScope.of(Get.context!).unfocus();
    currentPage = 1;
    pagingController.refresh();
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      var response = await pd.searchForProduct(
        keyword: searchController.text,
        page: currentPage,
        limit: _pageSize,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        searchResponse = SearchResponse.fromJson(response);
        if (searchResponse.status == true) {
          if (searchResponse.products!.isNotEmpty) {
            final isLastPage = searchResponse.products!.length < _pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(searchResponse.products!);
            } else {
              final nextPageKey = pageKey + searchResponse.products!.length;
              currentPage++;
              pagingController.appendPage(
                  searchResponse.products!, nextPageKey);
            }
          } else {
            pagingController.appendLastPage([]);
          }
        } else {
          pagingController.appendLastPage([]);
        }
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void initData() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  @override
  void onInit() {
    Get.isRegistered<FavorisController>()
        ? Get.find<FavorisController>()
        : Get.put(FavorisController(), permanent: true);
    Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController(), permanent: true);
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
