import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class HomeController extends GetxController {
  void goToProductsCategory() {
    Get.toNamed(AppRoutes.productsCategory);
  }
}
