import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constant/bhajan_assets.dart';
import '../../../controller/sandgrath_anushthan_application_controller.dart';
import '../../../model/information_response.dart';
import '../../../model/lesson_response.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_application/sandgrath_anushthan_application_screen.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';

class SandgrathAnushthanApplicationViewModel {
  late SandgrathAnushthanApplicationScreen sandgrathAnushthanApplicationScreen;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  SandgrathAnushthanApplicationController?
      sandgrathAnushthanApplicationController;
  LessonResponse? lessonResponse;
  List<LessonInfoList> lessonInfoList = [];
  List<String> lessonCatNameList = [];
  List<LessonList> lessonList = [];
  String? selectPrakran;

  SandgrathAnushthanApplicationViewModel(
      this.sandgrathAnushthanApplicationScreen) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      sandgrathAnushthanApplicationController =
          Get.find<SandgrathAnushthanApplicationController>();
      getLessonListData();
    });
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> getLessonListData() async {
    // lessonResponse =
    //     await sandgrathAnushthanApplicationController!.getLessonList(
    //   {
    //     "registerId": registrationId,
    //     "memberId": membersId,
    //     "catId": informationInfoList!.catId,
    //     "subcatId": informationInfoList!.subcatId
    //   },
    // );

    if (informationInfoList!.subcatId == 9) {
      final String response =
          await rootBundle.loadString(BhajanAssets.vanchnamrutJson9);
      lessonResponse = lessonResponseFromJson(response);
    } else if (informationInfoList!.subcatId == 10) {
      final String response =
          await rootBundle.loadString(BhajanAssets.vanchnamrutJson10);
      lessonResponse = lessonResponseFromJson(response);
    } else if (informationInfoList!.subcatId == 11) {
      final String response =
          await rootBundle.loadString(BhajanAssets.vanchnamrutJson11);
      lessonResponse = lessonResponseFromJson(response);
    } else if (informationInfoList!.subcatId == 12) {
      final String response =
          await rootBundle.loadString(BhajanAssets.vanchnamrutJson12);
      lessonResponse = lessonResponseFromJson(response);
    } else if (informationInfoList!.subcatId == 13) {
      final String response =
          await rootBundle.loadString(BhajanAssets.vanchnamrutJson13);
      lessonResponse = lessonResponseFromJson(response);
    }

    if (lessonResponse != null) {
      lessonInfoList = lessonResponse!.info;
      for (var element in lessonInfoList) {
        selectPrakran = lessonInfoList.first.lessonCatName;
        lessonCatNameList.add(element.lessonCatName);
        lessonList = lessonInfoList.first.lessonList;
      }
    } else {
      errorToast(lessonResponse!.msg);
    }
    sandgrathAnushthanApplicationController!.update();
  }

  void selectedChapter(String lessonCatName) {
    selectPrakran = lessonCatName;
    for (var element in lessonInfoList) {
      if (element.lessonCatName == selectPrakran) {
        lessonList = element.lessonList;
      }
    }
    sandgrathAnushthanApplicationController!.update();
    gotoBack();
  }
}
