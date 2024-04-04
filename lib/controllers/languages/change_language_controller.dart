import 'package:get/get.dart';
import 'package:restaurant_mobile/core/localization/changelocal.dart';

class ChangeLanguageController extends GetxController {
  final localController = Get.find<LocaleController>();
  late String selectedLanguage;
  void changeLanguage() {
    localController.changeLang(selectedLanguage);
  }

  void onLanguageSelected(String value) {
    selectedLanguage = value;
    update();
  }

  @override
  void onInit() {
    selectedLanguage = localController.language!.languageCode;

    super.onInit();
  }
}
