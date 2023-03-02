import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/selected_niyam_module/sadgranth_anushthan_path/sandgrath_anushthan_path_page.dart';

class SadgranthAnushthanPathController extends GetxController with GetTickerProviderStateMixin{
  @override
  void onInit() {
    super.onInit();
    sadgranthAnushthanPathViewModel!.getArguments();
    sadgranthAnushthanPathViewModel!.tabController = TabController(length: 2, vsync: this);
    sadgranthAnushthanPathViewModel!.tabControllerReport = TabController(length: 2, vsync: this);
  }
}
