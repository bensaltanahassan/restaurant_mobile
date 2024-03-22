import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class FavorisController extends GetxController {
  late StatusRequest statusRequest;
  void goToProductDetail({required String tag}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"tag": tag});
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    Future.delayed(const Duration(seconds: 2), () {
      statusRequest = StatusRequest.success;
      update(["main"]);
    });
    super.onInit();
  }
}
