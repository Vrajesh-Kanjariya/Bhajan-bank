import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../app/widgets/bhajan_loader.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/selected_niyam_module/selected_sadagrantha_vanchan/selected_sadagrantha_vanchan_page.dart';

Widget buildSelectedSadagranthaVanchanBodyView() =>
    selectedSadagranthaVanchanViewModel!.mukhapathDataList != null
        ? Column(
            children: [
              SizedBox(height: 15.px),
              buildAppAndBookTabBarView(),
              SizedBox(height: 22.px),
              Expanded(
                child: TabBarView(
                    controller: selectedSadagranthaVanchanViewModel!.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50.px, right: 50.px),
                            child: AppText(
                              text: selectedSadagranthaVanchanViewModel!
                                  .informationInfoList!.noteApp!,
                              textAlign: TextAlign.center,
                              fontSize: 17.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.baloobhai2,
                              fontColor: BhajanColorConstant.blackGrey,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 13.px),
                          buildAppOnListView(),
                          SizedBox(height: 24.px),
                          buildReadMoreButton(),
                          SizedBox(height: 31.px),
                        ],
                      ),
                      ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50.px, right: 50.px, bottom: 25.px),
                            child: AppText(
                              text: selectedSadagranthaVanchanViewModel!.informationInfoList!.note,
                              textAlign: TextAlign.center,
                              fontSize: 17.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.baloobhai2,
                              fontColor: BhajanColorConstant.blackGrey,
                              maxLines: 2,
                            ),
                          ),
                          buildBookOnListView(),
                          buildBookOnYesNoButtonView()
                        ],
                      ),
                    ]),
              ),
              buildPageScrollView()
            ],
          )
        : BhajanLoader(loaderSize: 20.px);

