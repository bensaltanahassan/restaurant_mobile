import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class CheckOutController extends GetxController {
  late OrderModel order;
  void initData() {
    order = Get.arguments["order"];
  }

  void goToProductDetail({required ProductModel productModel}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": productModel});
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
