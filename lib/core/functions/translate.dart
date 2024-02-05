import 'package:get/get.dart';
import 'package:restaurant_mobile/core/services/services.dart';

String? translate(String? texten, String? textar) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "en") {
    return texten;
  } else {
    return textar;
  }
}
