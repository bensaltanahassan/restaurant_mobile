import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/core/class/crud.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/functions/handlingdatacontroller.dart';
import 'package:restaurant_mobile/core/services/services.dart';
import 'package:restaurant_mobile/data/datasource/remote/checkout/checkout_data.dart';
import 'package:restaurant_mobile/data/model/ordersmodel.dart';
import 'package:restaurant_mobile/data/model/product_model.dart';

class CheckOutController extends GetxController {
  StatusRequest? statusRequest;
  late OrderModel order;
  final checkOutData = CheckoutData(Get.find<Crud>());
  final MyServices myServices = Get.find<MyServices>();
  final containerController = Get.find<ContainerController>();
  void initData() {
    order = Get.arguments["order"];
    print(order.toJson());
  }

  void goToProductDetail({required ProductModel productModel}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"product": productModel});
  }

  Future<void> onCheckout() async {
    statusRequest = StatusRequest.loading;
    update(["checkoutButton"]);
    var response = await checkOutData.checkOut(
      userId: myServices.user!.id!,
      totalPrice: order.totalPrice!,
      adress: order.adress!,
      phoneNumber: order.phoneNumber!,
      paymentMethod: order.paymentMethod!,
      paymentStatus: order.paymentStatus ?? "Pending",
      orderStatus: order.orderStatus ?? "Pending",
      token: myServices.user?.token,
    );
    statusRequest = handlingData(response);

    // update(["checkoutButton"]);
    goToHomePage();
  }

  void goToHomePage() {
    containerController.currentIndex = 0;
    containerController.tabController.index = 0;
    Get.offAllNamed(AppRoutes.containerPage);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
