import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/selected_mukha_path_controller.dart';
import '../../../controller/selected_sadagrantha_vancana_controller.dart';
import '../../../model/information_response.dart';
import '../../../model/mukha_path_list_response.dart';
import '../../../pages/selected_niyam_module/selected_sadagrantha_vanchan/selected_sadagrantha_vanchan_page.dart';
import '../../../utils/shared_preference.dart';

class SelectedSadagranthaVanchanViewModel {
  late SelectedSadagranthaVanchanPage selectedSadagranthaVancanaPage;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  TabController? tabController;
  List<MukhPathList>? mukhapathDataList;
  MukhaPathResponse? mukhaPathResponse;
  SelectedSadagranthaVancanaController? selectedSadagranthaVancanaController;
  SelectedMukhaPathController? selectedMukhaPathController;

  SelectedSadagranthaVanchanViewModel(this.selectedSadagranthaVancanaPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      selectedSadagranthaVancanaController = Get.find<SelectedSadagranthaVancanaController>();
      await getMukhaPathListData();
    });
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> getMukhaPathListData() async {
    mukhaPathResponse = await selectedSadagranthaVancanaController!.getMukhaPathListResponse({
      "registerId": registrationId,
      "memberId": membersId,
      "catId": informationInfoList!.catId.toString(),
    });
    if (mukhaPathResponse != null) {
      mukhapathDataList = mukhaPathResponse!.info;
    }
    selectedSadagranthaVancanaController!.update();
  }
}
