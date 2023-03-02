import 'dart:io';

import 'package:get/get.dart';

import '../../model/splash_response.dart';
import '../../utils/string_extensions.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class SplashController extends GetxController {
  SplashResponse? splashResponse;

  Future<SplashResponse?> getSplashData() async {
    try {
      // showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.splash, body: {});
      if (response != null && response.isNotEmpty) {
        splashResponse = splashResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in userLogin --> ${e.message}');
      e.message.showError();
    }
    // showLoader(false);
    return splashResponse;
  }
}
