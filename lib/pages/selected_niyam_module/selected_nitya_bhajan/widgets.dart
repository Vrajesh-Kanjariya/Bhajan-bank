import 'package:auto_size_text/auto_size_text.dart';
import 'package:charts_common/src/chart/common/behavior/legend/legend.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/selected_nitya_bhajan_page_controller.dart';
import '../../../model/user_chart_report.dart';
import '../../../pages/selected_niyam_module/selected_nitya_bhajan/selected_nitya_bhajan_page.dart';
import '../../../utils/utils.dart';

SingleChildScrollView selectedNityaBhajanBodyView(SelectedNityaBhajanPageController controller) =>
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 32.px, top: 5.px),
            child: AppText(
                text: AppStringConstants.targetAchievement,
                fontStyle: FontStyle.normal,
                fontSize: 22.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.darkBlue,
                fontFamily: AppTheme.hindsiliguri),
          ),
          buildTargetView(),
          Divider(
            color: BhajanColorConstant.dividerColor,
            thickness: 1.px,
            indent: 53.px,
            endIndent: 53.px,
          ),
          selectedNityaBhajanViewModel!.reportShow ? buildChartsView() : const SizedBox(),
          SizedBox(height: 10.px),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 72.px,
                width: 44.px,
              ),
              Expanded(
                child: AppText(
                  text: selectedNityaBhajanViewModel!.informationInfoList!.dailyUpadteTitle!
                      .toUpperCase(),
                  fontFamily: AppTheme.poppins,
                  maxLines: 2,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 20.px,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.status,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              InkWell(
                  onTap: () => selectedNityaBhajanViewModel!.onReportShow(controller),
                  child: AppImageAsset(
                    image: BhajanAssets.reportIcon,
                    height: 72.px,
                    width: 44.px,
                  ))
            ],
          ),
          SizedBox(height: 10.px),
          HtmlText(
            fontSize: 17.px,
            text: selectedNityaBhajanViewModel!.informationInfoList!.dailyInputTitle,
            textAlign: TextAlign.center,
            fontColor: Colors.grey.withOpacity(1),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10.px),
          buildEditTextFiledView(),
          if (selectedNityaBhajanViewModel!.informationInfoList!.subcatId == 8) buildTvView(),
          SizedBox(height: 25.px),
          if (selectedNityaBhajanViewModel!.informationInfoList!.buttonImage != null)
            buildButtonImageView(),
          if (selectedNityaBhajanViewModel!.informationInfoList!.subcatId == 4)
            Center(
                child: Container(
              margin: EdgeInsets.only(top: 5.px),
              height: 43.px,
              width: 185.px,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: BhajanColorConstant.grayBG,
                  borderRadius: BorderRadius.all(Radius.circular(9.px))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: AppStringConstants.number,
                    fontFamily: AppTheme.lato,
                    fontColor: BhajanColorConstant.textGray.withOpacity(0.5),
                    fontSize: 22.px,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 5.px),
                    child: AppText(
                      text: selectedNityaBhajanViewModel!.informationInfoList!.subCatName,
                      fontFamily: AppTheme.lato,
                      fontColor: BhajanColorConstant.textGray.withOpacity(0.5),
                      fontSize: 22.px,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )),
          SizedBox(height: 20.px),
           InkWell(onTap: () => selectedNityaBhajanViewModel!.saveDailyNiyam(),
             child: Align(alignment: Alignment.centerRight,child: Padding(
               padding:  EdgeInsets.only(right: 8.px),
               child: AppImageAsset(image: BhajanAssets.saveIcon,height: 45.px,width: 45.px,),
             )),
           ),
          SizedBox(height: 20.px),
          HtmlText(
              fontSize: 17.px,
              text: selectedNityaBhajanViewModel!.informationInfoList!.note,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontColor: Colors.grey.withOpacity(1)),
          SizedBox(height: 20.px),
          buildScrollPageView()
        ],
      ),
    );

