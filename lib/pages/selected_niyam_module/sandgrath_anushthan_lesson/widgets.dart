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
import '../../../controller/sandgrath_anushthan_lesson_controller.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_lesson/sandgrath_anushthan_lesson.dart';
import '../../../routes/app_navigation.dart';

buildSandgrathAnushthanLessonBodyView(
        SandgrathAnushthanLessonController controller, BuildContext context) =>
    Padding(
      padding: EdgeInsets.only(left: 10.px, right: 10.px),
      child: SizedBox(
        height: double.infinity,
        child: PageView.builder(
            controller: sandgrathAnushthanLessonViewModel!.pageController,
            onPageChanged: (position) {
              sandgrathAnushthanLessonViewModel!.currentPosition = position;
              controller.update();
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SingleChildScrollView(controller: sandgrathAnushthanLessonViewModel!.scrollController,
                    child: Html(
                      data: sandgrathAnushthanLessonViewModel!
                          .lessonList[sandgrathAnushthanLessonViewModel!.currentPosition]
                          .lesssonDescription,
                      style: {
                        "body": Style(
                            textAlign: TextAlign.center,lineHeight:LineHeight(controller.lineHeight),
                            letterSpacing: 0.75,
                            fontStyle: FontStyle.normal,
                            fontSize: FontSize(controller.textSize),
                            fontWeight: FontWeight.w400,
                            color: sandgrathAnushthanLessonViewModel!.showColorApply()),
                      },
                    ),
                  ),
                  buildChapterPageBackArrowView(controller),
                  buildChapterPageRightArrowView(controller)
                ],
              );
            },
            itemCount: sandgrathAnushthanLessonViewModel!.lessonList.length),
      ),
    );

Align buildChapterPageBackArrowView(SandgrathAnushthanLessonController controller) => Align(
    alignment: Alignment.centerLeft,
    child: InkWell(
        onTap: () => sandgrathAnushthanLessonViewModel!.backPage(),
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
            ))));

Align buildChapterPageRightArrowView(SandgrathAnushthanLessonController controller) => Align(
    alignment: Alignment.centerRight,
    child: InkWell(
        onTap: () => sandgrathAnushthanLessonViewModel!.previousPage(),
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
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ), //BoxShadow//BoxShadow
              ],
            ),
            child: const AppImageAsset(
              image: BhajanAssets.rightArrow,
              color: BhajanColorConstant.primary,
            ))));

buildBottomSheetView(SandgrathAnushthanLessonController controller) => Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.px),
        child: sandgrathAnushthanLessonViewModel!.playButtonBool
            ? audioPlayer()
            : sandgrathAnushthanLessonViewModel!.settButtonBool
                ? Container()
                : sandgrathAnushthanLessonViewModel!.listLastPosition ? buildReadButtonView() : null,
      ),
      buildBottomMenuView()
    ]);

Row buildReadButtonView() => Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              AppText(
                text: AppStringConstants.allReadThen,
                fontColor: BhajanColorConstant.red,
                fontSize: 16.px,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.baloobhai2,
              ),
              AppText(
                text: AppStringConstants.readButtonClick,
                fontColor: BhajanColorConstant.red,
                fontSize: 16.px,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.baloobhai2,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => sandgrathAnushthanLessonViewModel!.saveReadButton(),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.px),
            child: AppImageAsset(
              image: BhajanAssets.readImage,
              height: 71.px,
              width: 71.px,
            ),
          ),
        )
      ],
    );

Widget audioPlayer() {
  return Container(
    height: 100.px,
    width: double.infinity,
    margin: EdgeInsets.only(left: 10.px, right: 10.px),
    decoration: BoxDecoration(
        color: BhajanColorConstant.gray.withOpacity(0.2),
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(8.px), topRight: Radius.circular(8.px))),
    child: Column(children: [
      Container(
        height: 30.px,
        color: Colors.yellow,
        margin: EdgeInsets.only(left: 10.px, right: 10.px, top: 10.px),
      ),
      SizedBox(height: 2.px),
      Padding(
        padding: EdgeInsets.only(left: 10.px, right: 10.px),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppText(
              text: sandgrathAnushthanLessonViewModel!.position
                  .toString()
                  .split('.')
                  .first
                  .substring(2, 7),
              fontSize: 10.px,
              fontColor: BhajanColorConstant.black,
              fontFamily: AppTheme.poppins),
          AppText(
              text: sandgrathAnushthanLessonViewModel!.player.duration
                  .toString()
                  .split('.')
                  .first
                  .substring(2, 7),
              fontSize: 10.px,
              fontColor: BhajanColorConstant.black,
              fontFamily: AppTheme.poppins),
        ]),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.px),
          child: InkWell(
            onTap: () {},
            child: AppImageAsset(image: BhajanAssets.retryAudio, height: 25.px),
          ),
        ),
        SizedBox(width: 10.px),
        Padding(
          padding: EdgeInsets.only(bottom: 5.px),
          child: InkWell(
            onTap: () => sandgrathAnushthanLessonViewModel!.playerLess(),
            child: AppImageAsset(image: BhajanAssets.playerLess, height: 25.px),
          ),
        ),
        SizedBox(width: 10.px),
        InkWell(
            onTap: () => sandgrathAnushthanLessonViewModel!.playAudioButton(),
            child: sandgrathAnushthanLessonViewModel!.playing
                ? const Icon(Icons.pause)
                : AppImageAsset(image: BhajanAssets.player, height: 35.px)),
        SizedBox(width: 10.px),
        Padding(
          padding: EdgeInsets.only(bottom: 5.px),
          child: InkWell(
            onTap: () => sandgrathAnushthanLessonViewModel!.player
                .seek(sandgrathAnushthanLessonViewModel!.position + const Duration(seconds: 15)),
            child: AppImageAsset(image: BhajanAssets.playerMore, height: 25.px),
          ),
        ),
        SizedBox(width: 10.px),
        InkWell(
          onTap: () => sandgrathAnushthanLessonViewModel!.player.setSpeed(1),
          child: Padding(
            padding: EdgeInsets.only(bottom: 5.px),
            child: AppImageAsset(image: BhajanAssets.player1x, height: 25.px),
          ),
        ),
      ]),
    ]),
  );
}

