import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/about_app_controller.dart';
import 'about_app_page.dart';

class AboutAppViewModel {
  AboutAppPage? appPage;
  AboutAppController? controller;
  TabController? tabController;

  AboutAppViewModel(this.appPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      controller = Get.find<AboutAppController>();
    });
  }

}
