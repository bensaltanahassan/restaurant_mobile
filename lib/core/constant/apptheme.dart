import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class AppTheme {
  static ThemeData currentTheme = themeEnglish;
  static ThemeData themeEnglish = ThemeData(
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.packetColor4,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.packetColor2),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
          fontFamily: "PlayfairDisplay"),
      displayMedium: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.black,
          fontFamily: "PlayfairDisplay"),
      displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: Colors.grey[900],
          fontFamily: "Roboto"),
      bodyLarge: const TextStyle(
        height: 2,
        color: AppColors.grey,
        fontFamily: "Cairo",
        fontSize: 14,
      ),
      bodyMedium: const TextStyle(
        height: 2,
        color: AppColors.grey,
        fontSize: 12,
        fontFamily: "Cairo",
      ),
    ),
  );

  static ThemeData themeArabic = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
          fontFamily: "Cairo"),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.black,
          fontFamily: "PlayfairDisplay"),
      displaySmall: TextStyle(
        height: 2,
        color: AppColors.grey,
        fontFamily: "Cairo",
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
        height: 2,
        color: AppColors.grey,
        fontSize: 12,
        fontFamily: "Cairo",
      ),
    ),
  );
}
