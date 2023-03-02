import 'dart:io';

import 'package:bank/utils/string_extensions.dart';
import 'package:get/get.dart';

import '../model/lesson_response.dart';
import '../pages/selected_niyam_module/sandgrath_anushthan_application/sandgrath_anushthan_application_screen.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class SandgrathAnushthanApplicationController extends GetxController {
  bool isLoading = false;
  LessonResponse? lessonResponse;

  @override
  void onInit() {
    super.onInit();
    sandgrathAnushthanApplicationViewModel!.getArguments();
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

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
