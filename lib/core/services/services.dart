import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/controllers/cart/cart_controller.dart';
import 'package:restaurant_mobile/controllers/container/container_controller.dart';
import 'package:restaurant_mobile/controllers/favoris/favoris_controller.dart';
import 'package:restaurant_mobile/controllers/home/home_controller.dart';
import 'package:restaurant_mobile/data/model/image_model.dart';
import 'package:restaurant_mobile/data/model/user_model.dart';
import 'package:restaurant_mobile/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  UserModel? user;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    await initUser();

    return this;
  }

  Future<void> logout() async {
    await sharedPreferences.clear();
    sharedPreferences.setBool("intro", true);
    user = null;
  }

  Future<void> saveUser(UserModel user) async {
    await Future.wait([
      sharedPreferences.setString("email", user.email!),
      sharedPreferences.setString("fullName", user.fullName!),
      sharedPreferences.setString("id", user.id.toString()),
      sharedPreferences.setString("phone", user.phone!),
      sharedPreferences.setString("address", user.address!),
      sharedPreferences.setString("createdAt", user.createdAt!),
    ]);
    if (user.image != null) {
      await sharedPreferences.setString("photo", user.image!.url!);
    }
    if (user.token != null) {
      await sharedPreferences.setString("token", user.token!);
    }
    this.user = user;
  }

  Future<UserModel?> initUser() async {
    if (sharedPreferences.containsKey("email")) {
      user = UserModel(
          id: int.parse(sharedPreferences.getString("id")!),
          email: sharedPreferences.getString("email"),
          fullName: sharedPreferences.getString("fullName"),
          phone: sharedPreferences.getString("phone"),
          address: sharedPreferences.getString("address"),
          createdAt: sharedPreferences.getString("createdAt"),
          updatedAt: sharedPreferences.getString("updatedAt"),
          token: sharedPreferences.getString("token"),
          image: ImageModel(url: sharedPreferences.getString("photo")));
      return user;
    }
    return null;
  }

  Future<void> deleteAllTheControllers() async {
    Get.delete<ContainerController>(force: true);
    Get.delete<HomeController>(force: true);
    Get.delete<CartController>(force: true);
    Get.delete<FavorisController>(force: true);
  }
}

initialService() async {
  await Get.putAsync(() => MyServices().init());
}
