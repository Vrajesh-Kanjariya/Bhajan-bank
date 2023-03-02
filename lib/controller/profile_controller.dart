import 'dart:io';

import 'package:get/get.dart';

import '../../model/city_response.dart';
import '../../model/sign_up_response.dart';
import '../../model/state_response.dart';
import '../../pages/profile/profile_page.dart';
import '../../services/rest_service.dart';
import '../../utils/string_extensions.dart';
import '../model/country_response.dart';
import '../utils/utils.dart';

class ProfileController extends GetxController {
  bool isLoading = false;
  CountryResponse? countryResponse;
  StateResponse? stateResponse;
  CityResponse? cityResponse;
  SignUpResponse? signUpResponse;

  @override
  void onClose() {
    profileViewModel = null;
  }

  Future<CountryResponse?> getCountry() async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.countryList, body: {});
      if (response != null && response.isNotEmpty) {
        countryResponse = countryResponseFromJson(response);
      }
      showLoader(false);
    } on SocketException catch (e) {
      logs('Socket exception in country --> ${e.message}');
      e.message.showError();
    }
    return countryResponse;
  }

  Future<StateResponse?> getState(Map<String, int> stateReqMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.stateList, body: stateReqMap);
      if (response != null && response.isNotEmpty) {
        stateResponse = stateResponseFromJson(response);
      }
      showLoader(false);
    } on SocketException catch (e) {
      logs('Socket exception in state --> ${e.message}');
      e.message.showError();
    }
    return stateResponse;
  }

  Future<CityResponse?> getCity(Map<String, int> cityReqMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.cityList, body: cityReqMap);
      if (response != null && response.isNotEmpty) {
        cityResponse = cityResponseFromJson(response);
      }
      showLoader(false);
    } on SocketException catch (e) {
      logs('Socket exception in city --> ${e.message}');
      e.message.showError();
    }
    return cityResponse;
  }

  Future<SignUpResponse?> updateProfile(
      Map<String, String> updateProfileMap, String key, String imagePath) async {
    try {
      showLoader(true);
      final response = await RestServices.instance.multiPartRestCall(
          endpoint: RestConstants.instance.memberAddUpdate,
          body: updateProfileMap,
          keyName: key,
          fileName: imagePath);
      if (response != null && response.isNotEmpty) {
        signUpResponse = signUpResponseFromJson(response);
      }
      showLoader(false);
    } on SocketException catch (e) {
      logs('Socket exception in register member --> ${e.message}');
      e.message.showError();
    }
    return signUpResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
