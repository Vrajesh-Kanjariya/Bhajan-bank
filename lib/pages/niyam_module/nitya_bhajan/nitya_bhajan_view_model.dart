import 'package:bank/model/sub_category_data_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/niyam_controller.dart';
import '../../../model/save_niyam_history_request.dart';
import '../../../model/save_niyam_history_response.dart';
import '../../../model/sub_category_response.dart';
import '../../../pages/niyam_module/nitya_bhajan/nitya_bhajan_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';
import '../select_niyams/select_niyam_page.dart';

class NityaBhajanViewModel {
  late NityaBhajanPage nityaBhajanPage;
  List<SubcategoryList>? subCategoryInfoList;
  SubCategoryInfoResponse? subCategoryInfoResponse;
  NiyamController? niyamController;
  SaveNiyamHistoryResponse? saveNiyamHistoryResponse;
  int selectedIndex = 0;
  bool status = true;
  String totalValueTarget = '';
  String dailyTargetError = '';
  String registrationId = '';
  String membersId = '';

  TextEditingController dailyTarget = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  NityaBhajanViewModel(this.nityaBhajanPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      niyamController = Get.find<NiyamController>();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      membersId = await getPrefStringValue(memberIdKey) ?? '';
      getArguments();
    });
  }

  void getArguments() {
    subCategoryInfoList = Get.arguments['subCategoryList'];
    selectedIndex = Get.arguments['index'];
    niyamController!.update();
  }

  void updateTextFieldValue(String value) {
    logs("niyam mala value --> ${subCategoryInfoList!.first.countTotalDays}");
    if (value.isNotEmpty) {
      totalValueTarget = '${subCategoryInfoList!.first.countTotalDays * int.parse(value)}';
    } else {
      totalValueTarget = '';
    }
    niyamController!.update();
  }

  Future<void> saveNiyamHistory() async {
    TargetInfoRequest targetInfoRequest = TargetInfoRequest(
      subcatId: subCategoryInfoList![selectedIndex].subcatId.toString(),
      petasubcatId: '',
      dailyTarget: dailyTarget.text.trim().toString(),
      totalTarget: subCategoryInfoList![selectedIndex].totalTarget.toString(),
    );

    SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
        catId: subCategoryInfoList!.first.catId.toString(),
        niyamId: '0',
        registerId: registrationId,
        memberId: membersId,
        targetInfo: [targetInfoRequest]);

    saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);

    if (saveNiyamHistoryResponse != null) {
      successToast(saveNiyamHistoryResponse!.msg);
      await niyamViewModel!.getNiyamData();
      await niyamViewModel!.getSubCategoryData(subCategoryInfoList!.first.catId);
      dailyTarget.clear();
      totalValueTarget = '';
      niyamController!.update();
      gotoBack();
    } else {
      errorToast(saveNiyamHistoryResponse!.msg);
    }
  }
}
