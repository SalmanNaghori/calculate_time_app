import 'package:calculate_time_app/app_utils/common_widgets/app_loader.dart';
import 'package:calculate_time_app/app_utils/service_locator/service_locator.dart';
import 'package:calculate_time_app/app_utils/storage/shared_pref_utils.dart';
import 'package:calculate_time_app/feature/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await requiredInitialization();
  orientations();
  await ScreenUtil.ensureScreenSize();
  await Future.delayed(const Duration(seconds: 2));
  runApp(const MyApp());
}


void orientations() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

Future<void> requiredInitialization() async {
  ServiceLocator.setupLocator();

  await SharedPrefUtils.init();
  await Loader.instance.init();
  await SharedPrefUtils.saveDeviceModel();
  await SharedPrefUtils.saveAppVersion();
  await SharedPrefUtils.setFirstTimeAppLoaded(false);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // if (kReleaseMode) {
  //   FlutterError.onError = (errorDetails) {
  //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   };
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  // }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