Padding buildTargetView() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppImageAsset(
                image: BhajanAssets.flagStand,
                width: 24.px,
                height: 192.px,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.px, top: 8.px),
                    child: Container(
                      width: 156.px,
                      height: 32.px,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(BhajanAssets.flagTopLeft)),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.px),
                        child: AppText(
                          text: AppStringConstants.myDaily,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.px,
                          fontWeight: FontWeight.w600,
                          fontColor: BhajanColorConstant.white,
                          fontFamily: AppTheme.poppins,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.px),
                    child: Container(
                      width: 124.px,
                      height: 32.px,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(BhajanAssets.flagLeftCenter)),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.px),
                        child: AppText(
                          text: AppStringConstants.target,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.px,
                          fontWeight: FontWeight.w600,
                          fontColor: BhajanColorConstant.maxDarkRed,
                          fontFamily: AppTheme.poppins,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.px),
                    child: Container(
                      width: 156.px,
                      height: 32.px,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(BhajanAssets.flagLeftBottom)),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.px),
                        child: AppText(
                          text:
                              '${selectedNityaBhajanViewModel!.informationInfoList!.myDailyTarget} '
                                  '/ ${NumberFormat.decimalPattern().format(selectedNityaBhajanViewModel!.informationInfoList!.myDailyTotalTarget)}',
                          fontStyle: FontStyle.normal,
                          fontSize: 12.px,
                          fontWeight: FontWeight.w600,
                          fontColor: BhajanColorConstant.white,
                          fontFamily: AppTheme.poppins,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 24.px, 0, 24.px),
                child: AppImageAsset(
                  image: BhajanAssets.coin1,
                  width: 68.px,
                  height: 68.px,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(padding: EdgeInsets.only(right: 13.px), child: buildTargetFlagView()),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppImageAsset(
                image: BhajanAssets.flagStand,
                width: 24.px,
                height: 192.px,
                fit: BoxFit.fill,
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: buildTempleView()),
          ],
        ),
      ),
    );

Column buildTargetFlagView() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 13.px, top: 8.px),
          child: Container(
            width: 156.px,
            height: 32.px,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(BhajanAssets.flagTopRight)),
                shape: BoxShape.rectangle),
            child: Padding(
              padding: EdgeInsets.only(left: 16.px),
              child: AppText(
                text: AppStringConstants.myAnnual,
                fontStyle: FontStyle.normal,
                fontSize: 15.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.white,
                fontFamily: AppTheme.poppins,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 45.px),
          child: Container(
            width: 124.px,
            height: 32.px,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(BhajanAssets.flagRightCenter)),
                shape: BoxShape.rectangle),
            child: Padding(
              padding: EdgeInsets.only(right: 8.px),
              child: AppText(
                text: AppStringConstants.target,
                fontStyle: FontStyle.normal,
                fontSize: 15.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.maxDarkRed,
                fontFamily: AppTheme.poppins,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.px),
          child: Container(
            width: 154.5.px,
            height: 32.px,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(BhajanAssets.flagRightBottom)),
                shape: BoxShape.rectangle),
            child: Padding(
              padding: EdgeInsets.only(left: 16.px),
              child: AutoSizeText(
                '${NumberFormat.decimalPattern().format(selectedNityaBhajanViewModel!.informationInfoList!.myAnnualRemainingTarget)} '
                    '/ ${NumberFormat.decimalPattern().format(selectedNityaBhajanViewModel!.informationInfoList!.myAnnualTotalTarget)}',
                style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w600,
                    color: BhajanColorConstant.white),
                minFontSize: 10.px,
                stepGranularity: 10,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );

Column buildTempleView() => Column(children: [
      SizedBox(height: 120.px),
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
                text: NumberFormat.decimalPattern().format(
                    int.parse(selectedNityaBhajanViewModel!.informationInfoList!.overallTarget!)),
                fontFamily: AppTheme.poppins,
                overflow: TextOverflow.ellipsis,
                fontSize: 22.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.white),
            AppText(
                text: ' / ',
                fontFamily: AppTheme.poppins,
                fontSize: 24.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.white),
            Expanded(
              child: AppText(
                  text: NumberFormat.decimalPattern().format(
                      selectedNityaBhajanViewModel!.informationInfoList!.overallTotalTarget),
                  overflow: TextOverflow.ellipsis,
                  fontFamily: AppTheme.poppins,
                  fontSize: 22.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.white),
            ),
          ],
        ),
      )
    ]);

Container buildChartsView() => Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: Device.height * 0.45.px,
      width: Device.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: BhajanColorConstant.black.withOpacity(0.18.px),
          offset: const Offset(2, 2.0),
          blurRadius: 1.0,
          spreadRadius: 1.0,
        ), //BoxShadow
      ], color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(10.px)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.px),
          buildChartsWeekTabBar(),
          SizedBox(height: 10.px),
          buildChartGrafView(),
          SizedBox(height: 5.px),
          buildReportTabBarView()
        ],
      ),
    );

