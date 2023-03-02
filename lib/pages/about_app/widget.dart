import 'package:bank/app/widgets/app_image_asset.dart';
import 'package:bank/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_text.dart';
import '../../constant/bhajan_assets.dart';
import 'about_app_page.dart';

Widget aboutAppBodyView() => Column(
      children: [
        aboutAppImage(),
        aboutTab(),
        TabView(),
      ],
    );

Widget aboutAppImage() => Material(
  elevation: 15.0,
  shadowColor: BhajanColorConstant.greyTab.withOpacity(0.5),
  child:   AppImageAsset(
        image: BhajanAssets.aboutAppImage,
        height: 290.px,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
);

Widget aboutTab() => Container(
      height: 48.px,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.px, color: BhajanColorConstant.greyTab))),
      child: TabBar(
          labelColor: BhajanColorConstant.black,
          controller: aboutAppViewModel!.tabController,
          isScrollable: true,
          labelStyle: GoogleFonts.balooBhai2(
            fontStyle: FontStyle.normal,
            letterSpacing: 0.25,
            fontSize: 18.px,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.balooBhai2(
            fontStyle: FontStyle.normal,
            letterSpacing: 0.25,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.px, color: BhajanColorConstant.black),
          ),
          tabs: const [
            Tab(
              child: AppText(
                text: 'હેતુ',
                textAlign: TextAlign.center,
                fontColor: BhajanColorConstant.black,
              ),
            ),
            Tab(
              child: AppText(
                text: 'નિત્ય ભજન',
                textAlign: TextAlign.center,
                fontColor: BhajanColorConstant.black,
              ),
            ),
            Tab(
              child: AppText(
                text: 'સદગ્રંથ અનુષ્ઠાન',
                textAlign: TextAlign.center,
                fontColor: BhajanColorConstant.black,
              ),
            ),
            Tab(
              child: AppText(
                text: 'મુખપાઠ',
                textAlign: TextAlign.center,
                fontColor: BhajanColorConstant.black,
              ),
            ),
            Tab(
              child: AppText(
                text: 'સદગ્રંથ વાંચન',
                textAlign: TextAlign.center,
                fontColor: BhajanColorConstant.black,
              ),
            ),
            Tab(
              child: AppText(
                text: 'આદર્શ પરિવાર માટેના નિયમો',
                textAlign: TextAlign.center,
                fontColor: BhajanColorConstant.black,
              ),
            ),
          ]),
    );

Widget TabView() => Expanded(
        child: TabBarView(
            controller: aboutAppViewModel!.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlText(
                text: "init.lesson!.otherInfo!.meaning",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlText(
                text: "init.lesson!.otherInfo!.mahima",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlText(
                text: "jfhifg",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),   Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlText(
                text: "init.lesson!.otherInfo!.meaning",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlText(
                text: "init.lesson!.otherInfo!.mahima",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: HtmlText(
                text: "jfhifg",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ]));
