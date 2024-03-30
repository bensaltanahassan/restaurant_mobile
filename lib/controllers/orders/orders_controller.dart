import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/orders/orders_data.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/data/model/responses/get_orders_response.dart';

class OrdersController extends GetxController {
  final ms = Get.find<MyServices>();
  final od = OrdersData(Get.find<Crud>());
  StatusRequest? statusRequest;
  GetOrdersResponse getOrdersResponse = GetOrdersResponse(
    status: false,
    orders: [],
  );

  void initData() {}

  Future<void> getAllOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await od.getAllOrders(
        userId: ms.user!.id!.toString(), token: ms.user!.token ?? "");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getOrdersResponse = GetOrdersResponse.fromJson(response);
      if (getOrdersResponse.status == true) {
        getOrdersResponse.orders!.sort((a, b) => (DateTime.parse(b.createdAt!)
            .compareTo(DateTime.parse(a.createdAt!))));
        update();
      }
    }

    update();
  }

  void goToOrderDetail({required OrderModel order}) {
    Get.toNamed(AppRoutes.orderdetails, arguments: {"order": order});
  }

  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }
}
