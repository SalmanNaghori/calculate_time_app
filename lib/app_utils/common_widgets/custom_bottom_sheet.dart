import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomBottomSheet {
  CustomBottomSheet._();

  static final instance = CustomBottomSheet._();

  commonBottomSheet({required Widget child, required String title, required BuildContext context}) {
    return showModalBottomSheet(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.r16),
            topRight: Radius.circular(Dimensions.r16),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.fontStyleSemiBold20?.copyWith(fontFamily: FontAsset.bricolageGrotesque),
                      maxLines: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppAsset.icCloseButton.svgImage(height: Dimensions.h26),
                  ),
                ],
              ),
              Dimensions.h15.verticalSpace,
              child,
            ],
          ).paddingAll(Dimensions.commonPaddingForScreen);
        });
  }

  commonBottomSheetWithBack({required Widget child, Widget? titleWidget, required BuildContext context,bool showClose=false}) {
    return showModalBottomSheet(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.r16),
            topRight: Radius.circular(Dimensions.r16),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppAsset.icArrowBack
                      .assetImage(
                    width: Dimensions.w22,
                    height: Dimensions.h22,
                  )
                      .onTap(() {
                    Navigator.pop(context);
                  }),
                  Visibility(visible: showClose,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppAsset.icCloseButton.svgImage(height: Dimensions.h26),
                    ),
                  ),
                ],
              ),
              Dimensions.h15.verticalSpace,
              child,
            ],
          ).paddingAll(Dimensions.commonPaddingForScreen);
        });
  }

  modalBottomSheet({required Widget child, required BuildContext context}) {
    return showModalBottomSheet(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.r10),
            topRight: Radius.circular(Dimensions.r10),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Wrap(
                children: [
                  Container(
                    width: Dimensions.screenWidth(),
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.r10), topRight: Radius.circular(Dimensions.r10))),
                    constraints: BoxConstraints(maxHeight: Dimensions.screenHeight() * 0.875),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: Dimensions.h10),
                        // Center(
                        //   child: Container(width: Dimensions.w44,
                        //     height: Dimensions.h5,
                        //     decoration: BoxDecoration(
                        //         color: Color(0xffcbcdcc),
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(Dimensions.r10),
                        //           )),
                        //   ),
                        // ),
                        // SizedBox(height: Dimensions.h24),
                        Flexible(
                          child: child,
                        ),
                        SizedBox(height: Dimensions.getKeyBoardHeight()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
