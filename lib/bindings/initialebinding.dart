import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/crud.dart';

class InitialeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
