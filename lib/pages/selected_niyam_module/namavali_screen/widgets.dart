import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/namavali_screen_controller.dart';
import '../../../pages/selected_niyam_module/namavali_screen/namavali_screen.dart';
import '../../../routes/app_navigation.dart';

Widget namavaliBodyView(NamavaliScreenController controller) => controller.lessonInfoList.isNotEmpty
    ? Column(
        children: [
          firstTabTitleView(controller),
          SizedBox(height: 10.px),
          secondTabBarView(controller)
        ],
      )
    : const SizedBox();

Widget firstTabTitleView(NamavaliScreenController controller) => Container(
      height: 30.px,
      margin: EdgeInsets.only(left: 27.px, right: 27.px, top: 11.px),
      decoration: BoxDecoration(
          color: BhajanColorConstant.status, borderRadius: BorderRadius.circular(18.px)),
      child: TabBar(
        physics: const ClampingScrollPhysics(),
        isScrollable: true,
        padding: EdgeInsets.symmetric(horizontal: 3.px, vertical: 4.px),
        indicator: BoxDecoration(
            color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(20.px)),
        labelColor: BhajanColorConstant.white,
        controller: namavaliScreenViewModel!.tabController,
        tabs: List.generate(controller.lessonInfoList.length, (index) {
          return Tab(
            child: AppText(
              text: controller.lessonInfoList[index].lessonCatName,
              textAlign: TextAlign.center,
              fontColor: BhajanColorConstant.white,
              fontStyle: FontStyle.normal,
              fontSize: 13.px,
              fontWeight: FontWeight.w400,
              fontFamily: AppTheme.baloobhai2,
            ),
          );
        }),
      ),
    );

Expanded secondTabBarView(NamavaliScreenController controller) => Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 10.px, right: 10.px),
      child: TabBarView(
        controller: namavaliScreenViewModel!.tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(controller.lessonInfoList.length, (index) {
          return Stack(
            children: [
              buildIncreaseChapter(),
              buildDecreaseChapter(),
              buildTextView(controller, index)
            ],
          );
        }),
      ),
    ));

Align buildIncreaseChapter() => Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () => namavaliScreenViewModel!.tabControllerDecrease(),
        child: Container(
            padding: EdgeInsets.all(8.px),
            height: 30.px,
            width: 31.px,
            decoration: const BoxDecoration(
              color: BhajanColorConstant.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: BhajanColorConstant.lightBlue,
                  offset: Offset(0, 7),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow//BoxShadow
              ],
            ),
            child: const AppImageAsset(
              image: BhajanAssets.backArrow,
              color: BhajanColorConstant.primary,
            )),
      ),
    );

Align buildDecreaseChapter() => Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => namavaliScreenViewModel!.tabControllerIncrease(),
        child: Container(
            padding: EdgeInsets.all(8.px),
            height: 30.px,
            width: 31.px,
            decoration: const BoxDecoration(
              color: BhajanColorConstant.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: BhajanColorConstant.lightBlue,
                  offset: Offset(0, 5),
                  blurRadius: 5,
                  spreadRadius: 1,
                ), //BoxShadow//BoxShadow
              ],
            ),
            child: const AppImageAsset(
              image: BhajanAssets.rightArrow,
              color: BhajanColorConstant.primary,
            )),
      ),
    );

Padding buildTextView(NamavaliScreenController controller, int index) => Padding(
      padding: EdgeInsets.only(top: 14.px, bottom: 10.px, right: 15.px, left: 27.px),
      child: SingleChildScrollView(
        child: Html(
          data: controller.lessonInfoList[index].lessonList[0].lesssonDescription,
          style: {
            "body": Style(
                textAlign: TextAlign.center,
                lineHeight: LineHeight(controller.lineHeight),
                letterSpacing: 0.75,
                fontStyle: FontStyle.normal,
                fontSize: FontSize(controller.textSize),
                fontWeight: FontWeight.w400,
                color: namavaliScreenViewModel!.showColorApply()),
          },
        ),
      ),
    );

buildBottomSheetView(NamavaliScreenController controller) =>
    Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.px),
        child: namavaliScreenViewModel!.playButtonBool
            ? Container()
            : namavaliScreenViewModel!.settButtonBool
                ? Container()
                : null,
      ),
      buildBottomMenuView()
    ]);

