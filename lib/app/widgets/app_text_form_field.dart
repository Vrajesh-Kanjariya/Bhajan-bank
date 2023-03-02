import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_theme.dart';
import '../../constant/color_constant.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool isBorder;
  final bool autoFocus;
  final bool isDecoration;
  final bool isEnableBorder;
  final double fontSize;
  final int hintMaxLines;
  final double hintFontSize;
  final double borderRadius;
  final Color borderColor;
  final Color cursorColor;
  final Color fillColor;
  final Color fontColor;
  final Widget? suffixIcon;
  final String? fontFamily;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  final double? cursorHeight;
  final double cursorWidth;
  final double borderWidth;
  final double? iconWidth;

  const AppTextFormField({
    Key? key,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.name,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.fontFamily,
    this.cursorHeight,
    this.cursorWidth = 1,
    this.fontWeight,
    this.readOnly = false,
    required this.hint,
    this.inputFormatters,
    required this.fontSize,
    this.hintFontSize = 15,
    this.isBorder = true,
    this.autoFocus = false,
    this.isDecoration = true,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.contentPadding,
    this.isEnableBorder = true,
    this.hintMaxLines = 1,
    this.borderRadius = 6,
    this.borderColor = BhajanColorConstant.transparent,
    this.cursorColor = BhajanColorConstant.offWhite,
    this.fillColor = BhajanColorConstant.offWhite2,
    this.fontColor = BhajanColorConstant.offWhite,
    this.borderWidth = 0,
    this.iconWidth,
  }) : super(key: key);
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      cursorWidth: cursorWidth,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      autofocus: autoFocus,
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(fontSize: fontSize, color: fontColor, fontWeight: fontWeight),
      decoration: isDecoration
          ? InputDecoration(
              hintText: hint,
              isDense: true,
              isCollapsed: true,
              hintMaxLines: hintMaxLines,
              hintStyle: TextStyle(
                  fontSize: hintFontSize.px,
                  height: 0.9,
                  fontWeight: FontWeight.w500,
                  color: fontColor,
                  letterSpacing: -0.41.px,
                  fontFamily: AppTheme.poppins,
                  fontStyle: FontStyle.normal),
              filled: true,
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(minWidth: iconWidth ?? 40.px, maxHeight: 23.px),
              prefixIcon: prefixIcon,
              fillColor: isDecoration ? fillColor : BhajanColorConstant.transparent,
              prefixIconConstraints: BoxConstraints(minWidth: 40.px, maxHeight: 23.px),
              contentPadding:
                  contentPadding ?? EdgeInsets.symmetric(horizontal: 8.px, vertical: 8.px),
              border: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius.px),
                      borderSide: BorderSide(color: borderColor, width: borderWidth),
                    )
                  : InputBorder.none,
              disabledBorder: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius.px),
                      borderSide: BorderSide(color: borderColor, width: borderWidth),
                    )
                  : InputBorder.none,
              enabledBorder: isEnableBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius.px),
                      borderSide: BorderSide(color: borderColor, width: borderWidth),
                    )
                  : InputBorder.none,
              errorBorder: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius.px),
                      borderSide: BorderSide(color: borderColor, width: borderWidth),
                    )
                  : InputBorder.none,
              focusedBorder: isEnableBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius.px),
                      borderSide: BorderSide(color: borderColor, width: borderWidth),
                    )
                  : InputBorder.none,
            )
          : InputDecoration(
              hintText: hint,
              isDense: true,
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(minWidth: 20.px, maxHeight: 20.px),
              contentPadding:
                  contentPadding ?? EdgeInsets.symmetric(horizontal: 8.px, vertical: 8.px),
              hintStyle: TextStyle(
                fontSize: fontSize,
                letterSpacing: letterSpacing,
                color: fontColor,
                fontStyle: FontStyle.normal,
              ),
            ),
    );
  }
}
