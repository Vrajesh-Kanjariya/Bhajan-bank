// import 'package:bank/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/niyam_controller.dart';
// import '../../../model/category_response.dart';
// import '../../../model/delete_niyam_history_response.dart';
// import '../../../model/save_niyam_history_request.dart';
// import '../../../model/save_niyam_history_response.dart';
// import '../../../model/select_niyam_response.dart';
// import '../../../model/sub_category_response.dart';
// import '../../../routes/app_navigation.dart';
// import '../../../utils/shared_preference.dart';
// import 'niyam_page.dart';
//
// class NiyamViewModel {
//   late NiyamPage niyamPage;
//   NiyamController? niyamController;
//   SelectNiyamResponse? selectNiyamResponse;
//   DeleteNiyamHistoryResponse? deleteNiyamHistoryResponse;
//   List<CategoryInfoResponse> categoryList = [];
//   List<SubCategoryInfoResponse> subCategoryList = [];
//   List<SelectNiyamModel> mainNiyamList = [];
//   List<SelectNiyamInfoResponse> selectNiyamInfoList = [];
//   bool status = true;
//   int selectedIndex = 0;
//   int currentIndex = 0;
//   bool niyamHeight = false;
//   String registrationId = '';
//   String membersId = '';
//   SubCategoryResponse? subCategoryResponse;
//   SaveNiyamHistoryResponse? saveNiyamHistoryResponse;
//
//   NiyamViewModel(this.niyamPage) {
//     Future.delayed(const Duration(milliseconds: 300), () async {
//       niyamController = Get.find<NiyamController>();
//       registrationId = await getPrefStringValue(registerIdKey) ?? '';
//       membersId = await getPrefStringValue(memberIdKey) ?? '';
//       await getCategoryData();
//       await getNiyamData();
//     });
//   }
//
//   Future<void> getCategoryData() async {
//     CategoryResponse? categoryResponse = await niyamController!.getCategoryData({
//       'registerId': registrationId,
//     });
//     if (categoryResponse != null) {
//       categoryList = categoryResponse.info;
//       await getSubCategoryData(categoryResponse.info[0].id);
//     }
//     niyamController!.update();
//   }
//
//   Future<void> getSubCategoryData(int catId) async {
//     subCategoryResponse = await niyamController!
//         .getSubCategoryData({'registerId': registrationId, 'memberId': membersId, 'catId': catId});
//     if (subCategoryResponse != null) {
//       subCategoryList = subCategoryResponse!.info;
//     }
//     niyamController!.update();
//   }
//
//   void selectItemClick(int index) {
//     subCategoryList[index].isSelect = !subCategoryList[index].isSelect;
//     saveNiyamHistory();
//     niyamController!.update();
//   }
//
//   Future<void> getNiyamData() async {
//     mainNiyamList.clear();
//     SelectNiyamModel selectNiyamModel = SelectNiyamModel();
//     selectNiyamModel.niyamList = [];
//     selectNiyamResponse = await niyamController!.getSelectedNiyamHistoryData({
//       'registerId': registrationId,
//       'memberId': membersId,
//     }, false);
//     if (selectNiyamResponse != null) {
//       selectNiyamInfoList = selectNiyamResponse!.info;
//       if (selectNiyamInfoList.isNotEmpty) {
//         await setPrefBoolValue(userSelectedStatusKey, true);
//       } else {
//         await setPrefBoolValue(userSelectedStatusKey, false);
//       }
//       for (int i = 0; i < selectNiyamResponse!.info.length; i++) {
//         selectNiyamModel.niyamList!.add(selectNiyamResponse!.info[i]);
//         if (selectNiyamModel.niyamList!.length == 10) {
//           mainNiyamList.add(selectNiyamModel);
//           selectNiyamModel = SelectNiyamModel();
//           selectNiyamModel.niyamList = [];
//         } else if (i == selectNiyamResponse!.info.length - 1) {
//           mainNiyamList.add(selectNiyamModel);
//         }
//       }
//       for (int j = selectNiyamResponse!.info.length; j <= 5; j++) {
//         niyamHeight = false;
//       }
//     }
//     niyamController!.update();
//   }
//
//   void updateCurrentIndex(int index) {
//     currentIndex = index;
//     niyamController!.update();
//   }
//
//   void updateSelectedIndex(int index) {
//     selectedIndex = index;
//     niyamController!.update();
//   }
//
//   void getSelectedCategoryData(int index, NiyamController controller) async {
//     if (index == 1) {
//       await getSubCategoryData(categoryList[index].id);
//
//       // goToSadgranthAnusthan(
//       //     categoryName: categoryList[index].catName, subCategoryInfoList: subCategoryList);
//     } else if (index == 2) {
//       //await getSubCategoryData(categoryList[index].id);
//       // goToMukhPath(categoryName: categoryList[index].catName, subCategoryInfoList: subCategoryList);
//     } else if (index == 3) {
//       //await getSubCategoryData(categoryList[index].id);
//       // goToSadgranthVanchan(categoryName: categoryList[index].catName, subCategoryInfoList: subCategoryList);
//     } else {
//       //updateSelectedIndex(index);
//     }
//     //getNiyamData();
//     updateSelectedIndex(index);
//     getSubCategoryData(categoryList[selectedIndex].id);
//     niyamController!.update();
//   }
//
//   void onTapSubCategory(int index) async {
//     if (selectedIndex == 0) {
//       goToNityaBhajan(subCategoryInfoList: subCategoryList, index: index);
//       getNiyamData();
//     } else if (selectedIndex == 4) {
//       goToChestaNiyam(subCategoryInfoList: subCategoryList, index: index);index
//       getNiyamData();
//     }
//     niyamController!.update();
//   }
//
//   void updateDailyControllerValue(String value, int index) {
//     subCategoryList[index].dailyTargetController!.text = value;
//     subCategoryList[index].dailyTargetController!.selection = TextSelection.fromPosition(
//         TextPosition(offset: subCategoryList[index].dailyTargetController!.text.length));
//     niyamController!.update();
//   }
//
//   void niyamRemoveNo(int index) async {
//     gotoBack();
//     if (selectNiyamInfoList[index].catId == 1) {
//       await getNiyamData();
//       goToNityaBhajan(subCategoryInfoList: subCategoryList, index: index);
//     } else if (selectNiyamInfoList[index].catId == 2) {
//       await getNiyamData();
//       goToEditSadgranthAnusthan(selectNiyamInfoList: mainNiyamList[0].niyamList, index: index);
//     }
//     niyamController!.update();
//   }
//
//   Future<void> saveNiyamHistory() async {
//     List<TargetInfoRequest> targetInfo = [];
//     for (int i = 0; i < subCategoryList.length; i++) {
//       if (subCategoryList[i].isSelect) {
//         TargetInfoRequest targetInfoRequest = TargetInfoRequest(
//           subcatId: subCategoryList[i].subcatId.toString(),
//           petasubcatId: '',
//           dailyTarget: '',
//           totalTarget: '',
//         );
//         targetInfo.add(targetInfoRequest);
//       }
//     }
//     if (targetInfo.isNotEmpty) {
//       SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
//           catId: subCategoryList[0].catId.toString(),
//           niyamId: '0',
//           registerId: registrationId,
//           memberId: membersId,
//           targetInfo: targetInfo);
//
//       saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);
//
//       if (saveNiyamHistoryResponse != null) {
//         successToast(saveNiyamHistoryResponse!.msg);
//         await niyamViewModel!.getNiyamData();
//         await niyamViewModel!.getSubCategoryData(subCategoryList.first.catId);
//         niyamController!.update();
//       } else {
//         errorToast(saveNiyamHistoryResponse!.msg);
//       }
//     }
//   }
//
//   void niyamRemoveYes(int index) async {
//     await gotoBack();
//     int deleteIndex = mainNiyamList.first.niyamList!.indexWhere((element) =>
//         element.registerId == registrationId &&
//         element.niyamId == selectNiyamInfoList[index].niyamId);
//     print("deleteindex ----> $deleteIndex");
//     mainNiyamList.first.niyamList!.removeAt(deleteIndex);
//     deleteNiyamHistoryResponse = await niyamController!.deleteNiyamHistory(
//         {'registerId': registrationId, 'niyamId': selectNiyamInfoList[index].niyamId});
//     if (deleteNiyamHistoryResponse != null) {
//       await getSubCategoryData(subCategoryList[selectedIndex].catId);
//       successToast(deleteNiyamHistoryResponse!.msg);
//       niyamController!.update();
//     } else {
//       errorToast(deleteNiyamHistoryResponse!.msg);
//     }
//   }
//
//   Future<void> saveAnushthasanBook() async {
//     gotoBack();
//     List<TargetInfoRequest> targetInfo = [];
//     for (int i = 0; i < subCategoryList.length; i++) {
//       if (subCategoryList[i].dailyTargetController!.text.isNotEmpty) {
//         TargetInfoRequest targetInfoRequest = TargetInfoRequest(
//           subcatId: subCategoryList[i].subcatId.toString(),
//           petasubcatId: '',
//           dailyTarget: subCategoryList[i].dailyTargetController!.text.trim(),
//           totalTarget: subCategoryList[i].totalTarget.toString(),
//         );
//         targetInfo.add(targetInfoRequest);
//       }
//     }
//
//     SaveNiyamHistoryRequest saveNiyamHistoryRequest = SaveNiyamHistoryRequest(
//         catId: subCategoryList.first.catId.toString(),
//         niyamId: '0',
//         registerId: registrationId,
//         memberId: membersId,
//         targetInfo: targetInfo);
//
//     saveNiyamHistoryResponse = await niyamController!.saveNiyamHistory(saveNiyamHistoryRequest);
//
//     if (saveNiyamHistoryResponse != null) {
//       successToast(saveNiyamHistoryResponse!.msg);
//       await niyamViewModel!.getNiyamData();
//       await niyamViewModel!.getSubCategoryData(subCategoryList.first.catId);
//       niyamController!.update();
//     } else {
//       errorToast(saveNiyamHistoryResponse!.msg);
//     }
//   }
// }
