import 'dart:collection';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void logs(String message) {
  log(message);
  // if (kDebugMode) {
  //   print(message);
  // }
}

void warningToast(String msg, Color color, {int? maxLine}) {
  BotToast.showNotification(
    // leading: (icons) => AppImageAsset(image: AssetsConstant.warning),
    title: (_) => Text(
      msg,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.px,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: (_) => Padding(
      padding: EdgeInsets.only(top: 8.px),
      child: Text(
        msg,
        style: TextStyle(color: Colors.white, fontSize: 13.px),
        maxLines: maxLine ?? 2,
      ),
    ),
    backgroundColor: color,
    borderRadius: 15,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(seconds: 1),
  );
}

void successToast(String msg) {
  BotToast.showNotification(
    title: (_) => Text(
      msg,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.px,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: Colors.green,
    borderRadius: 15,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(seconds: 1),
  );
}

void errorToast(String msg) {
  BotToast.showNotification(
    // leading: (icons) => const Icon(Icons.close,color: Colors.red,),
    title: (_) => Text(
      msg,
      style: TextStyle(
        color: Colors.red,
        fontSize: 16.px,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: Colors.black,
    borderRadius: 15,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(seconds: 1),
  );
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

final kNow = DateTime.now();
final kFirstDay = DateTime(kNow.year - 10, kNow.month, kNow.day);
final kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

List<String> dateHere = ["2021-06-20", "2021-06-25", "2021-06-26"];

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(dateHere.length, (index) => index))
    DateFormat("yyyy-MM-dd").parse(dateHere[item].toString()):
        List.generate(1, (index) => const Event('Event'))
};

bool isSameDay(DateTime a, DateTime b) {
  // ignore: unnecessary_null_comparison
  if (b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

disableScreenshot() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

DateTime? clickTime;
bool isRedundentClick(DateTime currentTime) {
  if (clickTime == null) {
    clickTime = currentTime;
    logs("first click");
    return false;
  }
  logs('diff is ${currentTime.difference(clickTime!).inSeconds}');
  if (currentTime.difference(clickTime!).inSeconds < 1) {
    return true;
  }

  clickTime = currentTime;
  return false;
}