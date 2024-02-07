import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';

class ProfileController extends GetxController {
  void goToUserSettings() => Get.toNamed(AppRoutes.userSettings);
  void goToChangePassword() => Get.toNamed(AppRoutes.changePassword);
  void goToFavorite() => Get.toNamed(AppRoutes.favoris);
  void goToRecentOrders() => Get.toNamed(AppRoutes.myOrders);
  void goToNotifications() => Get.toNamed(AppRoutes.notifications);
  Future<void> logout() async {
    await Get.offAllNamed(AppRoutes.login);
  }
}
