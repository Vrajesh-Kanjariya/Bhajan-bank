import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/top_user_controller.dart';
import '../../pages/top_user/top_user_page.dart';
import '../../utils/shared_preference.dart';

class TopUserViewModel {
  late TopUserPage topUserPage;
  TopUserController? topUserController;
  String membersId = '';
  String registrationId = '';
  TabController? tabController;

  TopUserViewModel(this.topUserPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      topUserController = Get.find<TopUserController>();
      membersId = await getPrefStringValue(memberIdKey) ?? '';
      registrationId = await getPrefStringValue(registrationId) ?? '';
    });
  }
}
