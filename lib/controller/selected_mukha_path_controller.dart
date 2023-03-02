import 'dart:io';

import 'package:get/get.dart';

import '../../../pages/selected_niyam_module/selected_mukha_path/seleted_mukha_path_page.dart';
import '../model/mukha_path_list_response.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class SelectedMukhaPathController extends GetxController {
  MukhaPathResponse? mukhaPathResponse;
  bool isLoading = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedMukhaPathPageViewModel!.getArguments();
  }

  Future<MukhaPathResponse?> getMukhaPathListResponse(Map<String, String> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.mukhapathList, body: map);
      if (response != null && response.isNotEmpty) {
        mukhaPathResponse = mukhaPathResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return mukhaPathResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
