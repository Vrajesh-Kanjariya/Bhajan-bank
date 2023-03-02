import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/lesson_response.dart';
import '../../../pages/selected_niyam_module/meaning_mahima_history/meaning_mahima_history_page.dart';

class MeaningMahimaHistoryViewModel {
  late MeaningMahimaHistoryPage meaningMahimaHistoryPage;
  List<LessonInfoList> lessonInfoList = [];
  TabController? tabController;

  MeaningMahimaHistoryViewModel(this.meaningMahimaHistoryPage) {}

  getArguments() async {
    lessonInfoList = Get.arguments['lessonInfoList'];
  }
}
