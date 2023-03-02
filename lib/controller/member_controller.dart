import 'dart:io';

import 'package:get/get.dart';

import '../../model/delete_member_response.dart';
import '../../model/member_response.dart';
import '../../utils/string_extensions.dart';
import '../services/rest_service.dart';
import '../utils/shared_preference.dart';
import '../utils/utils.dart';

class MemberController extends GetxController {
  bool isLoading = false;
  MemberResponse? memberResponse;
  DeleteMemberResponse? deleteMemberResponse;
  List<MemberInfoResponse> memInfoList = [];


  @override
  Future<void> onInit() async {
    getMemberData();
    super.onInit();
  }

  Future<void> getMemberData() async {
    memberResponse = await getMemberDataApi({'registerId': await getPrefStringValue(registerIdKey)});
    if (memberResponse != null) {
      memInfoList = memberResponse!.info;
      if (memInfoList.length > 1) {
        await setPrefBoolValue(addMemberStatusKey, true);
      }
    }
    update();
  }

  Future<MemberResponse?> getMemberDataApi(Map<String, dynamic> memberRequestMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.memberList, body: memberRequestMap);
      if (response != null && response.isNotEmpty) {
        memberResponse = memberResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in member data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return memberResponse;
  }

  Future<DeleteMemberResponse?> deleteMember(Map<String, dynamic> deleteMemberRequestMap) async {
    try {
      showLoader(true);
      final response = await RestServices.instance.postRestCall(
          endpoint: RestConstants.instance.deleteMember, body: deleteMemberRequestMap);
      if (response != null && response.isNotEmpty) {
        deleteMemberResponse = deleteMemberResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in delete member --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return deleteMemberResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
