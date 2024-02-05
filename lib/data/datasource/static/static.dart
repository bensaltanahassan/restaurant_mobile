import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/data/model/chooselanguagemodel.dart';
import 'package:restaurant_mobile/data/model/onboardingmodel.dart';

List<OnboardingModel> onBoardingList = [
  OnboardingModel("Choose Product", AppImageAsset.onBoardingImageOne,
      "We Have a +100k Product, Choose\nYour product from our\nE-commerce shop."),
  OnboardingModel("Easy & Safe Payment", AppImageAsset.onBoardingImageTwo,
      "East Checkout & Safi Payment\nmethod. Trusted by our Customers\nfrom all over the world."),
  OnboardingModel("Track Your Order", AppImageAsset.onBoardingImageThree,
      "Besr Tracker has been Used For\nTrack your order. You'll know where\nyour product is at the moment."),
  OnboardingModel("Fast Delivery", AppImageAsset.onBoardingImageFour,
      "Reliable And Fast Delivery. We\nDeliver your product the fastest\nway possible."),
];

List<ChooseLanguageModel> chooseLanguageList = [
  ChooseLanguageModel(AppImageAsset.chooseLanguageAr, "العربية"),
  ChooseLanguageModel(AppImageAsset.chooseLanguageFr, "Francais"),
  ChooseLanguageModel(AppImageAsset.chooseLanguageEn, "English"),
];
