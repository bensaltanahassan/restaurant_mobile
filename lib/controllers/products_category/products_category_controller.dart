import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ProductsCategoryController extends GetxController {
  late StatusRequest statusRequest;
  final searchController = TextEditingController();
  final _pageSize = 10;

  final PagingController<int, int> pagingController =
      PagingController(firstPageKey: 0);
  void goToProductDetail({required String tag}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"tag": tag});
  }

  Future<List<int>> getData(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final newItems = List<int>.generate(10, (index) => index + page * 10);
    return newItems;
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await getData(pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;

    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey).then((value) {
        statusRequest = StatusRequest.success;
        update(["main"]);
      });
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    pagingController.dispose();
    super.onClose();
  }
}
