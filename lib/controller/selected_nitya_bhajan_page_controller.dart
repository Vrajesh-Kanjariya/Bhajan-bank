import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/server_response.dart';
import '../model/user_chart_report.dart';
import '../pages/selected_niyam_module/selected_nitya_bhajan/selected_nitya_bhajan_page.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class SelectedNityaBhajanPageController extends GetxController with GetTickerProviderStateMixin {
  UserChartReport? userChartReport;
  ServerResponse? serverResponse;
  bool isLoading = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedNityaBhajanViewModel!.getArguments();
    selectedNityaBhajanViewModel!.tabController = TabController(length: 3, vsync: this);
    selectedNityaBhajanViewModel!.tabControllerReport = TabController(length: 2, vsync: this);
  }

  Future<UserChartReport?> getUserChartReport(Map<String, dynamic> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.userChartReport, body: map);
      if (response != null && response.isNotEmpty) {
        userChartReport = userChartReportFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return userChartReport;
  }

  Future<ServerResponse?> saveDailyNiyamHistory(Map<String, dynamic> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.saveDailyNiyamHistory, body: map);
      if (response != null && response.isNotEmpty) {
        serverResponse = serverResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return serverResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
