import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/category_response.dart';
import '../../model/select_niyam_response.dart';
import '../../model/sub_category_response.dart';
import '../../utils/string_extensions.dart';
import '../model/save_niyam_history_request.dart';
import '../model/save_niyam_history_response.dart';
import '../model/delete_niyam_history_response.dart';
import '../model/sub_category_data_response.dart';
import '../pages/niyam_module/select_niyams/select_niyam_page.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class NiyamController extends GetxController {
  bool isLoading = false;
  SelectNiyamResponse? selectNiyamResponse;
  CategoryResponse? categoryResponse;
  SubCategoryDataResponse? subCategoryResponse;
  SaveNiyamHistoryResponse? saveNiyamHistoryResponse;
  DeleteNiyamHistoryResponse? deleteNiyamHistoryResponse;


  // @override
  // void onInit() {
  //   super.onInit();
  //   print("niyamViewModel!.scrollController.position.pixels --> ${niyamViewModel!.scrollController.position.pixels}");
  //   niyamViewModel!.scrollController.addListener(() {
  //     print("niyamViewModel!.scrollController.position.pixels --> ${niyamViewModel!.scrollController.position.pixels}");
  //     if (niyamViewModel!.scrollController.position.atEdge) {
  //       bool isTop = niyamViewModel!.scrollController.position.pixels == 0;
  //       print("niyamViewModel!.scrollController.position.pixels --> ${niyamViewModel!.scrollController.position.pixels}");
  //       if (isTop) {
  //         niyamViewModel!.isOnTop = true;
  //         refresh();
  //       } else {
  //         niyamViewModel!.isOnTop = false;
  //         refresh();
  //       }
  //     }
  //     if (niyamViewModel!.scrollController.position.pixels > 0) {
  //       niyamViewModel!.isOnTop = false;
  //     }
  //   });
  // }

  // Future<bool> backOnTap(BuildContext context) async {
  //   if (niyamViewModel!.isOnTop == null || niyamViewModel!.isOnTop == true) {
  //   } else {
  //     niyamViewModel!.scrollController.animateTo(
  //       0,
  //       duration: const Duration(seconds: 1),
  //       curve: Curves.linear,
  //     );
  //   }
  //   return false;
  // }

  @override
  void dispose() {
    super.dispose();
    niyamViewModel!.scrollController.dispose();
  }


  Future<CategoryResponse?> getCategoryData(Map<String, dynamic> categoryRequestMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.category, body: categoryRequestMap);
      if (response != null && response.isNotEmpty) {
        categoryResponse = categoryResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in category --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return categoryResponse;
  }

  Future<SubCategoryDataResponse?> getSubCategoryData(
      Map<String, dynamic> subCategoryRequestMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.subCategory, body: subCategoryRequestMap);
      if (response != null && response.isNotEmpty) {
        subCategoryResponse = subCategoryDataResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in sub category --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    print("subCategoryResponse ==> $subCategoryResponse");
    return subCategoryResponse;
  }

  Future<SelectNiyamResponse?> getSelectedNiyamHistoryData(
      Map<String, dynamic> selectNiyamMap, bool isShowMessage) async {
    try {
      showLoader(true);
      final response = await RestServices.instance.postRestCall(
          endpoint: RestConstants.instance.selectNiyam,
          body: selectNiyamMap,
          isShowMessage: isShowMessage);
      if (response != null && response.isNotEmpty) {
        selectNiyamResponse = selectNiyamResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return selectNiyamResponse;
  }

  Future<DeleteNiyamHistoryResponse?> deleteNiyamHistory(
      Map<String, dynamic> deleteNiyamMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.deleteNiyamHistory, body: deleteNiyamMap);
      if (response != null && response.isNotEmpty) {
        deleteNiyamHistoryResponse = deleteNiyamHistoryResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in delete niyam history --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return deleteNiyamHistoryResponse;
  }

  Future<SaveNiyamHistoryResponse?> saveNiyamHistory(
      SaveNiyamHistoryRequest saveNiyamHistoryRequest) async {
    try {
      showLoader(true);
      final response = await RestServices.instance.postRestCall(
          endpoint: RestConstants.instance.saveNiyamHistory,
          body: saveNiyamHistoryRequest.toJson());
      if (response != null && response.isNotEmpty) {
        saveNiyamHistoryResponse = saveNiyamHistoryResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in saveNiyamHistory --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return saveNiyamHistoryResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
