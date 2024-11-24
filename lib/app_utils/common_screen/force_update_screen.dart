
import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:open_store/open_store.dart';

class ForceUpdateScreen extends StatefulWidget {
  const ForceUpdateScreen({super.key});

  @override
  State<ForceUpdateScreen> createState() => _ForceUpdateScreenState();
}

class _ForceUpdateScreenState extends State<ForceUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        padding: EdgeInsets.all(Dimensions.w20),
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
                      AppAsset.forceUpdateLottie,
                    ),
                  ).paddingOnly(bottom: Dimensions.h10),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.w15),
                    child: Text(AppString.forceUpdate, style: context.fontStyleSemiBold18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.w15),
                    child: Text(AppString.forceUpdateMessage,
                        textAlign: TextAlign.center, style: context.fontStyleRegular14?.copyWith(color: AppColor.onSecondaryColorLight)),
                  ),
                ],
              ),
            ),
            AppString.forceUpdateBtnText.customButton(
              width: null,
              onTap: () {
                OpenStore.instance.open(androidAppBundleId: Const.packageName, appStoreId: Const.appStoreID);
              },
              bgColor: AppColor.primaryColor,
              style: context.fontStyleMedium16?.copyWith(color: AppColor.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
