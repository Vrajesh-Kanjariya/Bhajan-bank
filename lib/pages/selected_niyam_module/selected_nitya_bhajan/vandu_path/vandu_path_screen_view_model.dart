import 'package:get/get.dart';

import '../../../../controller/vandu_path_screen_controller.dart';
import '../../../../model/information_response.dart';
import '../../../../model/lesson_response.dart';
import '../../../../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/vandu_path_screen.dart';
import '../../../../routes/app_navigation.dart';
import '../../../../utils/shared_preference.dart';
import '../../../../utils/utils.dart';

class VanduPathScreenViewModel {
  late VanduPathScreen vanduPathScreen;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  LessonResponse? lessonResponse;
  List<LessonInfoList> lessonInfoList = [];
  VanduPathScreenController? vanduPathScreenController;

  VanduPathScreenViewModel(this.vanduPathScreen) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      vanduPathScreenController = Get.find<VanduPathScreenController>();
      getLessonListData();
    });
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> getLessonListData() async {
    lessonResponse = await vanduPathScreenController!.getLessonList(
      {
        "registerId": registrationId,
        "memberId": membersId,
        "catId": informationInfoList!.catId,
        "subcatId": informationInfoList!.subcatId
      },
    );
    if (lessonResponse != null) {
      lessonInfoList = lessonResponse!.info;
    } else {
      errorToast(lessonResponse!.msg);
    }
    vanduPathScreenController!.update();
  }

  buttonClick() {
    if (lessonInfoList.first.lessonList.first.subcatId == 6) {
      gotoNamavali(informationInfoList);
    } else if (lessonInfoList.first.lessonList.first.subcatId == 7) {
      gotoNamavali(informationInfoList);
    } else if (lessonInfoList.first.lessonList.first.subcatId == 8) {
      gotoNamavali(informationInfoList);
    }
  }
}
