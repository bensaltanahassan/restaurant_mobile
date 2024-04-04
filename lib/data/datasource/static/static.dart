import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/data/model/chooselanguagemodel.dart';
import 'package:restaurant_mobile/data/model/onboardingmodel.dart';

class StaticData {
  static String get appName => "Restaurant Mobile";
  static List<OnboardingModel> onBoardingList(BuildContext context) => [
        OnboardingModel(
            title: AppLocalizations.of(context)!.title1,
            body: AppLocalizations.of(context)!.body1,
            image: AppImageAsset.onBoardingImageOne),
        OnboardingModel(
            title: AppLocalizations.of(context)!.title2,
            body: AppLocalizations.of(context)!.body2,
            image: AppImageAsset.onBoardingImageTwo),
        OnboardingModel(
            title: AppLocalizations.of(context)!.title3,
            body: AppLocalizations.of(context)!.body3,
            image: AppImageAsset.onBoardingImageThree),
      ];

  static List<ChooseLanguageModel> chooseLanguageList = [
    ChooseLanguageModel(AppImageAsset.chooseLanguageFr, "Francais"),
    ChooseLanguageModel(AppImageAsset.chooseLanguageEn, "English"),
  ];
}
