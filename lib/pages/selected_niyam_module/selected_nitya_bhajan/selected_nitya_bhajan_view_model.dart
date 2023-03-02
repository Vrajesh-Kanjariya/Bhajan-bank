import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/selected_nitya_bhajan_page_controller.dart';
import '../../../model/information_response.dart';
import '../../../model/server_response.dart';
import '../../../model/user_chart_report.dart';
import '../../../pages/home/home_page.dart';
import '../../../pages/selected_niyam_module/selected_nitya_bhajan/selected_nitya_bhajan_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';

class SelectedNityaBhajanViewModel {
  late SelectedNityaBhajanPage selectedNityaBhajanPage;
  InformationInfoList? informationInfoList;
  TabController? tabController;
  TabController? tabControllerReport;
  SelectedNityaBhajanPageController? selectedNityaBhajanPageController;
  TextEditingController dailyTarget = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late int selectedIndex = 0;
  List<Info>? userChartReportList;
  UserChartReport? userChartReport;
  List? userChartReport1;
  String registrationId = '';
  String membersId = '';
  String secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  ServerResponse? serverResponse;
  bool reportShow = false;

  SelectedNityaBhajanViewModel(this.selectedNityaBhajanPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      selectedNityaBhajanPageController = Get.find<SelectedNityaBhajanPageController>();
      getUserChartData();
    });
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

 void onReportShow(SelectedNityaBhajanPageController controller){
   reportShow = !reportShow;
   controller.update();
  }

  Future<void> getUserChartData() async {
    userChartReport = await selectedNityaBhajanPageController!.getUserChartReport({
      'registerId': registrationId,
      'memberId': membersId,
      'catId': informationInfoList!.catId,
      'subcatId': informationInfoList!.subcatId,
      'type': 'week'
    });
    if (userChartReport != null) {
      userChartReportList = userChartReport!.info;
      selectedNityaBhajanPageController!.update();
    }
    selectedNityaBhajanPageController!.update();
  }

  Future<void> saveDailyNiyam() async {
    if (formKey.currentState!.validate()) {
      serverResponse = await selectedNityaBhajanPageController!.saveDailyNiyamHistory({
        'catId': informationInfoList!.catId,
        'registerId': registrationId,
        'memberId': membersId,
        "targetInfo": [
          {
            'subcatId': informationInfoList!.subcatId,
            'niyamId': informationInfoList!.niyamId,
            'petasubcatId': '',
            "lessonId": '',
            'dailyTarget': dailyTarget.text,
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
      selectedNityaBhajanPageController!.update();
    }
  }

  gotoButtonImage(){
    if (informationInfoList!.isTypeStatus == 1) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => MantraJaapScreen(),
      //     ));
    } else if (informationInfoList!.isTypeStatus == 2) {
      gotoVanduPath(informationInfoList!);
    }
  }


}
