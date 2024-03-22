import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest;
  void goToProductsCategory() {
    Get.toNamed(AppRoutes.productsCategory);
  }

  void goToProductDetail({required String tag}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"tag": tag});
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    Future.delayed(const Duration(seconds: 5), () {
      statusRequest = StatusRequest.success;
      update(['home_status']);
    });
    super.onInit();
  }
}
