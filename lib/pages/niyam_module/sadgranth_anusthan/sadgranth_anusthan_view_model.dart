import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/niyam_controller.dart';
import '../../../model/save_niyam_history_request.dart';
import '../../../model/save_niyam_history_response.dart';
import '../../../model/sub_category_response.dart';
import '../../../pages/niyam_module/sadgranth_anusthan/sadgranth_anusthan_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';
import '../niyam/niyam_page.dart';
import '../select_niyams/select_niyam_page.dart';

class SadgranthAnusthanViewModel {
  late SadgranthAnusthanPage sadgranthAnusthanPage;
  SaveNiyamHistoryResponse? saveNiyamHistoryResponse;
  NiyamController? niyamController;
  List<SubCategoryInfoResponse> subCategoryInfoList = [];
  TextEditingController dailyTarget = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  String categoryName = '';
  String registrationId = '';
  String membersId = '';

  SadgranthAnusthanViewModel(this.sadgranthAnusthanPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      niyamController = Get.find<NiyamController>();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      membersId = await getPrefStringValue(memberIdKey) ?? '';
    });
  }

  void getArguments() {
    categoryName = Get.arguments['categoryName'];
    subCategoryInfoList = Get.arguments['subCategoryList'];
  }

  void updateDailyControllerValue(String value, int index) {
    subCategoryInfoList[index].dailyTargetController!.text = value;
    subCategoryInfoList[index].dailyTargetController!.selection = TextSelection.fromPosition(
        TextPosition(offset: subCategoryInfoList[index].dailyTargetController!.text.length));
    niyamController!.update();
  }

  Future<void> saveNiyamHistory() async {
    List<TargetInfoRequest> targetInfo = [];
    for (int i = 0; i < subCategoryInfoList.length; i++) {
      if (subCategoryInfoList[i].dailyTargetController!.text.isNotEmpty) {
        TargetInfoRequest targetInfoRequest = TargetInfoRequest(
          subcatId: subCategoryInfoList[i].subcatId.toString(),
          petasubcatId: '',
          dailyTarget: subCategoryInfoList[i].dailyTargetController!.text.trim(),
          totalTarget: subCategoryInfoList[i].totalTarget.toString(),
        );
        targetInfo.add(targetInfoRequest);
      }
    }

    SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
        catId: subCategoryInfoList.first.catId.toString(),
        niyamId: '0',
        registerId: registrationId,
        memberId: membersId,
        targetInfo: targetInfo);

    saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);

    if (saveNiyamHistoryResponse != null) {
      successToast(saveNiyamHistoryResponse!.msg);
      await niyamViewModel!.getNiyamData();
      await niyamViewModel!.getSubCategoryData(subCategoryInfoList.first.catId);
      niyamController!.update();
      gotoBack();
    } else {
      errorToast(saveNiyamHistoryResponse!.msg);
    }
  }
}
