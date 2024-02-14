import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class FavorisController extends GetxController {
  void goToProductDetail({required String tag}) {
    Get.toNamed(AppRoutes.productdetail, arguments: {"tag": tag});
  }
}
