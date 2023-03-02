import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/string_constant.dart';
import '../model/server_response.dart';
import '../pages/home/home_page.dart';
import '../pages/selected_niyam_module/selected_niyam_chesta/selected_niyam_chesta_page.dart';
import '../routes/app_navigation.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class SelectedNiyamChestaPageController extends GetxController {
  ServerResponse? serverResponse;
  bool isLoading = false;
  RxString imagePath = ''.obs;
  RxString imgPath = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedNiyamChestaPageViewModel!.getArguments();
  }

  Future<ServerResponse?> saveDailyNiyamHistory(Map<String, dynamic> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.saveDailyNiyamHistory, body: map);
      if (response != null && response.isNotEmpty) {
        serverResponse = serverResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return serverResponse;
  }

  Future<void> uploadGharMandirApi() async {
    if (imagePath.value.isNotEmpty && imgPath.value.isNotEmpty) {
      Map<String, String> uploadGharMandirMap = {
        'registerId': selectedNiyamChestaPageViewModel!.registrationId,
        'memberId': selectedNiyamChestaPageViewModel!.membersId,
        'catId': '${selectedNiyamChestaPageViewModel!.informationInfoList!.catId}',
        'subcatId': '${selectedNiyamChestaPageViewModel!.informationInfoList!.subcatId}',
      };
      serverResponse = await uploadPhoto('firstImageUpload', uploadGharMandirMap, imagePath.value,
          'secondImageUpload', imgPath.value);
      if (serverResponse != null) {
        successToast(serverResponse!.msg);
        selectedNiyamChestaPageViewModel!.saveDailyNiyam();
        homePageViewModel!.getNiyamData();
        gotoBack();
      }
    } else {
      errorToast(AppStringConstants.pleaseEnterImage);
    }
    update();
  }

  Future<ServerResponse?> uploadPhoto(
      String firstImageUpload,
      Map<String, String> uploadGharMandirMap,
      String imagePath,
      String secondImageUpload,
      String imgPath) async {
    try {
      showLoader(true);
      final response = await RestServices.instance.multiPartRestCall(
          endpoint: RestConstants.instance.saveGharMandir,
          body: uploadGharMandirMap,
          keyName: firstImageUpload,
          fileName: imagePath,
          keyName1: secondImageUpload,
          fileName1: imgPath);
      if (response != null && response.isNotEmpty) {
        serverResponse = serverResponseFromJson(response);
      }
      showLoader(false);
    } on SocketException catch (e) {
      logs('Socket exception in register member --> ${e.message}');
      e.message.showError();
    }
    return serverResponse;
  }

  getFromGallery(int value) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      if (value == 0) {
        imagePath.value = file.path;
      } else {
        imgPath.value = file.path;
      }
      update();
    }
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
