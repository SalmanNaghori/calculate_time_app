import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextField extends StatefulWidget {
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final double? containerHeight;
  final EdgeInsets? padding;
  final Widget? suffixIcon;
  final String? title;
  final String? initialValue;
  final TextEditingController? textController;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final int? maxLine, maxLength, minLine;
  final TextInputType? keyBoardType;
  final bool? obscureText;
  final bool? autoFocus;
  final bool readOnly;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmit;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextAlign? textAlign;
  final bool isMaxLengthShow;
  final List<String>? autoFillHintList;

  const MyTextField(
      {super.key,
        this.errorText,
      this.readOnly = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.inputFormatters,
      this.containerHeight,
      this.focusNode,
      this.maxLine,
      this.maxLength,
      this.fillColor,
      this.cursorColor,
      this.keyBoardType,
      this.isMaxLengthShow = false,
      this.title,
      this.validator,
      this.obscureText = false,
      this.textController,
      this.onFieldSubmit,
      this.hintTextColor,
      this.suffixIcon,
      this.onChanged,
      this.textInputAction,
      this.textStyle,
      this.hintTextStyle,
      this.hintText,
      this.inputType,
      this.autoFocus,
      this.prefixIcon,
      this.borderColor,
      this.textAlign,
      this.onTap,
      this.initialValue,this.autoFillHintList=const[], this.minLine, this.padding});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  FocusNode focusNodeTemp = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.focusNode != null) {
          widget.focusNode?.requestFocus();
        } else {
          focusNodeTemp.requestFocus();
        }
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        height: widget.containerHeight,
        decoration: widget.containerHeight != null
            ? BoxDecoration(
                color: widget.fillColor,
                borderRadius: BorderRadius.circular(Dimensions.r12),
                border: Border.all(width: Dimensions.h1, color: widget.borderColor ?? Colors.transparent),
              )
            : null,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enableSuggestions: true,
          validator: widget.validator,
          initialValue: widget.initialValue,
          cursorColor: widget.cursorColor,
          autofillHints: widget.autoFillHintList,
          textCapitalization: widget.textCapitalization,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode ?? focusNodeTemp,
          obscureText: widget.obscureText!,
          style: widget.textStyle ?? context.fontStyleMedium16,
          textAlignVertical: TextAlignVertical.center,
          autofocus: widget.autoFocus ?? false,
          textAlign: widget.textAlign ?? TextAlign.start,
          maxLines: widget.maxLine ?? 1,
          onFieldSubmitted: widget.onFieldSubmit,
          controller: widget.textController,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          buildCounter: widget.isMaxLengthShow
              ? null
              : (
                  BuildContext context, {
                  required int currentLength,
                  required int? maxLength,
                  required bool isFocused,
                }) {
                  return null; // This removes the counter text
                },
          minLines: widget.minLine,
          decoration: InputDecoration(
            isDense: true,
            errorText: widget.errorText,
            counterStyle: const TextStyle(color: Colors.black),
            border: widget.containerHeight != null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.r12),
                    borderSide: BorderSide(width: Dimensions.h1, color: widget.borderColor ?? Colors.transparent),
                  ),
            enabledBorder: widget.containerHeight != null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.r12),
                    borderSide: BorderSide(width: Dimensions.h1, color: widget.borderColor ?? Colors.transparent),
                  ),
            focusedBorder: widget.containerHeight != null
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.r12),
                    borderSide: BorderSide(width: Dimensions.h1, color: widget.borderColor ?? Colors.transparent),
                  ),
            contentPadding: widget.containerHeight != null
                ? EdgeInsets.symmetric(horizontal: Dimensions.w16)
                : widget.padding ?? EdgeInsets.symmetric(horizontal: Dimensions.w16, vertical: Dimensions.h16),
            errorStyle: const TextStyle(color: Colors.red),
            fillColor: widget.fillColor,
            hintText: widget.hintText ?? "",
            hintStyle: widget.hintTextStyle ?? context.fontStyleRegular16?.apply(color: AppColor.hintColor),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
          onChanged: (val) {
            if (widget.onChanged != null) {
              widget.onChanged!(val);
            }
          },
          onTap: widget.onTap,
          onSaved: (value) {
            value = widget.textController!.text;
          },
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyBoardType,
        ).toCenter(),
      ),
    );
  }
}
