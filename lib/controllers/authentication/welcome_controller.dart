import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class WelcomeController extends GetxController {
  void goToLoginPage() {
    Get.toNamed(AppRoutes.login);
  }

  void goToRegisterPage() {
    Get.toNamed(AppRoutes.signUp);
  }
}
