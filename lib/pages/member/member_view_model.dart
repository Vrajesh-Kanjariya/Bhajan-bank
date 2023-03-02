import 'package:get/get.dart';

import '../../controller/member_controller.dart';
import '../../model/delete_member_response.dart';
import '../../model/member_response.dart';
import '../../pages/member/member_page.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class MemberViewModel {
  late MemberPage memberPage;
  MemberController? memberController;
  MemberResponse? memberResponse;
  DeleteMemberResponse? deleteMemberResponse;
  String membersId = '';

  MemberViewModel(this.memberPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      memberController = Get.find<MemberController>();
      membersId = await getPrefStringValue(memberIdKey) ?? '';
    });
  }

  Future<void> deleteMember(String membersId) async {
    memberController!.memInfoList.removeWhere((element) => element.memberId == membersId);
    memberController!.update();
    deleteMemberResponse =
        await memberController!.deleteMember({'memberId': membersId, 'registerId': registerIdKey});
    if (deleteMemberResponse != null && deleteMemberResponse!.status == 1) {
      successToast(deleteMemberResponse!.msg);
    } else {
      errorToast(deleteMemberResponse!.msg);
    }
  }
}
