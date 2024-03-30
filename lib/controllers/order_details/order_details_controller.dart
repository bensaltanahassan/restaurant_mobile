import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/orders/orders_data.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';
import 'package:restaurant_mobile/data/model/responses/get_orderdetails_response.dart';

class OrderDetailsController extends GetxController {
  final ms = Get.find<MyServices>();
  final od = OrdersData(Get.find<Crud>());
  StatusRequest? statusRequest;
  late OrderModel orderArg;
  GetOrderDetailsResponse getOrderDetailsResponse = GetOrderDetailsResponse(
    status: false,
    order: null,
  );

  Future<void> getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await od.getOrderDetails(
        token: ms.user!.token ?? "",
        orderId: Get.arguments["order"].id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getOrderDetailsResponse = GetOrderDetailsResponse.fromJson(response);
      if (getOrderDetailsResponse.status == true) {
        update();
      }
    }
    update();
  }

  initData() {
    orderArg = Get.arguments["order"];
  }

  void goToProductDetail({required ProductModel productModel}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": productModel});
  }

  @override
  void onInit() {
    initData();
    getOrderDetails();
    super.onInit();
  }
}
