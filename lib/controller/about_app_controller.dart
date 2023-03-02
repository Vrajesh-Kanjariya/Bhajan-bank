import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/about_app/about_app_page.dart';

class AboutAppController extends GetxController with GetTickerProviderStateMixin {
  @override
  Future<void> onInit() async {
    super.onInit();
    aboutAppViewModel!.tabController = TabController(length: 6, vsync: this);
  }
}
