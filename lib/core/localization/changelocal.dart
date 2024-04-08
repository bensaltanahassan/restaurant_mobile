import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/apptheme.dart';
import 'package:restaurant_mobile/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  String get langCode => language!.languageCode;
  bool get isEnglish => langCode == "en";
  set isEnglish(bool value) => value;

  ThemeData appTheme = AppTheme.themeEnglish;
  Future<void> changeLang(String langCode) async {
    Locale locale = Locale(langCode);
    await myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? AppTheme.themeArabic : AppTheme.themeEnglish;
    //TODO
    language = locale;
    // Get.changeTheme(appTheme); // if arabic exist
    await Get.updateLocale(locale);
    Get.appUpdate();
  }

  getPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Location denied",
            "You cant access to this app without access to location");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission denied",
          "You can't use this app without access to location");
      myServices.sharedPreferences.setBool("location", false);
      Future.delayed(const Duration(microseconds: 500), () => {exit(0)});
    }
    if (permission == LocationPermission.always) {
      myServices.sharedPreferences.setBool("location", true);
    }
    if (permission == LocationPermission.whileInUse) {
      myServices.sharedPreferences.setBool("location", true);
    }
  }

  @override
  void onInit() {
    String? lang = myServices.sharedPreferences.getString("lang");
    getPermission();
    if (lang == "ar") {
      language = const Locale("ar");
      appTheme = AppTheme.themeArabic;
    } else if (lang == "fr") {
      language = const Locale("fr");
      appTheme = AppTheme.themeEnglish;
    } else if (lang == "en") {
      language = const Locale("en");
      appTheme = AppTheme.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (language!.languageCode == "ar") {
        appTheme = AppTheme.themeArabic;
      } else {
        appTheme = AppTheme.themeEnglish;
      }
    }

    super.onInit();
  }
}
