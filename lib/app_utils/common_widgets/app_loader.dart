import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loader {
  Loader._();

  static final instance = Loader._();

  init() {
    // EasyLoading.init();
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.white
      // ..indicatorWidget = Lottie.asset(AppAsset.loadingLottie, height: 100, width: 100)
      ..indicatorType = EasyLoadingIndicatorType.ripple
      ..indicatorSize = 60
      ..maskType = EasyLoadingMaskType.black
      ..dismissOnTap = false
      ..textColor = Colors.transparent
      ..boxShadow = <BoxShadow>[]
      ..userInteractions = false;
  }
}
