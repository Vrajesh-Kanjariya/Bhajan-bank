import '../../../routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/selected_niyam_module/sadgranth_anushthan_path/sandgrath_anushthan_path_page.dart';

Padding buildBodyView() => Padding(
      padding: const EdgeInsets.all(1.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.px, left: 20.px),
              child: AppText(
                  text: AppStringConstants.targetAchievement,
                  textAlign: TextAlign.left,
                  fontFamily: AppTheme.hindsiliguri,
                  fontStyle: FontStyle.normal,
                  fontSize: 22.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.darkBlue),
            ),
            SizedBox(height: 5.px),
            buildAnnualTargetView(),
            buildTempleTargetView(),
            Container(
              padding: EdgeInsets.all(8.px),
              margin: EdgeInsets.only(
                  left: 15.px, right: 15.px, top: 12.px, bottom: 18.px),
              height: 308.px,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: BhajanColorConstant.amber1,
                      offset: const Offset(4, 4),
                      blurRadius: 2.px,
                      spreadRadius: 1.0,
                    )
                  ],
                  color: BhajanColorConstant.white,
                  borderRadius: BorderRadius.circular(12.px)),
              child: buildReportView(),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.px, right: 40.px, bottom: 30.px),
              decoration: BoxDecoration(
                  color: BhajanColorConstant.niyamGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(4.px),
                child: buildAppAndBookTabBarView(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: Device.height * 0.23.px,
              child: TabBarView(
                  controller: sadgranthAnushthanPathViewModel!.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildApplicationVachnamrutView(),
                    buildBookVachnamrutView()
                  ]),
            ),
            buildPageScrollView()
          ],
        ),
      ),
    );

Container buildAnnualTargetView() => Container(
      alignment: Alignment.center,
      width: Device.width,
      height: 122.px,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(BhajanAssets.redBox))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 5.5.px, left: 40.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.px,
                  ),
                  Container(
                    width: 39.px,
                    height: 50.px,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(BhajanAssets.pinkArrow))),
                  ),
                  Container(
                    width: 39.px,
                    height: 50.px,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(BhajanAssets.pinkArrow))),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 15.px),
              child: Column(
                children: [
                  AppText(
                      text: AppStringConstants.myAnnualTarget,
                      fontFamily: AppTheme.poppins,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.px,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.white),
                  HtmlText(
                    textAlign: TextAlign.center,
                    fontSize: 28.px,
                    fontWeight: FontWeight.w600,
                    text:
                        '${sadgranthAnushthanPathViewModel!.informationInfoList!.myAnnualTarget}'
                        ' / ${sadgranthAnushthanPathViewModel!.informationInfoList!.myAnnualTotalTarget}',
                    fontColor: BhajanColorConstant.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Column buildTempleTargetView() => Column(children: [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.px, right: 30.px),
            child: const AppImageAsset(
              image: BhajanAssets.blueBackgroundTemple,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: AppText(
                  text: AppStringConstants.overallTarget,
                  fontFamily: AppTheme.poppins,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.white,
                  textAlign: TextAlign.center)),
        ],
      ),
      Container(
        height: 45.px,
        color: BhajanColorConstant.mandirColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
                text: NumberFormat.decimalPattern().format(int.parse(
                    sadgranthAnushthanPathViewModel!
                        .informationInfoList!.overallTarget!)),
                fontFamily: AppTheme.poppins,
                fontSize: 22.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.white),
            AppText(
                text: ' / ',
                fontFamily: AppTheme.poppins,
                fontSize: 24.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.white),
            AppText(
                text: NumberFormat.decimalPattern().format(
                    sadgranthAnushthanPathViewModel!
                        .informationInfoList!.overallTotalTarget),
                fontFamily: AppTheme.poppins,
                fontSize: 22.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.white),
          ],
        ),
      )
    ]);

Column buildReportView() => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [buildChartAndTargetView(), buildReportTabBarView()],
    );

Row buildChartAndTargetView() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildChartView(),
        Container(
          height: 200.px,
          width: 1.px,
          color: BhajanColorConstant.divider.withOpacity(0.39),
        ),
        buildTargetTotalView()
      ],
    );

