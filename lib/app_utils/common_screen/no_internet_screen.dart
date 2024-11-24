import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:calculate_time_app/feature/calculate_time/view/calculate_time_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInterNetScreen extends StatefulWidget {
  const NoInterNetScreen({super.key});

  @override
  State<NoInterNetScreen> createState() => _NoInterNetScreenState();
}

class _NoInterNetScreenState extends State<NoInterNetScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimensions.w200,
                    height: Dimensions.w200,
                    child: Lottie.asset(
                      AppAsset.noInternetLottie,
                    ),
                  ).paddingOnly(bottom: Dimensions.h10),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.w15),
                    child: Text(
                      AppString.noInternetConnection,
                      style: context.fontStyleSemiBold18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.w15),
                    child: Text(AppString.pleaseConnectInternet,
                        textAlign: TextAlign.center,
                        style: context.fontStyleRegular14
                            ?.copyWith(color: AppColor.onSecondaryColorLight)),
                  ),
                ],
              ),
            ),
            AppString.retry.customButton(
              width: null,
              onTap: () async {
                if (await isConnected()) {
                  _gotoHomePage();
                } else {
                  AppString.noInternetAvailable.toast();
                }
              },
              bgColor: AppColor.secondaryColor,
              style: context.fontStyleMedium16
                  ?.copyWith(color: AppColor.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _gotoHomePage() async {
    await navigateToPageAndRemoveAllPageAnim(const CalculateTimeScreen());
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }
}
