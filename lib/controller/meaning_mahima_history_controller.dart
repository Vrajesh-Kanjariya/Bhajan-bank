import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/selected_niyam_module/meaning_mahima_history/meaning_mahima_history_page.dart';

class MeaningMahimaHistoryController extends GetxController
    with GetTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    meaningMahimaHistoryViewModel!.getArguments();
    meaningMahimaHistoryViewModel!.tabController = TabController(length: 3, vsync: this);
  }
}
