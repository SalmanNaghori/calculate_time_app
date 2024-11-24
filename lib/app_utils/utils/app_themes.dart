import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:calculate_time_app/app_utils/basic_import.dart';

class AppThemes {
  static appThemeData(String fontFamily) => {AppTheme.lightTheme: lightThemeData(fontFamily), AppTheme.darkTheme: darkThemeData(fontFamily)};
}

enum AppTheme {
  lightTheme,
  darkTheme,
}

ThemeData lightThemeData(String? fontFamily) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.whiteColor,
    brightness: Brightness.light,
    colorScheme: lightThemeColors(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: AppColor.blackColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: Dimensions.sp20,
        color: AppColor.textColorBlack,
        fontWeight: FontAsset.regular,
        fontFamily: FontAsset.helveticaNowText,
      ),
      toolbarTextStyle: TextStyle(
        fontSize: Dimensions.sp12,
        fontWeight: FontAsset.regular,
        fontFamily: FontAsset.helveticaNowText,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
            fontSize: Dimensions.sp12, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      ),
    ),
    fontFamily: fontFamily,
    dividerColor: AppColor.dividerLightColor,
    textTheme: TextTheme(
      titleLarge:
          TextStyle(fontSize: Dimensions.sp20, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      titleMedium:
          TextStyle(fontSize: Dimensions.sp16, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      titleSmall:
          TextStyle(fontSize: Dimensions.sp14, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      headlineLarge:
          TextStyle(fontSize: Dimensions.sp18, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      headlineMedium:
          TextStyle(fontSize: Dimensions.sp16, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      headlineSmall:
          TextStyle(fontSize: Dimensions.sp14, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      bodyLarge:
          TextStyle(fontSize: Dimensions.sp14, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      bodyMedium:
          TextStyle(fontSize: Dimensions.sp12, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      bodySmall:
          TextStyle(fontSize: Dimensions.sp10, color: AppColor.textColorBlack, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
    ),
  );
}

ThemeData darkThemeData(String? fontFamily) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.primaryColorDark,
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColor.primaryColor,
      headerForegroundColor: AppColor.whiteColor,
      backgroundColor: AppColor.whiteColor,
      rangePickerHeaderForegroundColor: AppColor.whiteColor,
      rangePickerHeaderBackgroundColor: AppColor.primaryColor,
      rangeSelectionBackgroundColor: AppColor.primaryColor.withOpacity(0.1),
      rangePickerBackgroundColor: AppColor.whiteColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColor.whiteColor, // Set the color of the back icon
      ),
      // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
            fontSize: Dimensions.sp12, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      ),
    ),
    dividerColor: AppColor.dividerDarkColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: darkThemeColors(),
    textTheme: TextTheme(
      titleLarge:
          TextStyle(fontSize: Dimensions.sp20, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      titleMedium:
          TextStyle(fontSize: Dimensions.sp16, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      titleSmall:
          TextStyle(fontSize: Dimensions.sp14, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      headlineLarge:
          TextStyle(fontSize: Dimensions.sp18, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      headlineMedium:
          TextStyle(fontSize: Dimensions.sp16, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      headlineSmall:
          TextStyle(fontSize: Dimensions.sp14, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      bodyLarge:
          TextStyle(fontSize: Dimensions.sp14, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      bodyMedium:
          TextStyle(fontSize: Dimensions.sp12, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
      bodySmall:
          TextStyle(fontSize: Dimensions.sp10, color: AppColor.textColorWhite, fontWeight: FontAsset.regular, fontFamily: FontAsset.helveticaNowText),
    ),
  );
}

ColorScheme lightThemeColors() {
  return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primaryColor,
      onPrimary: AppColor.onPrimaryColor,
      secondary: AppColor.secondaryColor,
      onSecondary: AppColor.secondaryColor,
      primaryContainer: AppColor.primaryContainerLight,
      onPrimaryContainer: AppColor.onPrimaryContainerLight,
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: AppColor.primaryColorLight,
      onBackground: AppColor.primaryColorLight,
      surface: AppColor.blackColor,
      onSurface: AppColor.whiteColor,
      outline: AppColor.dashGreyLight);
}

ColorScheme darkThemeColors() {
  return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColor.primaryColorDark,
      onPrimary: AppColor.onPrimaryColorDark,
      primaryContainer: AppColor.primaryContainerDark,
      onPrimaryContainer: AppColor.onPrimaryContainerDark,
      secondary: AppColor.secondaryColorDark,
      onSecondary: AppColor.onSecondaryColorDark,
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: AppColor.primaryColorDark,
      onBackground: AppColor.primaryColorDark,
      surface: Color(0xFF505050),
      onSurface: AppColor.whiteColor,
      // onSurface: Color(0xFF505050),
      outline: AppColor.dashGreyDark);
}
