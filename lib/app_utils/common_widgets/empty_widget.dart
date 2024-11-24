import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';


class MyEmptyWidget extends StatelessWidget {
  final String message;
  final bool showIcon;
  final Color? textColor;

  const MyEmptyWidget({super.key, required this.message, this.showIcon = true, this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //height: isHeight ? (context.height * 0.76) : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style: context.fontStyleMedium16?.copyWith(color: textColor ?? AppColor.textColor),
          ),
        ],
      ).paddingAll(Dimensions.commonPaddingForScreen),
    );
  }
}