Container buildChartsWeekTabBar() => Container(
      height: 35.px,
      width: 200.px,
      decoration: BoxDecoration(
        color: BhajanColorConstant.white,
        boxShadow: [
          BoxShadow(
            color: BhajanColorConstant.black.withOpacity(0.18.px),
            offset: const Offset(0.0, 2.0),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(18.px),
      ),
      child: TabBar(
          padding: EdgeInsets.all(4.px),
          indicator: BoxDecoration(
              color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(20.px)),
          labelColor: BhajanColorConstant.white,
          unselectedLabelColor: BhajanColorConstant.tabBarText,
          controller: selectedNityaBhajanViewModel!.tabController,
          //  indicatorColor: Colors.transparent,
          tabs: [
            Tab(
                child: Text(
              AppStringConstants.week,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                letterSpacing: -0.25,
                fontStyle: FontStyle.normal,
                fontSize: 10.px,
                fontWeight: FontWeight.w500,
              ),
            )),
            Tab(
                child: Text(
              AppStringConstants.month,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                letterSpacing: -0.25,
                fontStyle: FontStyle.normal,
                fontSize: 10.px,
                fontWeight: FontWeight.w500,
              ),
            )),
            Tab(
              child: Text(
                AppStringConstants.year,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  letterSpacing: -0.25,
                  fontStyle: FontStyle.normal,
                  fontSize: 10.px,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ]),
    );

Expanded buildChartGrafView() => Expanded(
      child: TabBarView(
          controller: selectedNityaBhajanViewModel!.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    BhajanColorConstant.target.withOpacity(0.5),
                    BhajanColorConstant.white,
                    BhajanColorConstant.achievement.withOpacity(0.5),
                    BhajanColorConstant.white,
                  ],
                  stops: const [
                    0.2,
                    0.4,
                    0.6,
                    0.9,
                  ],
                ).createShader(bounds);
              },
              child: charts.BarChart(
                createSampleData(),
                animate: false,
                barGroupingType: charts.BarGroupingType.grouped,
                defaultRenderer: charts.BarRendererConfig(
                    cornerStrategy: const charts.ConstCornerStrategy(20), maxBarWidthPx: 20),
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  tickProviderSpec: charts.BasicNumericTickProviderSpec(
                    desiredMinTickCount: 6,
                    desiredMaxTickCount: 10,
                  ),
                ),
                secondaryMeasureAxis: const charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(
                        desiredTickCount: 6, desiredMaxTickCount: 10)),
                selectionModels: [
                  charts.SelectionModelConfig(changedListener: (charts.SelectionModel model) {
                    if (model.hasDatumSelection) {
                      logs('${model.selectedSeries[0].measureFn(model.selectedDatum[0].index)}');
                    }
                  })
                ],
                behaviors: [
                  charts.SeriesLegend.customLayout(
                    CustomLegendBuilder(),
                    position: charts.BehaviorPosition.top,
                    outsideJustification: charts.OutsideJustification.start,
                  ),
                ],
                //  animate: false,
              ),
            ),
            AppText(
                text: AppStringConstants.month,
                letterSpacing: -0.25,
                fontStyle: FontStyle.normal,
                fontSize: 10.px,
                fontWeight: FontWeight.w500,
                fontColor: BhajanColorConstant.tabBarText,
                fontFamily: AppTheme.poppins),
            AppText(
              text: AppStringConstants.year,
              letterSpacing: -0.25,
              fontStyle: FontStyle.normal,
              fontSize: 10.px,
              fontWeight: FontWeight.w500,
              fontColor: BhajanColorConstant.tabBarText,
              fontFamily: AppTheme.poppins,
            ),
          ]),
    );

Padding buildReportTabBarView() => Padding(
      padding: EdgeInsets.only(bottom: 10.px),
      child: Container(
        width: Device.width * 0.64,
        height: 35.px,
        decoration: BoxDecoration(
          color: BhajanColorConstant.status,
          borderRadius: BorderRadius.circular(6.px),
        ),
        child: TabBar(
            padding: EdgeInsets.all(4.px),
            indicator: BoxDecoration(
                color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(4.px)),
            labelColor: BhajanColorConstant.white,
            controller: selectedNityaBhajanViewModel!.tabControllerReport,
            //  indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                child: AppText(
                  text: AppStringConstants.myReport,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.normal,
                  fontSize: 11.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.poppins,
                ),
              ),
              Tab(
                child: AppText(
                    text: AppStringConstants.overallTarget,
                    textAlign: TextAlign.center,
                    fontFamily: AppTheme.poppins,
                    letterSpacing: -0.25,
                    fontStyle: FontStyle.normal,
                    fontSize: 11.px,
                    fontWeight: FontWeight.w500),
              ),
            ]),
      ),
    );

