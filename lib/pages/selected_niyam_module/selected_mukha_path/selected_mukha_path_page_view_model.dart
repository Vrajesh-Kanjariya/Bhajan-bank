import 'package:get/get.dart';

import '../../../controller/selected_mukha_path_controller.dart';
import '../../../model/information_response.dart';
import '../../../model/mukha_path_list_response.dart';
import '../../../pages/selected_niyam_module/selected_mukha_path/seleted_mukha_path_page.dart';
import '../../../utils/shared_preference.dart';

class SelectedMukhaPathPageViewModel {
  late SelectedMukhaPathPage selectedMukhaPathPage;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  List<MukhPathList>? mukhapathDataList;
  MukhaPathResponse? mukhaPathResponse;
  SelectedMukhaPathController? selectedMukhaPathController;

  SelectedMukhaPathPageViewModel(this.selectedMukhaPathPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      selectedMukhaPathController = Get.find<SelectedMukhaPathController>();
      await getMukhaPathListData();
    });
  }

  getArguments() async {
   informationInfoList = Get.arguments['informationInfoList'];
   registrationId = await getPrefStringValue(registerIdKey) ?? '';
   membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> getMukhaPathListData() async {
    mukhaPathResponse = await selectedMukhaPathController!.getMukhaPathListResponse({
      "registerId": registrationId,
      "memberId": membersId,
      "catId": informationInfoList!.catId.toString(),
    });
    if (mukhaPathResponse != null) {
      mukhapathDataList = mukhaPathResponse!.info;
    }
    selectedMukhaPathController!.update();
  }
}
