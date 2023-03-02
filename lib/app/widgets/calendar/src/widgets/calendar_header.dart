import 'package:bank/app/widgets/app_text.dart';
import 'package:bank/app/widgets/app_theme.dart';
import 'package:bank/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat, DayBuilder;

class CalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime? focusedMonth;
  final CalendarFormat? calendarFormat;
  final HeaderStyle? headerStyle;
  final VoidCallback? onPreviousMonthTap;
  final VoidCallback? onNextMonthTap;
  final VoidCallback? onPreviousYearTap;
  final VoidCallback? onNextYearTap;
  final VoidCallback? onHeaderTap;
  final VoidCallback? onHeaderLongPress;
  final ValueChanged<CalendarFormat>? onFormatButtonTap;
  final Map<CalendarFormat, String>? availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const CalendarHeader({
    Key? key,
    this.locale,
    this.focusedMonth,
    this.calendarFormat,
    this.headerStyle,
    this.onPreviousMonthTap,
    this.onNextMonthTap,
    this.onPreviousYearTap,
    this.onNextYearTap,
    this.onHeaderTap,
    this.onHeaderLongPress,
    this.onFormatButtonTap,
    this.availableCalendarFormats,
    this.headerTitleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle!.titleTextFormatter?.call(focusedMonth!, locale) ??
        DateFormat.yMMMM(locale).format(focusedMonth!);

    return Container(
      decoration: headerStyle!.decoration,
      margin: headerStyle!.headerMargin,
      padding: headerStyle!.headerPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: onPreviousMonthTap,
                child: Container(
                    alignment: Alignment.center,
                    child: Material(
                        borderRadius: BorderRadius.circular(15),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: BhajanColorConstant.dividerColor,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.px),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: BhajanColorConstant.darkPink2,
                              size: 20,
                            ),
                          ),
                        )))),
          ),
          Expanded(
            flex: 4,
            child: headerTitleBuilder?.call(context, focusedMonth!) ??
                GestureDetector(
                  onTap: onHeaderTap,
                  onLongPress: onHeaderLongPress,
                  child: Center(
                    child: AppText(
                      text: text,
                      textAlign: headerStyle!.titleCentered ? TextAlign.center : TextAlign.start,
                      fontColor: BhajanColorConstant.darkPink2,fontSize: 22.px,fontWeight: FontWeight.w900,fontFamily: AppTheme.poppins,
                    ),
                  ),
                ),
          ),
          /* if (headerStyle.formatButtonVisible &&
              availableCalendarFormats.length > 1)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FormatButton(
                onTap: onFormatButtonTap,
                availableCalendarFormats: availableCalendarFormats,
                calendarFormat: calendarFormat,
                decoration: headerStyle.formatButtonDecoration,
                padding: headerStyle.formatButtonPadding,
                textStyle: headerStyle.formatButtonTextStyle,
                showsNextFormat: headerStyle.formatButtonShowsNext,
              ),
            ),*/
          // Expanded(
          //     flex: 2,
          //     child: Row(
          //       children: [
          //         if (headerStyle.rightChevronVisible)
          //           CustomIconButton(
          //             icon: headerStyle.rightChevronIcon,
          //             onTap: onRightChevronTap,
          //             margin: headerStyle.rightChevronMargin,
          //             padding: headerStyle.rightChevronPadding,
          //           ),
          //       ],
          //     ))

          // Expanded(
          //   flex: 1,
          //   child: InkWell(
          //     onTap: onNextMonthTap,
          //     child: const AppImageAsset(
          //       image: BhajanAssets.facebook,
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: onNextMonthTap,
                child: Container(
                    alignment: Alignment.center,
                    child: Material(
                        borderRadius: BorderRadius.circular(15),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: BhajanColorConstant.dividerColor,
                          child: Icon(Icons.arrow_forward_ios,
                              color: BhajanColorConstant.darkPink2, size: 20),
                        )))),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
