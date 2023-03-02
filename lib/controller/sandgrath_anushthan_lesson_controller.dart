import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/server_response.dart';
import '../pages/selected_niyam_module/sandgrath_anushthan_lesson/sandgrath_anushthan_lesson.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class SandgrathAnushthanLessonController extends GetxController{
  ServerResponse? serverResponse;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double textSize = 18;
  double lineHeight = 1;

  @override
  void onInit() {
    super.onInit();
    sandgrathAnushthanLessonViewModel!.getArguments();
    sandgrathAnushthanLessonViewModel!.playAudio();
    sandgrathAnushthanLessonViewModel!.scrollControllerView();
  }

  Future<ServerResponse?> saveDailyNiyamHistory(
      Map<String, dynamic> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance.postRestCall(
          endpoint: RestConstants.instance.saveDailyNiyamHistory, body: map);
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
