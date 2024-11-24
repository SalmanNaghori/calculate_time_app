
import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class UnderMaintenanceScreen extends StatefulWidget {
  const UnderMaintenanceScreen({super.key});

  @override
  State<UnderMaintenanceScreen> createState() => _UnderMaintenanceScreenState();
}

class _UnderMaintenanceScreenState extends State<UnderMaintenanceScreen> {
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
                      AppAsset.underMaintenanceLottie,
                    ),
                  ).paddingOnly(bottom: Dimensions.h10),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.w15),
                    child: Text(
                      AppString.maintenance,
                      style: context.fontStyleSemiBold18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.w15),
                    child: Text(AppString.maintenanceMessage,
                        textAlign: TextAlign.center, style: context.fontStyleRegular14?.copyWith(color: AppColor.onSecondaryColorLight)),
                  ),
                ],
              ),
            ),
            AppString.maintenanceBtnText.customButton(
              width: null,
              onTap: () {
                SystemNavigator.pop(animated: true);
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