List<charts.Series<Info, String>> createSampleData() {
  return [
    charts.Series<Info, String>(
        id: AppStringConstants.achievement.toLowerCase(),
        domainFn: (Info sales, _) => sales.date,
        measureFn: (Info sales, _) => sales.achievementBar,
        data: selectedNityaBhajanViewModel!.userChartReportList ?? [],
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(BhajanColorConstant.achievement),
        displayName: AppStringConstants.achievement),
    charts.Series<Info, String>(
        id: AppStringConstants.target.toLowerCase(),
        domainFn: (Info sales, _) => sales.date,
        measureFn: (Info sales, _) => sales.targetBar,
        data: selectedNityaBhajanViewModel!.userChartReportList ?? [],
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(BhajanColorConstant.target),
        displayName: AppStringConstants.target)
      ..setAttribute(charts.measureAxisIdKey, selectedNityaBhajanViewModel!.secondaryMeasureAxisId),
  ];
}

class CustomLegendBuilder extends charts.LegendContentBuilder {
  @override
  Widget build(BuildContext context, LegendState<dynamic> legendState, Legend<dynamic> legend,
      {bool? showMeasures}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: legend.chart.currentSeriesList
            .map<Widget>((e) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
                margin: EdgeInsets.all(5.px),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5.px,
                      backgroundColor: e.displayName!.contains(AppStringConstants.achievement)
                          ? BhajanColorConstant.achievement
                          : BhajanColorConstant.target,
                    ),
                    SizedBox(
                      width: 5.px,
                    ),
                    AppText(
                      text: e.displayName!,
                      fontColor: BhajanColorConstant.black.withOpacity(0.6),
                      fontSize: 8.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppTheme.poppins,
                    ),
                  ],
                )))
            .toList());
  }
}

Padding buildTvView() => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AppImageAsset(
              image: BhajanAssets.tv,
              width: 275.px,
              height: 163.px,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AppImageAsset(
                image: BhajanAssets.tvPhoto, width: 273.px, height: 145.px, fit: BoxFit.fill),
          ),
          const Positioned(
              top: 45,
              bottom: 45,
              left: 45,
              right: 45,
              child: AppImageAsset(image: BhajanAssets.play))
        ],
      ),
    );

InkWell buildButtonImageView() => InkWell(
    onTap: () => selectedNityaBhajanViewModel!.gotoButtonImage(),
    child: Center(
        child: AppImageAsset(
      image: selectedNityaBhajanViewModel!.informationInfoList!.buttonImage,
      webHeight: 37.px,
      webWidth: 200.px,
      isWebImage: true,
      placeHolder: const SizedBox(),
    )));

Padding buildEditTextFiledView() => Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: selectedNityaBhajanViewModel!.formKey,
        child: Center(
          child: Container(
            alignment: Alignment.center,

            width: 264.px,
            decoration: BoxDecoration(
                color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(52.px)),
            child: TextFormField(
              maxLength: 5,
              controller: selectedNityaBhajanViewModel!.dailyTarget,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStringConstants.pleaseEnterDailyTarget;
                }
                return null;
              },
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 30.px,
                  fontWeight: FontWeight.w900,
                  color: BhajanColorConstant.darkBlue),
              decoration: InputDecoration(
                counterText: '',
                suffixIconConstraints: const BoxConstraints(maxHeight: 19),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: AppImageAsset(image: BhajanAssets.pencilIcon),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(52.px),
                    borderSide: BorderSide(color: BhajanColorConstant.primary, width: 2.px)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(52.px),
                    borderSide: BorderSide(color: BhajanColorConstant.primary, width: 2.px)),
              ),
            ),
          ),
        ),
      ),
    );

Padding buildScrollPageView() => Padding(
      padding: EdgeInsets.only(bottom: 15.px, right: 25.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
                SizedBox(width: 5.px),
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
