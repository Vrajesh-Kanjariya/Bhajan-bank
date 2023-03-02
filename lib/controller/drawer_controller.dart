import 'dart:io';

import 'package:get/get.dart';

import '../../controller/member_controller.dart';
import '../../model/member_response.dart';
import '../../pages/Drawer/drawer_page.dart';
import '../../utils/string_extensions.dart';
import '../model/logout_response.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class DrawerPageController extends GetxController {
  int value = 0;
  bool isLoading = false;
  LogoutResponse? logoutResponse;
  MemberController? memberController;
  MemberInfoResponse? memberInfoResponse;
  double profileCompleteValue = 0.0;

  Future<void> checkProfileComplete({bool isCalculate = false}) async {
    memberController = Get.put(MemberController());
    profileCompleteValue = 0.0;
    await memberController!.getMemberData();
    if (memberController!.memInfoList.isNotEmpty) {
      for (var element in memberController!.memInfoList) {
        if (element.memberId == drawerViewModel!.memberId) {
          memberInfoResponse = null;
          memberInfoResponse = element;
          logs("Network Url Updated --> ${memberInfoResponse!.profileImage}");
          update();
        }
      }

      if(isCalculate){
        return;
      }

      if (memberInfoResponse!.profileImage.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a1->$profileCompleteValue");
      }
      if (memberInfoResponse!.firstName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a2->$profileCompleteValue");
      }
      if (memberInfoResponse!.middleName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a3->$profileCompleteValue");
      }
      if (memberInfoResponse!.lastName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a4->$profileCompleteValue");
      }
      if (memberInfoResponse!.age.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a5->$profileCompleteValue");
      }
      if (memberInfoResponse!.emailId.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a6->$profileCompleteValue");
      }
      if (memberInfoResponse!.address.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a7->$profileCompleteValue");
      }
      if (memberInfoResponse!.mainArea.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a8->$profileCompleteValue");
      }
      if (memberInfoResponse!.pincode.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a9->$profileCompleteValue");
      }
      if (memberInfoResponse!.countryName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a10->$profileCompleteValue");
      }
      if (memberInfoResponse!.stateName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a11->$profileCompleteValue");
      }
      if (memberInfoResponse!.cityName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a12->$profileCompleteValue");
      }
      if (memberInfoResponse!.fullName.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a13->$profileCompleteValue");
      }
      if (memberInfoResponse!.gender.isNotEmpty) {
        profileCompleteValue += 7.142;
        logs("a14->$profileCompleteValue");
      }
      update();
      logs("profileCompleteValue -> $profileCompleteValue");
    }
  }

  Future<LogoutResponse?> logout() async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.logout, body: {});
      if (response != null && response.isNotEmpty) {
        logoutResponse = logoutResponseFromJson(response);
      }
      showLoader(false);
    } on SocketException catch (e) {
      logs('Socket exception in city --> ${e.message}');
      e.message.showError();
    }
    return logoutResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
