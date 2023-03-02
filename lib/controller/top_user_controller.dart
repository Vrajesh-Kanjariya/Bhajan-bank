import 'package:bank/pages/top_user/top_user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUserController extends GetxController with GetTickerProviderStateMixin{

  @override
  void onInit() {
    super.onInit();
    topUserViewModel!.tabController = TabController(length: 2, vsync: this);
    topUserViewModel!.tabController!.addListener(handleTabSelection);
  }

  handleTabSelection(){
    update();
  }
}