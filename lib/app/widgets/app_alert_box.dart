import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../routes/app_navigation.dart';

class AlertDialogBox extends StatelessWidget {
  final Widget? contentWidget;
  final bool? setText;
  final String? titleText;

  const AlertDialogBox({Key? key, this.contentWidget, this.setText = false, this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      title: Column(children: [
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(top: 5, right: 5),
          child: GestureDetector(
              onTap: () {
                gotoBack();
              },
              child: AppImageAsset(
                image: BhajanAssets.close,
                height: 25.px,
                width: 25.px,
              )),
        ),
        Container(
          alignment: Alignment.center,
          child: AppText(
            letterSpacing: 0.75.px,
            text: setText! ? titleText : AppStringConstants.confirmation.tr,
            textAlign: TextAlign.center,
            fontSize: 20.px,
            fontFamily: AppTheme.poppins,
            fontStyle: FontStyle.normal,
            fontColor: BhajanColorConstant.black,
            fontWeight: FontWeight.w600,
          ),
        )
      ]),
      content: contentWidget,
    );
  }
}