Expanded buildChartView() => Expanded(
      child: SizedBox(
        height: 250.px,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.px, top: 20.px),
              child: chart(),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 10.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 15.px,
                      width: 70.px,
                      child: Row(
                        children: [
                          Container(
                            height: 7.px,
                            width: 7.px,
                            decoration: const BoxDecoration(
                                color: BhajanColorConstant.pieYellow,
                                shape: BoxShape.circle),
                          ),
                          SizedBox(width: 4.px),
                          Expanded(
                            child: AppText(
                              overflow: TextOverflow.ellipsis,
                              text: AppStringConstants.currentPath,
                              fontSize: 8.px,
                              fontFamily: AppTheme.poppins,
                              fontWeight: FontWeight.w500,
                              fontColor: BhajanColorConstant.tabBarText,
                            ),
                          )
                        ],
                      )),
                  const Spacer(),
                  SizedBox(
                      height: 15.px,
                      width: 70.px,
                      child: Row(children: [
                        Container(
                          height: 7.px,
                          width: 7.px,
                          decoration: const BoxDecoration(
                              color: BhajanColorConstant.maxDarkRed,
                              shape: BoxShape.circle),
                        ),
                        SizedBox(width: 4.px),
                        Expanded(
                          child: AppText(
                            overflow: TextOverflow.ellipsis,
                            text: AppStringConstants.totalPath,
                            fontSize: 8.px,
                            fontFamily: AppTheme.poppins,
                            fontWeight: FontWeight.w500,
                            fontColor: BhajanColorConstant.tabBarText,
                          ),
                        )
                      ])),
                  SizedBox(width: 5.px),
                ],
              ),
            ),
            SizedBox(height: 20.px)
          ],
        ),
      ),
    );

SizedBox chart() => SizedBox(
      height: 175.px,
      width: 175.px,
      child: Stack(
        children: [
          SfRadialGauge(axes: [
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 1,
              axisLineStyle: const AxisLineStyle(
                thickness: 1,
                color: BhajanColorConstant.whiteGray,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: 70,
                  width: 0.3.px,
                  color: BhajanColorConstant.pieYellow,
                  pointerOffset: 0.1,
                  cornerStyle: CornerStyle.bothFlat,
                  sizeUnit: GaugeSizeUnit.factor,
                ),
              ],
            ),
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 1,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: BhajanColorConstant.whiteGray,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: const <GaugePointer>[
                RangePointer(
                  value: 100,
                  width: 0.06,
                  pointerOffset: 0,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: BhajanColorConstant.gray,
                ),
                RangePointer(
                  value: 50,
                  width: 0.06,
                  pointerOffset: 0,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: BhajanColorConstant.maxDarkRed,
                ),
              ],
            ),
            RadialAxis(
              minimum: 0,
              interval: 1,
              maximum: 6,
              showLabels: false,
              showTicks: true,
              showAxisLine: false,
              tickOffset: -0.1,
              offsetUnit: GaugeSizeUnit.factor,
              minorTicksPerInterval: 0,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.91,
              majorTickStyle: const MajorTickStyle(
                length: 0.06,
                thickness: 2,
                lengthUnit: GaugeSizeUnit.factor,
                color: BhajanColorConstant.whiteGray,
              ),
            ),
          ]),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AppImageAsset(
                  image: BhajanAssets.chartImage,
                  height: 100.px,
                  width: 100.px,
                ),
              ),
              Center(
                child: AppText(
                  text: "70%",
                  fontFamily: AppTheme.lato,
                  fontColor: BhajanColorConstant.amber,
                  fontSize: 25.px,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );

Expanded buildTargetTotalView() => Expanded(
      child: Container(
          height: 250.px,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  text: AppStringConstants.numberOfLessonRemaining.tr,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.black),
              AppText(
                  text: '04',
                  fontFamily: AppTheme.poppins,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.amber),
              SizedBox(height: 20.px),
              AppText(
                  text: AppStringConstants.everyDayAchieveYourGoal.tr,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.black),
              AppText(
                  text: AppStringConstants.readThePledge.tr,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.black),
              AppText(
                  text: '02',
                  fontFamily: AppTheme.poppins,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.amber),
            ],
          )),
    );

Padding buildReportTabBarView() => Padding(
      padding: EdgeInsets.only(bottom: 5.px),
      child: Container(
        width: Device.width * 0.6.px,
        height: 35.px,
        decoration: BoxDecoration(
          color: BhajanColorConstant.status,
          borderRadius: BorderRadius.circular(6.px),
        ),
        child: TabBar(
            padding: EdgeInsets.all(6.px),
            indicator: BoxDecoration(
                color: BhajanColorConstant.primary,
                borderRadius: BorderRadius.circular(6.px)),
            controller: sadgranthAnushthanPathViewModel!.tabControllerReport,
            labelColor: Colors.white,
            tabs: [
              Tab(
                  child: AppText(
                text: AppStringConstants.myReport,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                fontSize: 10.px,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.poppins,
              )),
              Tab(
                  child: AppText(
                      text: AppStringConstants.overallTarget,
                      textAlign: TextAlign.center,
                      fontFamily: AppTheme.poppins,
                      letterSpacing: -0.25,
                      fontStyle: FontStyle.normal,
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500)),
            ]),
      ),
    );

