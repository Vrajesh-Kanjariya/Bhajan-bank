import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';

class BhajanLoader extends StatelessWidget {
  final Color loaderColor;
  final double loaderSize;

  const BhajanLoader({Key? key, this.loaderColor = BhajanColorConstant.appWhite, this.loaderSize = 130}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: BhajanColorConstant.appWhite.withOpacity(0.6),
      child: Lottie.asset(BhajanAssets.loaderAnimation, height: loaderSize.px, width: loaderSize.px),
    );
  }
}

class BhajanJustLoader extends StatelessWidget {
  final Color loaderColor;
  final double loaderSize;

  const BhajanJustLoader({Key? key, this.loaderColor = BhajanColorConstant.primary, this.loaderSize = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(BhajanAssets.loaderAnimation, height: loaderSize.px, width: loaderSize.px));
  }
}
