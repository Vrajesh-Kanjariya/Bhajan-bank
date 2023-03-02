import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/announcement_response.dart';
import '../model/information_response.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class HomePageController extends GetxController with GetSingleTickerProviderStateMixin {
  bool status = true;
  int levelClock = 0;
  AnimationController? animationController;
  bool isLoading = false;
  AnnouncementResponse? announcement;
  InformationResponse? informationResponse;

  void timeView() {
    final DateTime startDate = DateTime.now();
    final DateTime endDate = DateTime.parse('2024-03-31');
    final int startDateInMS = startDate.millisecondsSinceEpoch;
    final int endDateInMS = endDate.millisecondsSinceEpoch;
    final Duration duration = Duration(milliseconds: endDateInMS - startDateInMS);
    levelClock = duration.inSeconds;
    animationController = AnimationController(vsync: this, duration: Duration(seconds: levelClock));
    animationController!.forward();
  }

  @override
  void onInit() {
    timeView();
    super.onInit();
  }

  @override
  void onClose() {
    animationController!.dispose(); // you need this
  }

   Future<AnnouncementResponse?> getAnnouncementDataApi(
      Map<String, dynamic> selectAnnouncementMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.announcement, body: selectAnnouncementMap);
      if (response != null && response.isNotEmpty) {
        announcement = announcementFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return announcement;
  }

  Future<InformationResponse?> getInformationList(Map<String, Object> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.informationList, body: map);
      if (response != null && response.isNotEmpty) {
        informationResponse = informationResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return informationResponse;
  }

  void showLoader(bool val) {
    isLoading = val;
    update();
  }
}
