import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late String tag;

  @override
  void onInit() {
    tag = Get.arguments["tag"];
    super.onInit();
  }
}
