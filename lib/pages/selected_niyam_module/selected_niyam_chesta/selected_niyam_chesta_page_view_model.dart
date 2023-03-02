import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/calendar/src/shared/utils.dart';
import '../../../controller/selected_niyam_chesta_page_controller.dart';
import '../../../model/information_response.dart';
import '../../../model/server_response.dart';
import '../../../pages/selected_niyam_module/selected_niyam_chesta/selected_niyam_chesta_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';
import '../../home/home_page.dart';

class SelectedNiyamChestaPageViewModel {
  late SelectedNiyamChestaPage selectedNiyamChestaPage;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  ServerResponse? serverResponse;
  SelectedNiyamChestaPageController? selectedNiyamChestaPageController;
  DateTime? saveFocusDay = DateTime.now();
  DateTime? saveLastDate;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime ffocusedDay = DateTime.now();
  final Set<DateTime> selectedDay = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  ScrollController scrollController = ScrollController();
  DateTime? selectDay;
  bool isLoading = false;
  bool isRefresh = false;
  bool isLoadFirst = true;

  SelectedNiyamChestaPageViewModel(this.selectedNiyamChestaPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      selectedNiyamChestaPageController = Get.find<SelectedNiyamChestaPageController>();
    });
  }

  getArguments() async {
    logs('Get.arguments --> ${Get.arguments}');
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> saveDailyNiyam() async {
    serverResponse = await selectedNiyamChestaPageController!.saveDailyNiyamHistory({
      'catId': informationInfoList!.catId,
      'registerId': registrationId,
      'memberId': membersId,
      "targetInfo": [
        {
          'subcatId': informationInfoList!.subcatId,
          'niyamId': informationInfoList!.niyamId,
          'petasubcatId': informationInfoList!.petasubcatId,
          "lessonId": '',
          'dailyTarget': '',
        },
      ]
    });
    if (serverResponse != null) {
      if (serverResponse!.status == 1) {
        successToast(serverResponse!.msg);
        Get.back();
      } else {
        errorToast(serverResponse!.msg);
      }
      homePageViewModel!.getNiyamData();
    }
    selectedNiyamChestaPageController!.update();
  }

  void gotoButtonImageNextScreen() {
    if (informationInfoList!.isTypeStatus == 5) {
      gotoAnnouncement(homePageViewModel!.announcementInfoList[0]);
    }
  }
}
