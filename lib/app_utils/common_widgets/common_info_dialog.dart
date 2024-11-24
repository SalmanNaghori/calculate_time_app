import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonInfoDialog extends StatefulWidget {
  const CommonInfoDialog({super.key, required this.title, required this.description, this.showContactUs = false, this.contactUsTap});

  final String title;
  final String description;
  final bool showContactUs;
  final VoidCallback? contactUsTap;

  @override
  State<CommonInfoDialog> createState() => _CommonInfoDialogState();
}

class _CommonInfoDialogState extends State<CommonInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.only(bottom: Dimensions.h16, right: Dimensions.w16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.r16),
      ),
      backgroundColor: AppColor.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: context.fontStyleSemiBold18?.copyWith(
                    fontFamily: FontAsset.bricolageGrotesque,
                  ),
                ),
              ),
              AppAsset.icCloseButton.svgImage(height: Dimensions.h24).onTap(() {
                Navigator.pop(context);
              }),
            ],
          ),
          Dimensions.h10.verticalSpace,
          Text(
            widget.description,
            style: context.fontStyleRegular16,
            textAlign: TextAlign.start,
          ),
        ],
      ).paddingAll(Dimensions.commonPaddingForScreen),
      actions: [
        if (widget.showContactUs) ...[
          AppString.contactUsTitle
              .textView(
                style: context.fontStyleMedium16?.copyWith(color: AppColor.whiteColor),
              )
              .paddingSymmetric(vertical: Dimensions.h4)
              .minimizeBox(
                  onTap: () {
                    widget.contactUsTap?.call();
                  },
                  bgColor: AppColor.primaryColor)
        ]
      ],
    );
  }
}
