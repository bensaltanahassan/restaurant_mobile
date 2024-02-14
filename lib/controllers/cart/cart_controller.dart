import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class CartController extends GetxController {
  void goToPaymentPage() {
    Get.toNamed(AppRoutes.paymentPage);
  }

  void goToProductDetail({required String tag}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"tag": tag});
  }
}
