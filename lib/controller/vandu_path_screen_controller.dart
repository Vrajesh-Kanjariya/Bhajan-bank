import 'dart:io';

import 'package:get/get.dart';

import '../model/lesson_response.dart';
import '../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/vandu_path_screen.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class VanduPathScreenController extends GetxController {
  LessonResponse? lessonResponse;
  bool isLoading = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    vanduPathScreenViewModel!.getArguments();
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