Container buildAppAndBookTabBarView() => Container(
      width: Device.width * 0.82.px,
      height: 42.px,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: BhajanColorConstant.offBlack, borderRadius: BorderRadius.circular(8)),
      child: TabBar(
          controller: selectedSadagranthaVanchanViewModel!.tabController,
          padding: const EdgeInsets.all(5),
          indicator: BoxDecoration(
              color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(8)),
          labelColor: Colors.white,
          unselectedLabelColor: BhajanColorConstant.primary,
          tabs: [
            Tab(
              child: Text(
                selectedSadagranthaVanchanViewModel!
                    .mukhapathDataList![0].readCategory![0].readType!,
                textAlign: TextAlign.center,
                style: GoogleFonts.balooBhai2(
                  fontStyle: FontStyle.normal,
                  fontSize: 16.px,
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Tab(
              child: Text(
                selectedSadagranthaVanchanViewModel!
                    .mukhapathDataList![0].readCategory![1].readType!,
                textAlign: TextAlign.center,
                style: GoogleFonts.balooBhai2(
                  letterSpacing: 0.75,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
    );

ListView buildAppOnListView() => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedSadagranthaVanchanViewModel!.mukhapathDataList!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 21.px, right: 18.px),
          height: 187.px,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.px),
              border: Border.all(color: BhajanColorConstant.greenLight, width: 2.px)),
          child: Stack(
            children: [
              Row(children: [
                Expanded(
                    child: Stack(
                  children: [
                    AppImageAsset(
                      image: BhajanAssets.rectangleImage,
                      fit: BoxFit.fill,
                      height: 183.px,
                      color: BhajanColorConstant.greenLight,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 1,
                      child: Column(
                        children: [
                          AppText(
                              text: AppStringConstants.utshavNimite,
                              fontColor: BhajanColorConstant.black,
                              fontSize: 12.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.baloobhai2,
                              textAlign: TextAlign.center),
                          Padding(
                            padding: EdgeInsets.only(right: 10.px, top: 3.px),
                            child: AppImageAsset(
                              image: selectedSadagranthaVanchanViewModel!
                                  .mukhapathDataList![index].mainImage!,
                              isWebImage: true,
                              webWidth: 80.px,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 120.px, right: 4),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          AppText(
                              text: AppStringConstants.utshavNimite1,
                              fontColor: BhajanColorConstant.red,
                              fontSize: 12.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.baloobhai2,
                              textAlign: TextAlign.center),
                          AppText(
                              text: AppStringConstants.totalPath1,
                              fontColor: BhajanColorConstant.black,
                              fontSize: 19.px,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTheme.baloobhai2,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(children: [
                  Container(
                    height: 26.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 27.px, top: 21.px, left: 17.px),
                    decoration: BoxDecoration(
                        color: BhajanColorConstant.greenLight,
                        borderRadius: BorderRadius.circular(34.px)),
                    child: AppText(
                        text: AppStringConstants.meaning,
                        fontColor: BhajanColorConstant.black,
                        fontSize: 19.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTheme.baloobhai2,
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    height: 26.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 27.px, top: 8.px, left: 17.px),
                    decoration: BoxDecoration(
                        color: BhajanColorConstant.greenLight,
                        borderRadius: BorderRadius.circular(34.px)),
                    child: AppText(
                        text: AppStringConstants.theGlory,
                        fontColor: BhajanColorConstant.black,
                        fontSize: 19.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTheme.baloobhai2,
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    height: 26.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 27.px, top: 8.px, left: 17.px),
                    decoration: BoxDecoration(
                        color: BhajanColorConstant.greenLight,
                        borderRadius: BorderRadius.circular(34.px)),
                    child: AppText(
                        text: AppStringConstants.history,
                        fontColor: BhajanColorConstant.black,
                        fontSize: 19.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTheme.baloobhai2,
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 5.px,
                  ),
                  AppText(
                    text:
                        selectedSadagranthaVanchanViewModel!.mukhapathDataList![index].subCatName!,
                    fontColor: BhajanColorConstant.greenDark,
                    fontSize: 15.px,
                    fontFamily: AppTheme.baloobhai2,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  AppText(
                      text:
                          '${selectedSadagranthaVanchanViewModel!.mukhapathDataList![index].myDailyTarget.toString()}'
                          '/${selectedSadagranthaVanchanViewModel!.mukhapathDataList![index].TotalTarget.toString()}',
                      fontFamily: AppTheme.poppins,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.greenDark,
                      fontSize: 12.px),
                ])),
              ]),
              Container(
                padding: EdgeInsets.only(bottom: 3.px),
                alignment: Alignment.bottomCenter,
                child: LinearPercentIndicator(
                  barRadius: const Radius.circular(10),
                  lineHeight: 14.px,
                  width: 315.px,
                  percent: 0.2,
                  progressColor: BhajanColorConstant.greenDark,
                  center: AppText(
                    text:
                        selectedSadagranthaVanchanViewModel!.mukhapathDataList![index].progressBar,
                    fontSize: 8,
                    fontFamily: AppTheme.poppins,
                    fontWeight: FontWeight.w600,
                    fontColor: BhajanColorConstant.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 24.px,
        );
      },
    );

Container buildReadMoreButton() => Container(
      height: 57.px,
      margin: EdgeInsets.symmetric(horizontal: 70.px),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.px), color: BhajanColorConstant.primary),
      child: Row(
        children: [
          SizedBox(
            width: 20.px,
          ),
          AppText(
            text: AppStringConstants.otherBooks.tr,
            fontSize: 19.px,
            fontWeight: FontWeight.w900,
            fontColor: BhajanColorConstant.white,
            fontFamily: AppTheme.poppins,
          ),
          SizedBox(
            width: 15.px,
          ),
          AppImageAsset(
            image: BhajanAssets.rightArrowBooks,
            color: BhajanColorConstant.white,
            height: 25.px,
            width: 25.px,
          )
        ],
      ),
    );

ListView buildBookOnListView() => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedSadagranthaVanchanViewModel!.mukhapathDataList!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 29.px, right: 30.px),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BhajanColorConstant.hex(
                selectedSadagranthaVanchanViewModel!.mukhapathDataList![index].bkColor!),
            borderRadius: BorderRadius.all(Radius.circular(49.px)),
          ),
          height: 47.px,
          child: AppText(
            text: selectedSadagranthaVanchanViewModel!.mukhapathDataList![index].subCatName!,
            textAlign: TextAlign.center,
            letterSpacing: 0.75,
            fontStyle: FontStyle.normal,
            fontSize: 24.px,
            fontWeight: FontWeight.w500,
            fontColor: BhajanColorConstant.white,
            fontFamily: AppTheme.baloobhai2,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 13.px,
        );
      },
    );

Padding buildBookOnYesNoButtonView() => Padding(
      padding: EdgeInsets.only(top: 33.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            onTap: () {},
            text: AppStringConstants.yes.toUpperCase(),
            textColor: BhajanColorConstant.white,
            textAlign: TextAlign.center,
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            color: BhajanColorConstant.greenButton,
            height: 42.px,
            width: 127.px,
            borderRadius: BorderRadius.circular(0),
          ),
          SizedBox(
            width: 10.px,
          ),
          AppButton(
            onTap: () {},
            text: AppStringConstants.no.toUpperCase(),
            textColor: BhajanColorConstant.white,
            textAlign: TextAlign.center,
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            color: BhajanColorConstant.deepOrange,
            height: 42.px,
            width: 127.px,
            borderRadius: BorderRadius.circular(0),
          ),
        ],
      ),
    );

Padding buildPageScrollView() => Padding(
  padding: EdgeInsets.only(left: 25.px, right: 25.px),
  child:   Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: AppStringConstants.visheMahit,
            style: GoogleFonts.balooBhai2(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.75,
                color: BhajanColorConstant.offGrey,
                fontSize: 17.px),
            children: [
              WidgetSpan(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 4.px),
                child: const Icon(
                  Icons.info,
                  color: BhajanColorConstant.offGrey,
                ),
              )),
              TextSpan(
                text: AppStringConstants.infoClick,
                style: GoogleFonts.balooBhai2(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.75,
                    color: BhajanColorConstant.offGrey,
                    fontSize: 17.px),
              )
            ]),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppImageAsset(
                  image: BhajanAssets.leftArrowIcon,
                  width: 17.px,
                  height: 17.px,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 5.px),
                AppText(
                    text: AppStringConstants.namePrevious,
                    fontFamily: AppTheme.baloobhai2,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.75,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w500,
                    fontColor: BhajanColorConstant.black),
              ]),
              AppText(
                  text: AppStringConstants.previous,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w500,
                  fontColor: BhajanColorConstant.black),
            ],
          ),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppText(
                    text: AppStringConstants.moreName,
                    fontFamily: AppTheme.baloobhai2,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.75,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w500,
                    fontColor: BhajanColorConstant.black),
                SizedBox(
                  width: 5.px,
                ),
                AppImageAsset(
                  image: BhajanAssets.rightArrow,
                  width: 17.px,
                  height: 17.px,
                  fit: BoxFit.fill,
                ),
              ]),
              AppText(
                  text: AppStringConstants.next,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w500,
                  fontColor: BhajanColorConstant.black),
            ],
          ),
        ],
      ),
    ],
  ),
);
