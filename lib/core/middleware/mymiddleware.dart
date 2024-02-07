import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/routes.dart';
import 'package:restaurant_mobile/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("intro") ?? false) {
      return const RouteSettings(name: AppRoutes.welcome);
    }
    if (myServices.sharedPreferences.getBool("login") ?? false) {
      return const RouteSettings(name: AppRoutes.containerPage);
    }
    return null;
  }
}
