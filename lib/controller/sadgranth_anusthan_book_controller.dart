import 'dart:io';

import 'package:get/get.dart';

import '../model/lesson_response.dart';
import '../model/server_response.dart';
import '../pages/selected_niyam_module/sadgranth_anusthan_book/sadgranth_anusthan_book_screen.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class SadgranthAnusthanBookController extends GetxController {
  bool isLoading = false;
  LessonResponse? lessonResponse;
  ServerResponse? serverResponse;

  @override
  void onInit() {
    super.onInit();
    sadgranthAnusthanBookViewModel!.getArguments();
  }

  Future<LessonResponse?> getLessonList(Map<String, Object> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.lessonList, body: map);
      if (response != null && response.isNotEmpty) {
        lessonResponse = lessonResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return lessonResponse;
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
