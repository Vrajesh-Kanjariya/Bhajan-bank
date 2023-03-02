import 'package:get/get.dart';

import '../../../controller/niyam_controller.dart';
import '../../../model/save_niyam_history_request.dart';
import '../../../model/save_niyam_history_response.dart';
import '../../../model/sub_category_response.dart';
import '../../../pages/niyam_module/mukh_path/mukh_path_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';
import '../niyam/niyam_page.dart';
import '../select_niyams/select_niyam_page.dart';

class MukhPathViewModel {
  late MukhPathPage mukhPathPage;
  List<SubCategoryInfoResponse> subCategoryInfoList = [];
  NiyamController? niyamController;
  SaveNiyamHistoryResponse? saveNiyamHistoryResponse;
  String categoryName = '';
  String registrationId = '';
  String membersId = '';

  MukhPathViewModel(this.mukhPathPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      niyamController = Get.find<NiyamController>();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      membersId = await getPrefStringValue(memberIdKey) ?? '';
    });
  }

  void getArguments() {
    Map<String, dynamic> arguments = Get.arguments;
    categoryName = arguments['categoryName'];
    subCategoryInfoList = arguments['subCategoryList'];
  }

  void selectItemClick(int index) {
    subCategoryInfoList[index].isSelect = !subCategoryInfoList[index].isSelect;
    niyamController!.update();
  }

  Future<void> saveNiyamHistory() async {
    List<TargetInfoRequest> targetInfo = [];
    for (int i = 0; i < subCategoryInfoList.length; i++) {
      if (subCategoryInfoList[i].isSelect) {
        TargetInfoRequest targetInfoRequest = TargetInfoRequest(
          subcatId: subCategoryInfoList[i].subcatId.toString(),
          petasubcatId: '',
          dailyTarget: '',
          totalTarget: '',
        );
        targetInfo.add(targetInfoRequest);
      }
    }
    if (targetInfo.isNotEmpty) {
      SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
          catId: subCategoryInfoList[0].catId.toString(),
          niyamId: '0',
          registerId: registrationId,
          memberId: membersId,
          targetInfo: targetInfo);

      saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);

      if (saveNiyamHistoryResponse != null) {
        successToast(saveNiyamHistoryResponse!.msg);
        await niyamViewModel!.getNiyamData();
        await niyamViewModel!.getSubCategoryData(subCategoryInfoList[0].catId);
        niyamController!.update();
        gotoBack();
      } else {
        errorToast(saveNiyamHistoryResponse!.msg);
      }
    }
  }
}
