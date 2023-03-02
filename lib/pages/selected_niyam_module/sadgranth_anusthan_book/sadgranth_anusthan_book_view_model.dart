import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constant/bhajan_assets.dart';
import '../../../controller/sadgranth_anusthan_book_controller.dart';
import '../../../model/information_response.dart';
import '../../../model/lesson_response.dart';
import '../../../model/server_response.dart';
import '../../../pages/selected_niyam_module/sadgranth_anusthan_book/sadgranth_anusthan_book_screen.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';

class SadgranthAnusthanBookViewModel {
  late SadgranthAnusthanBookScreen sadgranthAnusthanBookScreen;
  SadgranthAnusthanBookController? sadgranthAnusthanBookController;
  LessonResponse? lessonResponse;
  List<LessonInfoList> lessonInfoList = [];
  List<String> lessonCatNameList = [];
  List<LessonList> lessonList = [];
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  int currentPosition = 0;
  bool isSelected = false;
  List selectedIndex = [];
  ServerResponse? serverResponse;
  String? selectPrakran;

  SadgranthAnusthanBookViewModel(this.sadgranthAnusthanBookScreen) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      sadgranthAnusthanBookController =
          Get.find<SadgranthAnusthanBookController>();
      getLessonListData();
    });
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> getLessonListData() async {
    // lessonResponse = await sadgranthAnusthanBookController!.getLessonList(
    //   {
    //     "registerId": registrationId,
    //     "memberId": membersId,
    //     "catId": informationInfoList!.catId,
    //     "subcatId": informationInfoList!.subcatId
    //   },
    // );

    final String response =
        await rootBundle.loadString(BhajanAssets.vanchnamrutJson9);
    lessonResponse = lessonResponseFromJson(response);
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
    sadgranthAnusthanBookController!.update();
  }

  void selectedChapter(String lessonCatName) {
    selectPrakran = lessonCatName;
    for (var element in lessonInfoList) {
      if (element.lessonCatName == selectPrakran) {
        lessonList = element.lessonList;
      }
    }
    sadgranthAnusthanBookController!.update();
    gotoBack();
  }

  selectedItemLogic(int index, SadgranthAnusthanBookController controller) {
    if (sadgranthAnusthanBookViewModel!.isSelected) {
      sadgranthAnusthanBookViewModel!.selectedIndex.remove(index);
    } else {
      sadgranthAnusthanBookViewModel!.lessonList[index].isReadStatus = true;
      sadgranthAnusthanBookViewModel!.selectedIndex.add(index);
    }
    controller.update();
  }

  Future<void> saveBookButton() async {
    List<Map<String, dynamic>> targetInfo = [];

    for (int i = 0; i < lessonList.length; i++) {
      if (lessonList[i].isReadStatus) {
        Map<String, dynamic> object = {
          "subcatId": lessonList[i].subcatId,
          "petasubcatId": lessonList[i].petasubcatId,
          "dailyTarget": '',
          "niyamId": lessonInfoList[currentPosition].niyamId,
          "lessonId": lessonList[i].lessonId,
        };
        targetInfo.add(object);
        logs('$targetInfo');
      }
    }

    serverResponse =
        await sadgranthAnusthanBookController!.saveDailyNiyamHistory({
      'registerId': registrationId,
      'memberId': membersId,
      'catId': lessonInfoList[0].lessonList[0].catId,
      "targetInfo": targetInfo
    });

    if (serverResponse != null) {
      if (serverResponse!.status == 1) {
        successToast(serverResponse!.msg);
        Get.back();
      } else {
        errorToast(serverResponse!.msg);
      }
    }
    sadgranthAnusthanBookController!.update();
  }
}
