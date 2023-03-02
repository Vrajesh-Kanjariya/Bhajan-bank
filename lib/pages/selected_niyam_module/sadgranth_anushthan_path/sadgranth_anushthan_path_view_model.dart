import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/information_response.dart';
import '../../../pages/selected_niyam_module/sadgranth_anushthan_path/sandgrath_anushthan_path_page.dart';
import '../../../utils/shared_preference.dart';

class SadgranthAnushthanPathViewModel {
  late SadgranthAnushthanPathPage sadgranthAnushthanPathPage;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  TabController? tabController;
  TabController? tabControllerReport;

  SadgranthAnushthanPathViewModel(this.sadgranthAnushthanPathPage) {
    getArguments();
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }
}
