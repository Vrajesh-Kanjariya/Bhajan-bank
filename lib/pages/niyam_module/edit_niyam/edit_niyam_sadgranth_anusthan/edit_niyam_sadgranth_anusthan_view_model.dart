import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/niyam_controller.dart';
import '../../../../model/save_niyam_history_request.dart';
import '../../../../model/save_niyam_history_response.dart';
import '../../../../model/select_niyam_response.dart';
import '../../../../routes/app_navigation.dart';
import '../../../../utils/shared_preference.dart';
import '../../../../utils/utils.dart';
import '../../../niyam_module/edit_niyam/edit_niyam_sadgranth_anusthan/edit_niyam_sadgranth_anusthan_page.dart';

class EditNiyamSadgranthAnusthanViewModel {
  late EditNiyamSadgranthAnusthanPage editNiyamSadgranthAnusthanPage;
  TextEditingController dailyTarget = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  SaveNiyamHistoryResponse? saveNiyamHistoryResponse;
  NiyamController? niyamController;
  List<SelectNiyamInfoResponse> selectNiyamInfoList = [];
  String categoryName = '';
  String registrationId = '';
  String membersId = '';
  int selectedIndex = 0;

  EditNiyamSadgranthAnusthanViewModel(this.editNiyamSadgranthAnusthanPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      niyamController = Get.find<NiyamController>();
      getArguments();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      membersId = await getPrefStringValue(memberIdKey) ?? '';
      dailyTarget.text = selectNiyamInfoList[selectedIndex].dailyTarget.toString();
    });
  }

  getArguments() {
    Map<String, dynamic> arguments = Get.arguments;
    selectedIndex = arguments['index'];
    selectNiyamInfoList = arguments['selectNiyamInfoList'];
  }

  void updateDailyControllerValue(String value, int selectedIndex) {
    dailyTarget.text = value;
    dailyTarget.selection =
        TextSelection.fromPosition(TextPosition(offset: dailyTarget.text.length));
  }

  Future<void> saveNiyamHistory() async {
    List<TargetInfoRequest> targetInfo = [];

    if (dailyTarget.text.isNotEmpty) {
      TargetInfoRequest targetInfoRequest = TargetInfoRequest(
          subcatId: selectNiyamInfoList[selectedIndex].subcatId.toString(),
          petasubcatId: '',
          dailyTarget: dailyTarget.text.trim(),
          totalTarget: '',
          niyamId: selectNiyamInfoList[selectedIndex].niyamId.toString());
      targetInfo.add(targetInfoRequest);
    }

    SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
        catId: selectNiyamInfoList[0].catId.toString(),
        niyamId: selectNiyamInfoList[selectedIndex].niyamId.toString(),
        registerId: registrationId,
        memberId: membersId,
        targetInfo: targetInfo);

    saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);

    if (saveNiyamHistoryResponse != null) {
      successToast(saveNiyamHistoryResponse!.msg);
      goToNiyam(0);
    } else {
      errorToast(saveNiyamHistoryResponse!.msg);
    }
  }
}
