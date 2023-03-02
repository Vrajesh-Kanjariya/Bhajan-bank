import 'dart:io';

import 'package:get/get.dart';

import '../../model/daily_darshan_response.dart';
import '../../services/rest_service.dart';
import '../../utils/string_extensions.dart';
import '../../utils/utils.dart';

class DailyDarshanController extends GetxController {
  DailyDarshanResponse? dailyDarshan;
  bool isLoading = false;

  Future<DailyDarshanResponse?> getDailyDarshanData(Map<String, dynamic> dailyDarshanMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.dailyDarshanList, body: dailyDarshanMap);
      if (response != null && response.isNotEmpty) {
        dailyDarshan = dailyDarshanResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in daily darshan data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return dailyDarshan;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
