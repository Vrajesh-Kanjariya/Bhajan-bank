import 'package:bank/app/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../constant/color_constant.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int maxLines;
  final double? wordSpacing;
  final double? letterSpacing;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final double? height;
  final TextStyle? textStyle;

  const AppText(
      {Key? key,
      @required this.text,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines = 1,
      this.wordSpacing,
      this.letterSpacing,
      this.fontFamily,
      this.fontStyle,
      this.decoration,
      this.height,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        height: height,
        fontFamily: fontFamily ?? AppTheme.baloobhai2,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        wordSpacing: wordSpacing,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }
}

class HtmlText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? fontColor;

  const HtmlText(
      {Key? key,
      this.text,
      required this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        "body": Style(
            textAlign: textAlign,
            letterSpacing: 0.75,
            fontStyle: FontStyle.normal,
            fontSize: FontSize(fontSize),
            fontWeight: fontWeight,
            color: fontColor ?? BhajanColorConstant.black),
      },
    );
  }
}
