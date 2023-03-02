import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/selected_niyam_module/namavali_screen/namavali_screen.dart';
import '../../../utils/string_extensions.dart';
import '../model/lesson_response.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class NamavaliScreenController extends GetxController with GetTickerProviderStateMixin {
  int activeIndex = 0;
  LessonResponse? lessonResponse;
  bool isLoading = false;
  List<LessonInfoList> lessonInfoList = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double textSize = 17;
  double lineHeight = 1;

  @override
  onInit() {
    super.onInit();
    onInitData();
  }

  onInitData() async {
    await namavaliScreenViewModel!.getArguments();
    await getLessonListData();
    print('lessonResponse!.info.length---->${lessonResponse!.info.length}');
    namavaliScreenViewModel!.tabController =
        TabController(length: lessonInfoList.length, vsync: this);
  }

  Future<void> getLessonListData() async {
    lessonResponse = await getLessonList(
      {
        "registerId": namavaliScreenViewModel!.registrationId,
        "memberId": namavaliScreenViewModel!.membersId,
        "catId": namavaliScreenViewModel!.informationInfoList!.catId,
        "subcatId": namavaliScreenViewModel!.informationInfoList!.subcatId
      },
    );
    if (lessonResponse != null) {
      lessonInfoList = lessonResponse!.info;
    } else {
      errorToast(lessonResponse!.msg);
    }
    update();
  }

  Future<LessonResponse?> getLessonList(Map<String, Object> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.lessonList, body: map);
      if (response != null && response.isNotEmpty) {
        lessonResponse = lessonResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return lessonResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
