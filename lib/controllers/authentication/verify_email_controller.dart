import 'package:get/get.dart';
import 'package:restaurant_mobile/core/class/statusrequest.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class VerifyEmailController extends GetxController {
  StatusRequest? statusRequest;
  late String email;

  void goToLoginPage() {
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> resendEmailVerification() async {
    statusRequest = StatusRequest.loading;
    update(['resendEmailVerification']);
    await Future.delayed(const Duration(seconds: 1));
    statusRequest = StatusRequest.success;
    update(['resendEmailVerification']);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
