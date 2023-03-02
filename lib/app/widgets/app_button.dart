import 'package:flutter/material.dart';

import '../../app/widgets/app_theme.dart';
import '../../constant/color_constant.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final Function()? onTap;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final double? borderWidth;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final String? fontFamily;

  const AppButton(
      {Key? key,
      @required this.onTap,
      @required this.text,
      this.color,
      this.borderColor,
      this.textColor,
      this.height,
      this.width,
      this.textStyle,
      this.alignment,
      this.padding,
      this.textAlign,
      this.borderWidth,
      this.fontWeight,
      this.fontSize,
      this.borderRadius,this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height ?? 39,
        width: width,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
            color: color ?? BhajanColorConstant.primary,
            borderRadius: borderRadius ?? BorderRadius.circular(27.5)),
        child: Text(
          text!,
          style: textStyle ??
              TextStyle(
                  fontSize: fontSize ?? 28,
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w700,
                  fontFamily: fontFamily ?? AppTheme.poppins),
        ),
      ),
    );
  }
}
