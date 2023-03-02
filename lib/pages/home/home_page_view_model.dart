import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../../../pages/home/home_page.dart';
import '../../controller/home_page_controller.dart';
import '../../controller/niyam_controller.dart';
import '../../model/announcement_response.dart';
import '../../model/information_response.dart';
import '../../model/select_niyam_response.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';

class HomePageViewModel {
  late HomePage homePage;
  HomePageController? homePageController;
  AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<SelectNiyamInfoResponse> selectNiyamInfoList = [];
  NiyamController? niyamController;
  SelectNiyamResponse? selectNiyamResponse;
  AnnouncementResponse? announcement;
  List<AnnouncementInfoList> announcementInfoList = [];
  String registrationId = '';
  String membersId = '';
  int currentPosition = 0;
  PageController pageController = PageController();

  HomePageViewModel(this.homePage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      homePageController = Get.find<HomePageController>();
      niyamController = Get.put(NiyamController());
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      membersId = await getPrefStringValue(memberIdKey) ?? '';
      await getAnnouncementData();
      await getNiyamData();
    });
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  Future<void> getNiyamData() async {
    selectNiyamResponse = await niyamController!.getSelectedNiyamHistoryData({
      'registerId': registrationId,
      'memberId': membersId,
    }, false);
    if (selectNiyamResponse != null) {
      selectNiyamInfoList = selectNiyamResponse!.info;
    }
    homePageController!.update();
    niyamController!.update();
  }

  Future<void> getAnnouncementData() async {
    announcement = await homePageController!.getAnnouncementDataApi({
      'registerId': registrationId,
    });
    if (announcement != null) {
      announcementInfoList = announcement!.info;
    }
    homePageController!.update();
  }

  Future<void> selectedNiyamBhajanScreen(int index) async {
    InformationResponse? informationResponse;
    if (selectNiyamInfoList[index].catId == 1) {
      informationResponse = await homePageController!.getInformationList({
        'registerId': registrationId,
        'memberId': membersId,
        'catId': selectNiyamInfoList[index].catId,
        'subcatId': selectNiyamInfoList[index].subcatId,
        'niyamId': selectNiyamInfoList[index].niyamId
      });
      if (informationResponse != null) {
        InformationInfoList informationInfoList = informationResponse.info;
        gotoNityaBhajanScreen(informationInfoList);
      }
      homePageController!.update();
    } else if (selectNiyamInfoList[index].catId == 2) {
      informationResponse = await homePageController!.getInformationList({
        'registerId': registrationId,
        'memberId': membersId,
        'catId': selectNiyamInfoList[index].catId,
        'subcatId': selectNiyamInfoList[index].subcatId,
        'niyamId': selectNiyamInfoList[index].niyamId
      });
      if (informationResponse != null) {
        InformationInfoList informationInfoList = informationResponse.info;
        gotoSadgranthAnushthanPathPage(informationInfoList);
      }
      homePageController!.update();
    } else if (selectNiyamInfoList[index].catId == 3) {
      informationResponse = await homePageController!.getInformationList({
        'registerId': registrationId,
        'memberId': membersId,
        'catId': selectNiyamInfoList[index].catId,
        'subcatId': selectNiyamInfoList[index].subcatId,
        'niyamId': selectNiyamInfoList[index].niyamId
      });
      if (informationResponse != null) {
        InformationInfoList informationInfoList = informationResponse.info;
        gotoSelectedMukhaPathPage(informationInfoList);
      }
      homePageController!.update();
    } else if (selectNiyamInfoList[index].catId == 4) {
      informationResponse = await homePageController!.getInformationList({
        'registerId': registrationId,
        'memberId': membersId,
        'catId': selectNiyamInfoList[index].catId,
        'subcatId': selectNiyamInfoList[index].subcatId,
        'niyamId': selectNiyamInfoList[index].niyamId
      });
      if (informationResponse != null) {
        InformationInfoList informationInfoList = informationResponse.info;
        gotoSelectedSadagranthaVancanaPage(informationInfoList);
      }
    } else if (selectNiyamInfoList[index].catId == 5) {
      informationResponse = await homePageController!.getInformationList({
        'registerId': registrationId,
        'memberId': membersId,
        'catId': selectNiyamInfoList[index].catId,
        'subcatId': selectNiyamInfoList[index].subcatId,
        'niyamId': selectNiyamInfoList[index].niyamId
      });
      if (informationResponse != null) {
        InformationInfoList informationInfoList = informationResponse.info;
        gotoSelectedNiyamChestaPage(informationInfoList);
      }
    }
    homePageController!.update();
  }
}
