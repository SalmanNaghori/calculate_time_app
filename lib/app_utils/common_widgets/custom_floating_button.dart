import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CommonFloatingActionButton extends StatelessWidget {
  final ValueListenable<bool> valueListenable;
  final VoidCallback onPressed;
  final Color? activeBackgroundColor;
  final Color? inactiveBackgroundColor;
  final Color? activeIconColor;
  final Color? inactiveIconColor;
  final Color? activeBorderColor;
  final Color? inactiveBorderColor;
  final Widget? icon;
  final double? borderRadius;
  final double elevation;

  const CommonFloatingActionButton({
    super.key,
    required this.valueListenable,
    required this.onPressed,
    this.icon,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.activeIconColor,
    this.inactiveIconColor,
    this.activeBorderColor,
    this.inactiveBorderColor,
    this.borderRadius,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueListenable,
      builder: (context, isActive, child) {
        return FloatingActionButton(
          backgroundColor: isActive ? (activeBackgroundColor ?? AppColor.primaryColor) : (inactiveBackgroundColor),
          onPressed: isActive ? onPressed : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? Dimensions.r12),
            side: BorderSide(
              color: isActive ? (activeBorderColor ?? AppColor.primaryColor) : (inactiveBorderColor ?? AppColor.colorGrayBorder),
            ),
          ),
          elevation: elevation,
          child: icon ??
              AppAsset.icArrowRight.assetImage(
                  width: Dimensions.w16, height: Dimensions.h16, color: isActive ? activeIconColor ?? AppColor.whiteColor : inactiveIconColor),
        );
      },
    );
  }
}
