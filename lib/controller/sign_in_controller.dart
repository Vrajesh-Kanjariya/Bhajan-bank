import 'dart:io';

import 'package:get/get.dart';

import '../../model/login_request.dart';
import '../../model/login_data_response.dart';
import '../../utils/string_extensions.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class SignInController extends GetxController {
  LoginDataResponse? loginDataResponse;
  bool isLoading = false;

  Future<LoginDataResponse?> userLogin(LoginRequest loginRequest) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.login, body: loginRequest.toJson());
      if (response != null && response.isNotEmpty) {
        loginDataResponse = loginDataResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in userLogin --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return loginDataResponse;
  }

  showLoader(bool val){
    isLoading = val;
    update();
  }

}