Widget editChapter(SandgrathAnushthanLessonController controller) {
  return Container(width: double.infinity,
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
              onTap: () => sandgrathAnushthanLessonViewModel!.rectangleShape(),
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
                    InkWell(onTap: () => sandgrathAnushthanLessonViewModel!.textSizeIncrease(),
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
                          style: GoogleFonts.roboto(color: BhajanColorConstant.black,fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 1,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    InkWell(onTap: () => sandgrathAnushthanLessonViewModel!.textSizeDecrease(),
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
                          style: GoogleFonts.roboto(color: BhajanColorConstant.black,fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 1,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(onTap: () => sandgrathAnushthanLessonViewModel!.lineHeightIncrease(),
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
                    InkWell(onTap: () => sandgrathAnushthanLessonViewModel!.lineHeightDecrease(),
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
                SizedBox(height: 18.px,),
                Row(
                  children: [
                    InkWell(
                      onTap: () => sandgrathAnushthanLessonViewModel!.blackColorApply(),
                      child: Container(
                        height: 30.px,
                        width: 30.px,
                        margin: EdgeInsets.only(left: 28.px),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: BhajanColorConstant.black),
                      ),
                    ),
                    InkWell(
                      onTap: () => sandgrathAnushthanLessonViewModel!.redColorApply(),
                      child: Container(
                        height: 30.px,
                        width: 30.px,
                        margin: EdgeInsets.only(left: 34.px),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: BhajanColorConstant.offRed),
                      ),
                    ),
                    InkWell(
                      onTap: () => sandgrathAnushthanLessonViewModel!.darkRedColorApply(),
                      child: Container(
                        height: 30.px,
                        width: 30.px,
                        margin: EdgeInsets.only(left: 34.px),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: BhajanColorConstant.darkRed1),
                      ),
                    ),
                    InkWell(
                      onTap: () => sandgrathAnushthanLessonViewModel!.blueColorApply(),
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
                        sandgrathAnushthanLessonViewModel!.lang =
                            !sandgrathAnushthanLessonViewModel!.lang;
                        gotoBack();
                      },
                      child: AppText(
                        text: AppStringConstants.gujarati,
                        fontSize: 15.px,
                        textAlign: TextAlign.center,
                        fontColor: sandgrathAnushthanLessonViewModel!.lang == true
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
                        sandgrathAnushthanLessonViewModel!.lang =
                            !sandgrathAnushthanLessonViewModel!.lang;
                        gotoBack();
                      },
                      child: AppText(
                        text: AppStringConstants.english,
                        fontSize: 15.px,
                        textAlign: TextAlign.center,
                        fontColor: sandgrathAnushthanLessonViewModel!.lang == false
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
                    sandgrathAnushthanLessonViewModel!.lang =
                        !sandgrathAnushthanLessonViewModel!.lang;
                    gotoBack();
                  },
                  child: AppText(
                    text: AppStringConstants.scroll,
                    fontSize: 15.px,
                    textAlign: TextAlign.center,
                    fontColor: sandgrathAnushthanLessonViewModel!.lang == true
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
                    sandgrathAnushthanLessonViewModel!.lang =
                        !sandgrathAnushthanLessonViewModel!.lang;
                    gotoBack();
                  },
                  child: AppText(
                    text: AppStringConstants.slide,
                    fontSize: 15.px,
                    textAlign: TextAlign.center,
                    fontColor: sandgrathAnushthanLessonViewModel!.lang == false
                        ? BhajanColorConstant.mandirColor
                        : BhajanColorConstant.black,
                  ),
                ),
              ],
            ),
          ),
        ]),
  );
}

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
              onTap: () => sandgrathAnushthanLessonViewModel!.playButton(),
              child: AppImageAsset(image: BhajanAssets.audioPlay, height: 34.px, width: 34.px)),
          InkWell(
              onTap: () => sandgrathAnushthanLessonViewModel!.bookButton(),
              child: AppImageAsset(
                image: BhajanAssets.book4,
                height: 34.px,
                width: 34.px,
                color: BhajanColorConstant.white,
              )),
          InkWell(
            onTap: () => sandgrathAnushthanLessonViewModel!.settingButton(),
            child: AppImageAsset(image: BhajanAssets.setting, height: 34.px, width: 34.px),
          )
        ],
      ),
    );
