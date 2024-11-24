
import 'package:flutter/material.dart';
import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:calculate_time_app/app_utils/utils/enum.dart';

class ModelThemesTypes {
  String? title = "";
  AppThemesType? themesType = AppThemesType.light;
  String? themesName = "";
  Color? themeColor = AppColor.whiteColor;
  Color? textColor = AppColor.textColorBlack;

  ModelThemesTypes({this.title, this.themesType, this.themesName, this.themeColor, this.textColor});
}
