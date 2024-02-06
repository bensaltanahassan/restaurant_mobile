import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class VerifyCodeController extends GetxController {
  void resendCode() {}
  void verifyCode() {
    goToChangePasswordPage();
  }

  void goToChangePasswordPage() {
    Get.toNamed(AppRoutes.changePassword);
  }
}
