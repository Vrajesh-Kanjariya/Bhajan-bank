import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/selected_niyam_module/meaning_mahima_history/meaning_mahima_history_page.dart';
import '../../../routes/app_navigation.dart';
import '../sandgrath_anushthan_application/sandgrath_anushthan_application_screen.dart';

buildMeaningMahimaHistoryBodyView() => Column(
  children: [
    Container(
      decoration: BoxDecoration(color: BhajanColorConstant.white,
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 3.4),
            spreadRadius: 1,
            color: BhajanColorConstant.black.withOpacity(0.3),
            blurRadius: 0.7)
      ]
      ),
      child: Stack(
        children: [
          Container(
            height: 150.px,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [BhajanColorConstant.status.withOpacity(0.1), BhajanColorConstant.white],
                )),
          ),
          Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 30.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      meaningMahimaHistoryViewModel = null;
                      gotoBack();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: BhajanColorConstant.black,
                    )),
                Expanded(
                  child: AppText(
                      text: meaningMahimaHistoryViewModel!.lessonInfoList.first.lessonCatName,
                      textAlign: TextAlign.center,
                      fontFamily: AppTheme.baloobhai2,
                      letterSpacing: 0.5,
                      fontStyle: FontStyle.normal,
                      fontSize: 25.px,
                      fontWeight: FontWeight.w700,
                      fontColor: BhajanColorConstant.status),
                ),
                SizedBox(width: 20.px),
              ],
            ),
            Container(
              height: 210.px,
              decoration: const BoxDecoration(),
              width: double.infinity,
              padding: EdgeInsets.only(top: 10.px),
              child: AppImageAsset(
                image: sandgrathAnushthanApplicationViewModel!.lessonResponse!.otherInfo!.image,
                isWebImage: true,
                webWidth: 160.px,
                webFit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 5.px),
          ]),
        ],
      ),
    ),
    buildTabBarNameView(),
    SizedBox(height: 10.px),
    buildTabExpandedView()
  ],
);

Container buildTabBarNameView() => Container(
      height: 48.px,
      decoration: BoxDecoration(color: BhajanColorConstant.white.withOpacity(0.4),
        border: Border(bottom: BorderSide(width: 0.5.px, color: BhajanColorConstant.gray)),
      ),
      child: TabBar(
          labelColor: BhajanColorConstant.black,
          controller: meaningMahimaHistoryViewModel!.tabController,
          labelStyle: GoogleFonts.balooBhai2(
            fontStyle: FontStyle.normal,
            letterSpacing: 0.25,
            fontSize: 20.px,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.balooBhai2(
            fontStyle: FontStyle.normal,
            letterSpacing: 0.25,
            fontSize: 20.px,
            fontWeight: FontWeight.w400,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.px, color: BhajanColorConstant.black),
          ),
          tabs: const [
            Tab(
              child: AppText(
                  text: AppStringConstants.meaning,
                  textAlign: TextAlign.center,
                  fontColor: BhajanColorConstant.black,
                  fontFamily: AppTheme.baloobhai2),
            ),
            Tab(
              child: AppText(
                  text: AppStringConstants.theGlory,
                  textAlign: TextAlign.center,
                  fontColor: BhajanColorConstant.black,
                  fontFamily: AppTheme.baloobhai2),
            ),
            Tab(
              child: AppText(
                  text: AppStringConstants.history,
                  textAlign: TextAlign.center,
                  fontColor: BhajanColorConstant.black,
                  fontFamily: AppTheme.baloobhai2),
            ),
          ]),
    );

Expanded buildTabExpandedView() => Expanded(
        child: TabBarView(
            controller: meaningMahimaHistoryViewModel!.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
          Padding(
            padding: EdgeInsets.all(8.px),
            child: SingleChildScrollView(
              child: HtmlText(
                text: sandgrathAnushthanApplicationViewModel!.lessonResponse!.otherInfo!.meaning,
                fontSize: 18.px,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.px),
            child: SingleChildScrollView(
              child: HtmlText(
                text: sandgrathAnushthanApplicationViewModel!.lessonResponse!.otherInfo!.mahima,
                fontSize: 18.px,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.px),
            child: SingleChildScrollView(
              child: HtmlText(
                text: sandgrathAnushthanApplicationViewModel!.lessonResponse!.otherInfo!.history,
                fontSize: 18.px,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ]));
