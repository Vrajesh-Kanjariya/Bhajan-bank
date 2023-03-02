import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../app/widgets/calendar/src/customization/calendar_builders.dart';
import '../../../app/widgets/calendar/src/customization/calendar_style.dart';
import '../../../app/widgets/calendar/src/shared/utils.dart';
import '../../../app/widgets/calendar/src/table_calendar.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/selected_niyam_module/selected_niyam_chesta/selected_niyam_chesta_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/utils.dart';

ListView buildSelectedNiyamChestaBodyView() => ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 17.px, left: 32.px),
          child: AppText(
              text: AppStringConstants.targetAchievement,
              fontFamily: AppTheme.hindsiliguri,
              fontStyle: FontStyle.normal,
              fontSize: 22.px,
              fontWeight: FontWeight.w600,
              fontColor: BhajanColorConstant.darkBlue),
        ),
        buildAnnualTargetView(),
        if (selectedNiyamChestaPageViewModel!.informationInfoList!.videoUrl != null) buildTvView(),
        AppText(
            textAlign: TextAlign.center,
            text: AppStringConstants.todayNiyam,
            fontFamily: AppTheme.poppins,
            letterSpacing: 0.75,
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            fontColor: BhajanColorConstant.darkBlue2),
        SizedBox(height: 4.px),
        Padding(
          padding: EdgeInsets.only(left: 10.px, right: 10.px),
          child: AppText(
              textAlign: TextAlign.center,
              text: selectedNiyamChestaPageViewModel!.informationInfoList!.note,
              fontFamily: AppTheme.baloobhai2,
              letterSpacing: 0.75,
              fontStyle: FontStyle.normal,
              fontSize: 17.px,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              fontColor: BhajanColorConstant.blackGrey),
        ),
        buildBookOnYesNoButtonView(),
        SizedBox(height: 27.px),
        Divider(
          color: BhajanColorConstant.dividerColor,
          thickness: 1.px,
          indent: 35.px,
          endIndent: 35.px,
        ),
        Center(
          child: InkWell(
            onTap: () {
              if (selectedNiyamChestaPageViewModel!.informationInfoList!.isTypeStatus == 4) {
                gotoDailyKatha(selectedNiyamChestaPageViewModel!.informationInfoList!);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 17.px),
              child: AppImageAsset(
                image: selectedNiyamChestaPageViewModel!.informationInfoList!.buttonImage!,
                isWebImage: true,
                placeHolder: const SizedBox(),
                webWidth: 200.px,
              ),
            ),
          ),
        ),
        selectedNiyamChestaPageViewModel!.informationInfoList!.subcatId != 35
            ? buildCalendarView()
            : Padding(
                padding: EdgeInsets.only(top: 20.px),
                child: AppText(
                  maxLines: 2,
                  text: AppStringConstants.homeText,
                  fontFamily: AppTheme.baloobhai2,
                  textAlign: TextAlign.center,
                  fontColor: BhajanColorConstant.blackGrey,
                  fontSize: 17.px,
                ),
              ),
        Padding(
          padding: EdgeInsets.only(left: 40.px, right: 40.px, top: 23.px, bottom: 26.px),
          child: AppText(
            text: selectedNiyamChestaPageViewModel!.informationInfoList!.dailyInputTitle,
            textAlign: TextAlign.center,
            fontSize: 17.px,
            fontWeight: FontWeight.w500,
            fontColor: BhajanColorConstant.blackGrey,
            fontFamily: AppTheme.baloobhai2,
            maxLines: 4,
          ),
        ),
        buildPageScrollView()
      ],
    );

