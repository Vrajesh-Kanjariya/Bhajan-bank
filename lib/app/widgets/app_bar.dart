import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank/utils/shared_preference.dart';
import 'package:bank/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../routes/app_navigation.dart';

class BhajanBankAppBar extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final bool isShowSwitch;
  final bool isShowIcon;
  final double? fontSize;
  final Function()? onTap;
  final bool isShowAction;
  final bool isShowLeading;
  final bool isShowMenu;
  final bool isShowBack;
  final bool isCoin;
  final bool? centerTitle;
  final bool isInformation;
  final bool isNotification;
  final Color? backGroundColor;
  final String? fontFamily;

  const BhajanBankAppBar(
      {Key? key,
      this.title,
      this.onPressed,
      this.isShowSwitch = false,
      this.fontSize,
      this.onTap,
      this.isShowAction = true,
      this.isShowMenu = false,
      this.isShowBack = true,
      this.isShowLeading = true,
      this.isShowIcon = true,
      this.isCoin = false,
      this.centerTitle,
      this.isInformation = true,
      this.isNotification = true,
      this.backGroundColor,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        leadingWidth: isShowLeading ? 40.px : 0.px,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: backGroundColor ?? BhajanColorConstant.primary,
        centerTitle: centerTitle ?? true,
        leading: isShowLeading
            ? isShowBack
                ? InkWell(
                    onTap: onTap ?? () => gotoBack(),
                    child: Container(
                      padding: EdgeInsets.only(left: 12.px, right: 16.px, top:16.px,bottom: 16.px),
                      height: 21.px,
                      width: 40.px,
                      child: const AppImageAsset(
                        image: BhajanAssets.backArrow,
                      ),
                    ),
                  )
                : isShowMenu
                    ? InkWell(
                        onTap: onTap ?? () => gotoBack(),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10.px),
                          height: 30.px,
                          width: 50.px,
                          child: const AppImageAsset(
                            image: BhajanAssets.menu,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : const SizedBox()
            : const SizedBox(),
        title:  Container(
          alignment: Alignment.center,
          child: AppText(
            text: title!,
            letterSpacing: 0.75,
            fontStyle: FontStyle.normal,
            fontSize: fontSize ?? 22.px,
            fontFamily: AppTheme.poppins,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: isShowAction
            ? [
                if (isInformation)
                  InkWell(
                    onTap: () => goToInformation(),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(bottom: 7.px),
                      child: AppImageAsset(
                        height: 35.px,
                        width: 30.px,
                        image: BhajanAssets.informationImage,
                      ),
                    ),
                  ),
                if (isNotification)
                  InkWell(
                    onTap: () => gotoNotification(),
                    child: Align(
                      child: Container(
                        alignment: Alignment.center,
                        width: 30.px,
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 25.px,
                            ),
                            Positioned(
                                right: 3.px,
                                top: 2.px,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 7.px,
                                  width: 7.px,
                                  decoration: const BoxDecoration(
                                      color: BhajanColorConstant.red, shape: BoxShape.circle),
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 5.px, color: BhajanColorConstant.primary),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(width: 3.px),
                if (isShowSwitch) flutterSwitch(),
                SizedBox(width: 6.px),
                if (isCoin)
                  InkWell(
                    onTap: () => gotoCoin(),
                    child: Container(
                      height: 25.px,
                      width: 80.px,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 17.px, bottom: 17.px,right: 6.px),
                      decoration: BoxDecoration(
                          color: BhajanColorConstant.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppImageAsset(
                            image: BhajanAssets.coin,
                            width: 18.px,
                            height: 18.px,
                          ),
                          AutoSizeText(
                            textAlign: TextAlign.start,
                            '99,99999',
                            maxFontSize: 12,
                            style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: BhajanColorConstant.black),
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 1,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  width: 8.px,
                ),
              ]
            : [],
      ),
    );
  }
}

final ValueNotifier<bool> syncInterNetStream = ValueNotifier(true);

ValueListenableBuilder flutterSwitch() => ValueListenableBuilder(
    valueListenable: syncInterNetStream,
    builder: (BuildContext context, snapshot, Widget? child) {
      return FutureBuilder<String?>(
        future: getPrefStringValue(languageKey),
        builder: (context, futureSnapshot) {
          return FlutterSwitch(
              borderRadius: 20,
              width: 38,
              height: 21,
              activeColor: BhajanColorConstant.white,
              inactiveColor: BhajanColorConstant.white,
              activeToggleColor: BhajanColorConstant.switchColor,
              inactiveToggleColor: BhajanColorConstant.switchColor,
              toggleSize: 15,
              valueFontSize: 10,
              activeText: 'ગુ',
              inactiveText: 'e',
              padding: 3.0,
              activeTextColor: BhajanColorConstant.primary,
              inactiveTextColor: BhajanColorConstant.primary,
              value: futureSnapshot.hasData && futureSnapshot.data == 'guj',
              // value: syncInterNetStream.value,
              showOnOff: true,
              onToggle: (value) async {
                logs('Switch --> $value');
                await setPrefStringValue(languageKey, value ? 'guj' : 'eng');
                Get.updateLocale(Locale(value ? 'gu' : 'en', value ? 'IN' : 'US'));
                syncInterNetStream.value = value;
              });
        },
      );
    },
  );
