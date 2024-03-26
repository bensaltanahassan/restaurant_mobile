import 'package:get/get.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';

class CheckOutController extends GetxController {
  late OrderModel order;
  void initData() {
    order = Get.arguments["order"];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
