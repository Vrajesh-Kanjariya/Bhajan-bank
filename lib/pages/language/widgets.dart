import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_button.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import 'language_page.dart';

Align bgTemple() => const Align(
      alignment: Alignment.bottomCenter,
      child: AppImageAsset(image: BhajanAssets.temple),
    );

Container buildLanguageButtonView() => Container(
  margin: EdgeInsets.only(bottom: 80.px),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => languageViewModel!.endOnTap(),
          child: Container(
            height: 42.px,
            width: 234.px,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: languageViewModel!.value == 1
                    ? BhajanColorConstant.primary
                    : BhajanColorConstant.white,
                borderRadius: BorderRadius.circular(42.px),
                border: Border.all(
                    width: 2.px,
                    color: languageViewModel!.value == 1
                        ? BhajanColorConstant.white
                        : BhajanColorConstant.mandirColor)),
            child: AppText(
              text: AppStringConstants.english,
              textAlign: TextAlign.center,
              fontColor: languageViewModel!.value == 1
                  ? BhajanColorConstant.white
                  : BhajanColorConstant.black,
              fontWeight: FontWeight.w500,
              fontFamily: AppTheme.poppins,
              fontSize: 20.px,
            ),
          ),
        ),
        SizedBox(
          height: 10.px,
        ),
        InkWell(
          onTap: () => languageViewModel!.gujOnTap(),
          child: Container(
            height: 42.px,
            width: 234.px,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: languageViewModel!.value == 2
                    ? BhajanColorConstant.primary
                    : BhajanColorConstant.white,
                borderRadius: BorderRadius.circular(42.px),
                border: Border.all(
                    width: 2.px,
                    color: languageViewModel!.value == 2
                        ? BhajanColorConstant.white
                        : BhajanColorConstant.mandirColor)),
            child: AppText(
              text: AppStringConstants.gujarati,
              textAlign: TextAlign.center,
              fontColor: languageViewModel!.value == 2
                  ? BhajanColorConstant.white
                  : BhajanColorConstant.black,
              fontWeight: FontWeight.w600,
              fontSize: 21.px,
              fontFamily: AppTheme.poppins,
            ),
          ),
        ),
      ],
    ),
  ),
);

Align buildNextButtonView() => Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
      padding: EdgeInsets.only(
        bottom: 40.px,
      ),
      child: AppButton(
        height: 45.px,
        width: 263.px,
        onTap: () => languageViewModel!.onTapNext(),
        text: AppStringConstants.nextSimple.tr.toUpperCase(),
        fontSize: 30.px,
      )),
);