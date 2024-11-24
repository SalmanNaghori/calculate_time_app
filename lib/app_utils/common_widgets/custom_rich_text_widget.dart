import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichTextWidget extends RichText {
  CustomRichTextWidget.getDualText(
      {super.key,
      super.textAlign,
      required String firstText,
      required String secondText,
      required TextStyle firstTextStyle,
      required TextStyle secondTextStyle})
      : super(
          text: TextSpan(
            text: firstText,
            style: firstTextStyle,
            children: <TextSpan>[
              TextSpan(text: secondText, style: secondTextStyle),
            ],
          ),
        );

  CustomRichTextWidget.getTripleText({
    super.key,
    super.textAlign,
    required String firstText,
    required String secondText,
    required String thirdText,
    required TextStyle? firstTextStyle,
    required TextStyle? secondTextStyle,
    required TextStyle? thirdTextStyle,
  }) : super(
          text: TextSpan(
            text: firstText,
            style: firstTextStyle,
            children: <TextSpan>[
              TextSpan(text: secondText, style: secondTextStyle),
              TextSpan(text: thirdText, style: thirdTextStyle),
            ],
          ),
        );

  CustomRichTextWidget.getFourText({
    super.key,
    required String firstText,
    required String secondText,
    required String thirdText,
    required String forthText,
    required TextStyle? firstTextStyle,
    required TextStyle? secondTextStyle,
    required TextStyle? thirdTextStyle,
    required TextStyle? forthTextStyle,
    required Function? onTapFirst,
    required Function? onTapSecond,
    TextAlign? textAlign,
  }) : super(
          text: TextSpan(
            text: firstText,
            style: firstTextStyle,
            children: <TextSpan>[
              TextSpan(
                text: secondText,
                style: secondTextStyle,
                recognizer: TapGestureRecognizer()..onTap = () => onTapFirst!(),
              ),
              TextSpan(text: thirdText, style: thirdTextStyle),
              TextSpan(
                text: forthText,
                style: forthTextStyle,
                recognizer: TapGestureRecognizer()..onTap = () => onTapSecond!(),
              ),
            ],
          ),
          textAlign: textAlign ?? TextAlign.center,
        );

  CustomRichTextWidget.getAuthScreenBottom(
      {super.key,
      required String firstText,
      required String secondText,
      required TextStyle firstTextStyle,
      required TextStyle secondTextStyle,
      required Function onTap})
      : super(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: firstText,
            style: firstTextStyle,
            children: <TextSpan>[
              const TextSpan(text: " "),
              TextSpan(recognizer: TapGestureRecognizer()..onTap = () => onTap(), text: secondText, style: secondTextStyle),
            ],
          ),
        );

  CustomRichTextWidget.getNotificationDescription(
      {super.key,
      required String firstText,
      required String secondText,
      required TextStyle firstTextStyle,
      required TextStyle secondTextStyle,
      required Function onTap})
      : super(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: firstText,
            recognizer: TapGestureRecognizer()..onTap = () => onTap(),
            style: firstTextStyle,
            children: <TextSpan>[
              const TextSpan(text: " "),
              TextSpan(text: secondText, style: secondTextStyle),
            ],
          ),
        );

  CustomRichTextWidget.getClickableUserName({super.key, required String userName, required TextStyle firstTextStyle, required Function onTap})
      : super(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: userName,
            style: firstTextStyle.apply(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => onTap(),
          ),
        );

  CustomRichTextWidget.shareUserName(
      {super.key,
      required String firstText,
      required String secondText,
      required TextStyle firstTextStyle,
      required TextStyle secondTextStyle,
      required Function onTap})
      : super(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: firstText,
            style: firstTextStyle,
            children: <TextSpan>[
              const TextSpan(text: " "),
              TextSpan(recognizer: TapGestureRecognizer()..onTap = () => onTap(), text: secondText, style: secondTextStyle),
            ],
          ),
        );
}
