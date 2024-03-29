import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/cart/cart_data.dart';
import 'package:restaurant_mobile/data/datasource/remote/items/itemsdata.dart';
import 'package:restaurant_mobile/data/model/categoriesmodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/data/model/responses/products_category_model.dart';

class ProductsCategoryController extends GetxController {
  late StatusRequest statusRequest;
  late CategoryModel category;
  final MyServices myServices = Get.find<MyServices>();
  final cd = Cartdata(Get.find());
  final sv = Get.find<MyServices>();
  final ProductsData pd = ProductsData(Get.find<Crud>());
  final _pageSize = 10;
  int currentPage = 1;

  List<ProductModel> products = [];
  ProductsCategoryModel? data;

  final PagingController<int, ProductModel> pagingController =
      PagingController(firstPageKey: 1);

  void goToProductDetail({required ProductModel product}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": product});
  }

  Future<List<int>> getData(int page) async {
    final newItems = List<int>.generate(10, (index) => index + page * 10);
    return newItems;
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      var response = await pd.getAllProducts(
        token: myServices.user!.token ?? "",
        filtre: {
          "categoryId": category.id,
          "page": currentPage,
          "limit": _pageSize,
        },
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        data = ProductsCategoryModel.fromJson(response);
        if (data?.status == true) {
          if (data!.products!.isNotEmpty) {
            final isLastPage = data!.products!.length < _pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(data!.products!);
            } else {
              final nextPageKey = pageKey + data!.products!.length;
              currentPage++;
              pagingController.appendPage(data!.products!, nextPageKey);
            }
          } else {}
        } else {}
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  initData() {
    Get.isRegistered<FavorisController>()
        ? Get.find<FavorisController>()
        : Get.put(FavorisController(), permanent: true);
    Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController(), permanent: true);
    statusRequest = StatusRequest.loading;
    category = Get.arguments["category"];
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey).then((value) {
        statusRequest = StatusRequest.success;
        update(["main"]);
      });
    });
  }

  @override
  void onInit() {
    initData();

    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