Container buildAnnualTargetView() => Container(
      alignment: Alignment.center,
      width: Device.width,
      height: 122.px,
      decoration:
          const BoxDecoration(image: DecorationImage(image: AssetImage(BhajanAssets.redBox))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.5, left: 40),
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
                        image: DecorationImage(image: AssetImage(BhajanAssets.pinkArrow))),
                  ),
                  Container(
                    width: 39.px,
                    height: 50.px,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(BhajanAssets.pinkArrow))),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 18.px),
              child: Column(
                children: [
                  AppText(
                      text: AppStringConstants.myTotalCount,
                      fontFamily: AppTheme.poppins,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.px,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.white),
                  HtmlText(
                    textAlign: TextAlign.center,
                    fontSize: 36.px,
                    fontWeight: FontWeight.w600,
                    text:
                        '${selectedNiyamChestaPageViewModel!.informationInfoList!.target} '
                            '/ ${selectedNiyamChestaPageViewModel!.informationInfoList!.totalTarget1}',
                    fontColor: BhajanColorConstant.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Padding buildTvView() => Padding(
      padding: EdgeInsets.only(top: 10.px, bottom: 21.px),
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

Padding buildBookOnYesNoButtonView() => Padding(
      padding: EdgeInsets.only(top: 11.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            onTap: () => selectedNiyamChestaPageViewModel!.saveDailyNiyam(),
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

Container buildCalendarView() => Container(
  decoration: BoxDecoration(boxShadow: [
    BoxShadow(
      color: BhajanColorConstant.boxShadowPink.withOpacity(0.14),
      offset: const Offset(4.0, 4.0),
      blurRadius: 2.px,
      spreadRadius: 1.0,
    ), //BoxShadow
  ], borderRadius: BorderRadius.circular(15.px), color: BhajanColorConstant.white),
  padding: EdgeInsets.only(left: 20.px, right: 20.px),
  margin: EdgeInsets.only(bottom: 10.px, left: 20.px, right: 20.px,top: 27.px),
  child: TableCalendar<Event>(
    firstDay: kFirstDay,
    lastDay: kLastDay,
    focusedDay: selectedNiyamChestaPageViewModel!.ffocusedDay,
    calendarFormat: selectedNiyamChestaPageViewModel!.calendarFormat,
    startingDayOfWeek: StartingDayOfWeek.monday,
    eventLoader: selectedNiyamChestaPageViewModel!.getEventsForDay,
    calendarStyle: CalendarStyle(
      isTodayHighlighted: true,
      outsideDaysVisible: false,
      cellMargin: const EdgeInsets.all(0.5),
      markersAlignment: Alignment.center,
      defaultTextStyle: const TextStyle(fontWeight: FontWeight.w700),
      weekendTextStyle: const TextStyle(fontWeight: FontWeight.w700),
      selectedTextStyle: const TextStyle(fontWeight: FontWeight.w700),
      todayTextStyle: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
      todayDecoration: BoxDecoration(
        color: BhajanColorConstant.bhaktAkhyan,
        shape: BoxShape.circle,
        border: Border.all(width: 2.px, color: BhajanColorConstant.status),
      ),
    ),
    onDaySelected: (selectedDay, focusedDay) {
    },
    onPageChanged: (focusedDay) {
    },
    calendarBuilders: CalendarBuilders(
      todayBuilder: (context, dateTime, date1) {
        return Container(
          alignment: Alignment.center,
          height: 30.px,
          width: 30.px,
          decoration: const BoxDecoration(
            color: BhajanColorConstant.bgColor1,
            shape: BoxShape.circle,
          ),
          child: AppText(
              text: DateTime.now().day.toString(),
              fontWeight: FontWeight.w700,
              fontColor: Colors.white),
        );
      },
      markerBuilder: (context, dateTime, date1) {
        return Container();
      },
      selectedBuilder: (context, date, _) {
        return Container(
          height: 30.px,
          width: 30.px,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: BhajanColorConstant.red),
          ),
          child: AppText(
              text: '${date.day}',
              fontSize: 14.px,
              fontColor: BhajanColorConstant.black,
              fontWeight: FontWeight.bold),
        );
      },
    ),
    availableGestures: AvailableGestures.horizontalSwipe,
  ),
);

Container buildPageScrollView() => Container(
      height: 95.px,
      margin: EdgeInsets.only(left: 25.px, right: 25.px),
      child: Column(
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