Widget editChapter(NamavaliScreenController controller) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: BhajanColorConstant.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(35.px), topRight: Radius.circular(35.px)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -2),
                color: BhajanColorConstant.gray.withOpacity(0.5),
                blurRadius: 0.5)
          ]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: InkWell(
                onTap: () => namavaliScreenViewModel!.rectangleShape(),
                child: Container(
                  margin: EdgeInsets.only(top: 15.px),
                  height: 5.px,
                  width: 111.px,
                  child: const AppImageAsset(image: BhajanAssets.rectangleShape),
                ),
              ),
            ),
            Container(
              height: 147.px,
              margin: EdgeInsets.only(left: 18.px, right: 26.px, top: 35.px, bottom: 10.px),
              decoration: BoxDecoration(
                  color: BhajanColorConstant.offWhite3, borderRadius: BorderRadius.circular(31.px)),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.textSizeIncrease(),
                        child: Container(
                          margin: EdgeInsets.only(top: 15.px, left: 16.px),
                          height: 28.px,
                          width: 62.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(16.5.px)),
                          child: AutoSizeText(
                            textAlign: TextAlign.start,
                            AppStringConstants.ab,
                            maxFontSize: 18.px,
                            style: GoogleFonts.roboto(
                                color: BhajanColorConstant.black, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 1,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.textSizeDecrease(),
                        child: Container(
                          margin: EdgeInsets.only(top: 15.px, left: 10.px),
                          height: 28.px,
                          width: 62.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(16.5.px)),
                          child: AutoSizeText(
                            textAlign: TextAlign.start,
                            AppStringConstants.aa,
                            maxFontSize: 15.px,
                            style: GoogleFonts.roboto(
                                color: BhajanColorConstant.black, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 1,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.lineHeightIncrease(),
                        child: Container(
                          margin: EdgeInsets.only(top: 15.px, left: 20.px),
                          height: 28.px,
                          width: 52.px,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(16.5.px)),
                          child: Container(
                              margin: EdgeInsets.only(top: 5.px),
                              child: const AppImageAsset(image: BhajanAssets.plus)),
                        ),
                      ),
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.lineHeightDecrease(),
                        child: Container(
                          margin: EdgeInsets.only(top: 15.px, left: 10.px, right: 15.px),
                          height: 28.px,
                          width: 52.px,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(16.5.px)),
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.px),
                              child: const AppImageAsset(image: BhajanAssets.minus)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.px,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.blackColorApply(),
                        child: Container(
                          height: 30.px,
                          width: 30.px,
                          margin: EdgeInsets.only(left: 28.px),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: BhajanColorConstant.black),
                        ),
                      ),
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.redColorApply(),
                        child: Container(
                          height: 30.px,
                          width: 30.px,
                          margin: EdgeInsets.only(left: 34.px),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: BhajanColorConstant.offRed),
                        ),
                      ),
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.darkRedColorApply(),
                        child: Container(
                          height: 30.px,
                          width: 30.px,
                          margin: EdgeInsets.only(left: 34.px),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: BhajanColorConstant.darkRed1),
                        ),
                      ),
                      InkWell(
                        onTap: () => namavaliScreenViewModel!.blueColorApply(),
                        child: Container(
                          height: 30.px,
                          width: 30.px,
                          margin: EdgeInsets.only(left: 34.px),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: BhajanColorConstant.status),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          gotoBack();
                        },
                        child: AppText(
                          text: AppStringConstants.gujarati,
                          fontSize: 15.px,
                          textAlign: TextAlign.center,
                          fontColor: namavaliScreenViewModel!.lang == true
                              ? BhajanColorConstant.mandirColor
                              : BhajanColorConstant.black,
                        ),
                      ),
                      SizedBox(width: 30.px),
                      Container(
                        width: 2.px,
                        height: 25.px,
                        color: BhajanColorConstant.offWhite1,
                      ),
                      SizedBox(
                        width: 30.px,
                      ),
                      InkWell(
                        onTap: () {
                          namavaliScreenViewModel!.lang = !namavaliScreenViewModel!.lang;
                          gotoBack();
                        },
                        child: AppText(
                          text: AppStringConstants.english,
                          fontSize: 15.px,
                          textAlign: TextAlign.center,
                          fontColor: namavaliScreenViewModel!.lang == false
                              ? BhajanColorConstant.mandirColor
                              : BhajanColorConstant.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 43.px,
              margin: EdgeInsets.only(left: 18.px, right: 26.px, top: 22.px, bottom: 17.px),
              decoration: BoxDecoration(
                  color: BhajanColorConstant.offWhite3, borderRadius: BorderRadius.circular(57.px)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      namavaliScreenViewModel!.lang = !namavaliScreenViewModel!.lang;
                      gotoBack();
                    },
                    child: AppText(
                      text: AppStringConstants.scroll,
                      fontSize: 15.px,
                      textAlign: TextAlign.center,
                      fontColor: namavaliScreenViewModel!.lang == true
                          ? BhajanColorConstant.mandirColor
                          : BhajanColorConstant.black,
                    ),
                  ),
                  SizedBox(width: 30.px),
                  Container(
                    width: 2.px,
                    height: 25.px,
                    color: BhajanColorConstant.offWhite1,
                  ),
                  SizedBox(
                    width: 30.px,
                  ),
                  InkWell(
                    onTap: () {
                      namavaliScreenViewModel!.lang = !namavaliScreenViewModel!.lang;
                      gotoBack();
                    },
                    child: AppText(
                      text: AppStringConstants.slide,
                      fontSize: 15.px,
                      textAlign: TextAlign.center,
                      fontColor: namavaliScreenViewModel!.lang == false
                          ? BhajanColorConstant.mandirColor
                          : BhajanColorConstant.black,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );

Container buildBottomMenuView() => Container(
      decoration: BoxDecoration(
          color: BhajanColorConstant.primary,
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(36.px), topLeft: Radius.circular(36.px))),
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () => namavaliScreenViewModel!.playButton(),
              child: AppImageAsset(image: BhajanAssets.audioPlay, height: 34.px, width: 34.px)),
          InkWell(
              onTap: () => namavaliScreenViewModel!.bookButton(),
              child: AppImageAsset(
                image: BhajanAssets.book4,
                height: 34.px,
                width: 34.px,
                color: BhajanColorConstant.white,
              )),
          InkWell(
            onTap: () => namavaliScreenViewModel!.settingButton(),
            child: AppImageAsset(image: BhajanAssets.setting, height: 34.px, width: 34.px),
          )
        ],
      ),
    );
