import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';


class CommonLoremIpsumWidget extends StatelessWidget {
  const CommonLoremIpsumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppString.loremIpsum,
      style: context.fontStyleRegular14,
    ).paddingOnly(bottom: Dimensions.commonPaddingForScreen);
  }
}
