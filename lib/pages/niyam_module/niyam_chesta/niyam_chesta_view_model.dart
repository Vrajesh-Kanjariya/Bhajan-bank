import 'package:bank/model/sub_category_data_response.dart';
import 'package:get/get.dart';

import '../../../controller/niyam_controller.dart';
import '../../../model/save_niyam_history_request.dart';
import '../../../model/save_niyam_history_response.dart';
import '../../../pages/niyam_module/niyam_chesta/niyam_chesta_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';
import '../select_niyams/select_niyam_page.dart';

class NiyamChestaViewModel {
  late NiyamChestaPage niyamChestaPage;
  List<SubcategoryList> subCategoryInfoList = [];
  NiyamController? niyamController;
  SaveNiyamHistoryResponse? saveNiyamHistoryResponse;

  String categoryName = '';
  String registrationId = '';
  String membersId = '';
  int selectedIndex = 0;

  NiyamChestaViewModel(this.niyamChestaPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      getArguments();
      niyamController = Get.find<NiyamController>();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      membersId = await getPrefStringValue(memberIdKey) ?? '';
    });
  }

  getArguments() {
    Map<String, dynamic> arguments = Get.arguments;
    selectedIndex = arguments['index'];
    subCategoryInfoList = arguments['subCategoryList'];
  }

  Future<void> saveNiyamHistory() async {
    List<TargetInfoRequest> targetInfo = [];
    TargetInfoRequest targetInfoRequest = TargetInfoRequest(
      subcatId: '${subCategoryInfoList[selectedIndex].subcatId}',
      petasubcatId: '',
      dailyTarget: '',
      totalTarget: '',
    );
    targetInfo.add(targetInfoRequest);

    SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
        catId: subCategoryInfoList[selectedIndex].catId.toString(),
        niyamId: '0',
        registerId: registrationId,
        memberId: membersId,
        targetInfo: targetInfo);

    saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);

    if (saveNiyamHistoryResponse != null) {
      successToast(saveNiyamHistoryResponse!.msg);
      niyamController!.update();
      niyamViewModel!.getNiyamData();
      goToNiyam(0);
    } else {
      errorToast(saveNiyamHistoryResponse!.msg);
    }
    niyamController!.update();
  }
}
