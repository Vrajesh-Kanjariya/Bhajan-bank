import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';

class AppTheme {
  //     ======================= Font Family =======================     //
  static const String baloobhai2 = 'BalooBhai2';
  static const String poppins = 'poppins';
  static const String lato = 'lato';
  static const String stopWatch = 'stopWatch';
  static const String hindsiliguri = 'hindsiliguri';
  static const String oswald = 'Oswald';

  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    highlightColor: BhajanColorConstant.transparent,
    splashColor: BhajanColorConstant.transparent,
    hoverColor: BhajanColorConstant.transparent,
    fontFamily: AppTheme.baloobhai2,
  );
}