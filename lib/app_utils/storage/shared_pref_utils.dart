import 'dart:convert';
import 'dart:io';

import 'package:calculate_time_app/app_utils/themes/model/model_themes_data.dart';
import 'package:calculate_time_app/app_utils/utils/app_themes.dart';
import 'package:calculate_time_app/app_utils/utils/enum.dart';
import 'package:device_info_plus/device_info_plus.dart';


import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static ModelThemesData getThemesData() {
    String? stringModel = _prefsInstance?.getString("ThemeData");
    ModelThemesData? model = stringModel != null
        ? ModelThemesData.fromMap(jsonDecode(stringModel))
        : ModelThemesData(
            fontSizeType: FontSizeType.normal.index, fontStyleType: FontStyleType.HelveticaNowText.index, themeType: AppThemesType.light.index);
    return model;
  }

  static bool isLightThemes() {
    var tType = SharedPrefUtils.getThemesData().themeType ?? AppTheme.lightTheme.index;
    return tType == AppThemesType.light.index;
  }

  static Future<bool> setThemesData(ModelThemesData value) async {
    var prefs = await _instance;
    return prefs.setString("ThemeData", jsonEncode(value.toMap()));
  }

  static String getLanguageCode() {
    return _prefsInstance?.getString("languageCode") ?? "";
  }

  static Future<bool> setLanguageCode(String value) async {
    var prefs = await _instance;
    return prefs.setString("languageCode", value);
  }

  static int getLanguageId() {
    return _prefsInstance?.getInt("languageId") ?? 0;
  }

  static Future<bool> setLanguageId(int value) async {
    var prefs = await _instance;
    return prefs.setInt("languageId", value);
  }

  static bool getFirstPermissionLocation() {
    return _prefsInstance?.getBool("FirstPermissionLocation") ?? false;
  }

  static Future<bool> setFirstPermissionLocation(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstPermissionLocation", value);
  }

  static bool getFirstPermissionCamera() {
    return _prefsInstance?.getBool("FirstPermissionCamera") ?? false;
  }

  static Future<bool> setFirstPermissionCamera(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstPermissionCamera", value);
  }

  static bool getFirstPermissionContact() {
    return _prefsInstance?.getBool("FirstPermissionContact") ?? false;
  }

  static Future<bool> setFirstPermissionContact(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstPermissionContact", value);
  }

  static bool getFirstPermissionPhoto() {
    return _prefsInstance?.getBool("FirstPermissionPhoto") ?? false;
  }

  static Future<bool> setFirstPermissionPhoto(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstPermissionPhoto", value);
  }

  static bool getFirstPermissionMicroPhone() {
    return _prefsInstance?.getBool("FirstPermissionMicroPhone") ?? false;
  }

  static Future<bool> setFirstPermissionMicroPhone(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstPermissionMicroPhone", value);
  }

  static bool getFirstPermissionStorage() {
    return _prefsInstance?.getBool("FirstPermissionStorage") ?? false;
  }

  static Future<bool> setFirstPermissionStorage(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstPermissionStorage", value);
  }

  static bool getIsUserLoggedIn() {
    return _prefsInstance?.getBool("IsUserLoggedIn") ?? false;
  }

  static Future<bool> setIsUserLoggedIn(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsUserLoggedIn", value);
  }

  // static bool getIsMobileSupportBioMetric() {
  //   return _prefsInstance?.getBool("IsMobileSupportBioMetric") ?? false;
  // }
  //
  // static Future<bool> setIsMobileSupportBioMetric(bool value) async {
  //   var prefs = await _instance;
  //   return prefs.setBool("IsMobileSupportBioMetric", value);
  // }

  static bool getIsInstructionCompleted() {
    return _prefsInstance?.getBool("IsInstructionCompleted") ?? false;
  }

  static Future<bool> setIsInstructionCompleted(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsInstructionCompleted", value);
  }

  static String getFcmToken() {
    return _prefsInstance?.getString("FcmToken") ?? "";
  }

  static Future<bool> setFcmToken(String value) async {
    var prefs = await _instance;
    return prefs.setString("FcmToken", value);
  }

  static String getToken() {
    return _prefsInstance?.getString("token") ?? "";
  }

  static Future<bool> setToken(String value) async {
    var prefs = await _instance;
    return prefs.setString("token", value);
  }

  static Future<void> remove() async {
    SharedPreferences.getInstance().then((SharedPreferences pref) {
      pref.clear();
    });
    var prefs = await _instance;
    prefs.clear();
  }

  static getFcmTokens() {
    /* FirebaseMessaging.instance.getToken().then((token) async {
      await StartupService.setFcmToken(token!);
      logger.w("Firebase token ~~~~~~~> ${token}");
    });*/
  }

  static String getDeviceManufacture() {
    return _prefsInstance?.getString("DeviceManufacture") ?? "";
  }

  static Future<bool> setDeviceManufacture(String value) async {
    var prefs = await _instance;
    return prefs.setString("DeviceManufacture", value);
  }

  static String getDeviceOSVersion() {
    return _prefsInstance?.getString("OSVersion") ?? "";
  }

  static Future<bool> setDeviceOSVersion(String value) async {
    var prefs = await _instance;
    return prefs.setString("OSVersion", value);
  }

  static String getAppVersion() {
    return _prefsInstance?.getString("AppVersion") ?? "1.0.0";
  }

  static Future<bool> setCurrentDate(String value) async {
    var prefs = await _instance;
    return prefs.setString("CurrentDate", value);
  }

  static String getCurrentDate() {
    return _prefsInstance?.getString("CurrentDate") ?? "null";
  }

  static Future<bool> setAppVersion(String value) async {
    var prefs = await _instance;
    return prefs.setString("AppVersion", value);
  }

  static bool getIsWalkThroughCompleted() {
    return _prefsInstance?.getBool("IsWalkThroughCompleted") ?? false;
  }

  static Future<bool> setIsWalkThroughCompleted(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsWalkThroughCompleted", value);
  }

  static bool getIsFirstHomeFilterCompleted() {
    return _prefsInstance?.getBool("IsFirstHomeFilterCompleted") ?? false;
  }

  static Future<bool> setIsFirstHomeFilterCompleted(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsFirstHomeFilterCompleted", value);
  }

  static bool getGotItCompleted() {
    return _prefsInstance?.getBool("IsGotItCompleted") ?? false;
  }

  static Future<bool> setGotItCompleted(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsGotItCompleted", value);
  }

  static bool getIsFirstTimeHome() {
    return _prefsInstance?.getBool("IsFirstTimeHome") ?? true;
  }

  static Future<bool> setIsFirstTimeHome(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsFirstTimeHome", false);
  }

  static String getPlatformName() {
    return Platform.isAndroid ? "android" : "iOS";
  }

  static saveDeviceModel() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setDeviceManufacture(androidInfo.manufacturer);
      setDeviceModel(androidInfo.model);
      setDeviceId(androidInfo.id);
      setDeviceOSVersion(androidInfo.version.release);
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setDeviceManufacture("iOS");
      setDeviceModel(iosInfo.utsname.machine);
      setDeviceId(iosInfo.identifierForVendor ?? "-");
      setDeviceOSVersion(iosInfo.systemVersion);
    }
  }

  static saveAppVersion() async {
    PackageInfo packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown',
    );
    var appVersion = "1.0";
    packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    setAppVersion(appVersion);
  }

  static String getDeviceModel() {
    return _prefsInstance?.getString("DeviceModel") ?? "";
  }

  static Future<bool> setDeviceModel(String value) async {
    var prefs = await _instance;
    return prefs.setString("DeviceModel", value);
  }

  static Future<bool> setDeviceId(String value) async {
    var prefs = await _instance;
    return prefs.setString("DeviceId", value);
  }

  static String getDeviceId() {
    return _prefsInstance?.getString("DeviceId") ?? "";
  }

  static Future<bool> setFirstTimeAppLoaded(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("FirstTimeAppLoaded", value);
  }

  static bool getFirstTimeAppLoaded() {
    return _prefsInstance?.getBool("FirstTimeAppLoaded") ?? false;
  }

  static Future<bool> setContactSync(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("SetContactSync", value);
  }

  static bool getContactSync() {
    return _prefsInstance?.getBool("SetContactSync") ?? false;
  }
}