SizedBox buildAppAndBookTabBarView() => SizedBox(
      height: 42.px,
      child: TabBar(
          controller: sadgranthAnushthanPathViewModel!.tabController,
          padding: EdgeInsets.all(5.px),
          indicator: BoxDecoration(
              color: BhajanColorConstant.primary,
              borderRadius: BorderRadius.circular(8.px)),
          labelColor: Colors.white,
          unselectedLabelColor: BhajanColorConstant.primary,
          tabs: [
            Tab(
              child: Padding(
                padding: EdgeInsets.only(top: 3.px),
                child: Text(
                  sadgranthAnushthanPathViewModel!
                      .informationInfoList!.readCategory![0].readType!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.balooBhai2(
                    fontStyle: FontStyle.normal,
                    fontSize: 16.px,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Tab(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  sadgranthAnushthanPathViewModel!
                      .informationInfoList!.readCategory![1].readType!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.balooBhai2(
                    letterSpacing: 0.75,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ]),
    );

SingleChildScrollView buildApplicationVachnamrutView() => SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () => gotoSadgranthAnusthanApplication(sadgranthAnushthanPathViewModel!.informationInfoList!),
            child: Center(
              child: AppImageAsset(
                image: sadgranthAnushthanPathViewModel!
                    .informationInfoList!.buttonImage!,
                isWebImage: true,
                placeHolder: const SizedBox(),
                webWidth: 210.px,
              ),
            ),
          ),
          Center(
            child: HtmlText(
              fontColor: BhajanColorConstant.offGrey,
              textAlign: TextAlign.center,
              text: sadgranthAnushthanPathViewModel!
                  .informationInfoList!.noteApp
                  .toString(),
              fontSize: 16.px,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.px),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: AppStringConstants.specialInformation.tr,
                  style: GoogleFonts.balooBhai2(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.75,
                      color: BhajanColorConstant.offGrey,
                      fontSize: 16.px),
                  children: [
                    const WidgetSpan(
                        child: Icon(Icons.info,
                            color: BhajanColorConstant.offGrey)),
                    TextSpan(
                      text: AppStringConstants.clickOnInfo.tr,
                      style: GoogleFonts.balooBhai2(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.75,
                          color: BhajanColorConstant.offGrey,
                          fontSize: 16.px),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );

SingleChildScrollView buildBookVachnamrutView() => SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // if (sadgranthAnushthanPathViewModel!
              //         .informationInfoList!.isTypeStatus ==
              //     3) {
                gotoSadgranthAnusthanBook(
                    sadgranthAnushthanPathViewModel!.informationInfoList!);
            //  }
            },
            child: Center(
              child: AppImageAsset(
                image: sadgranthAnushthanPathViewModel!
                    .informationInfoList!.buttonImage!,
                isWebImage: true,
                placeHolder: const SizedBox(),
                webWidth: 210.px,
              ),
            ),
          ),
          SizedBox(height: 10.px),
          Center(
            child: HtmlText(
              textAlign: TextAlign.center,
              fontColor: BhajanColorConstant.offGrey,
              text: sadgranthAnushthanPathViewModel!.informationInfoList!.note
                  .toString(),
              fontSize: 16.px,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.px),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: AppStringConstants.specialInformation.tr,
                  style: GoogleFonts.balooBhai2(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.75,
                      color: BhajanColorConstant.offGrey,
                      fontSize: 16.px),
                  children: [
                    const WidgetSpan(
                        child: Icon(Icons.info,
                            color: BhajanColorConstant.offGrey)),
                    TextSpan(
                      text: AppStringConstants.clickOnInfo.tr,
                      style: GoogleFonts.balooBhai2(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.75,
                          color: BhajanColorConstant.offGrey,
                          fontSize: 16.px),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );

Padding buildPageScrollView() => Padding(
      padding: EdgeInsets.only(bottom: 15.px, left: 25.px, right: 25.px),
      child: Row(
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
    );
