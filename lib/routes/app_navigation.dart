import 'package:bank/model/member_response.dart';
import 'package:get/get.dart';

import '../../model/announcement_response.dart';
import '../../model/information_response.dart';
import '../../model/mukha_path_list_response.dart';
import '../../model/otp_verify_response.dart';
import '../../model/sub_category_response.dart';
import '../model/lesson_response.dart';
import '../model/select_niyam_response.dart';
import '../model/sub_category_data_response.dart';
import 'route_helper.dart';

gotoBack() {
  Get.back();
}

gotoInternet() {
  Get.toNamed(RouteHelper.getNoInternetRoute());
}

gotoSplash() {
  Get.offAllNamed(RouteHelper.getSplashRoute());
}

gotoSignIn() {
  Get.offAllNamed(RouteHelper.getSignInRoute());
}

gotoProfile({bool isUpdate = false,MemberInfoResponse? memberInfoResponse,bool isReadOnly = false}) {
  Get.toNamed(RouteHelper.getProfileRoute(),
      arguments: {'isUpdate': isUpdate, 'memberInfoResponse': memberInfoResponse, 'isReadOnly': isReadOnly});
}

gotoVerifyOTP(String countryCode, String mobileNumber) {
  Get.toNamed(RouteHelper.getOtpRoute(),
      parameters: {'countryCode': countryCode, 'mobileNumber': mobileNumber});
}

gotoLanguage(OtpVerifyResponse? otpVerifyResponse) {
  Get.offAllNamed(RouteHelper.getLanguageRoute(), arguments: {'otpVerifyResponse': otpVerifyResponse});
}

goToHome(int type) {
  switch (type) {
    case 0:
      Get.toNamed(RouteHelper.getHomeRoute());
      break;
    case 1:
      Get.offNamed(RouteHelper.getHomeRoute());
      break;
    case 2:
      Get.offAllNamed(RouteHelper.getHomeRoute());
      break;
  }
}

goToMember() {
  Get.toNamed(RouteHelper.getMemberRoute());
}

goToNiyam(int type) {
  switch (type) {
    case 0:
      Get.toNamed(RouteHelper.getNiyamRoute());
      break;
    case 1:
      Get.offNamed(RouteHelper.getNiyamRoute());
      break;
    case 2:
      Get.offAllNamed(RouteHelper.getNiyamRoute());
      break;
  }
}

goToSadgranthAnusthan(
    {String categoryName = '',
    SubCategoryInfoResponse? subCategoryInfoResponse,
    List<SubCategoryInfoResponse> subCategoryInfoList = const []}) {
  Get.toNamed(RouteHelper.getSadgranthAnusthanRoute(), arguments: {
    'categoryName': categoryName,
    'subCategoryList': subCategoryInfoList,
  });
}

goToEditSadgranthAnusthan({List<SelectNiyamInfoResponse>? selectNiyamInfoList, int? index}) {
  Get.toNamed(RouteHelper.getEditSadgranthAnusthanRoute(),
      arguments: {'selectNiyamInfoList': selectNiyamInfoList, 'index': index});
}

goToSadgranthVanchan(
    {String categoryName = '',
    SubCategoryInfoResponse? subCategoryInfoResponse,
    List<SubCategoryInfoResponse> subCategoryInfoList = const []}) {
  Get.toNamed(RouteHelper.getSadgranthVanchanRoute(), arguments: {
    'categoryName': categoryName,
    'subCategory': subCategoryInfoResponse,
    'subCategoryList': subCategoryInfoList
  });
}

goToMukhPath(
    {String categoryName = '',
    SubCategoryInfoResponse? subCategoryInfoResponse,
    List<SubCategoryInfoResponse> subCategoryInfoList = const []}) {
  Get.toNamed(RouteHelper.getMukhPathRoute(), arguments: {
    'categoryName': categoryName,
    'subCategory': subCategoryInfoResponse,
    'subCategoryList': subCategoryInfoList
  });
}

goToNityaBhajan({List<SubcategoryList>? subCategoryInfoList, int? index}) {
  Get.toNamed(RouteHelper.getNityaBhajanRoute(),
      arguments: {'subCategoryList': subCategoryInfoList, 'index': index});
}

goToChestaNiyam({List<SubcategoryList>? subCategoryInfoList, int? index}) {
  Get.toNamed(RouteHelper.getChestaNiyamRoute(),
      arguments: {'subCategoryList': subCategoryInfoList, 'index': index});
}

goToInformation() {
  Get.toNamed(RouteHelper.getInformationRoute());
}

gotoAnnouncement(AnnouncementInfoList announcementInfoList) {
  Get.toNamed(RouteHelper.getAnnouncementRoute(),
      arguments: {'announcementInfoList': announcementInfoList});
}

gotoNityaBhajanScreen(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSelectNityaBhajanRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoSadgranthAnushthanPathPage(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSadgranthAnushthanPathRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoSelectedMukhaPathPage(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSelectedMukhaPathRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoSelectedSadagranthaVancanaPage(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSelectedSadagranthaVancanaRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoSelectedNiyamChestaPage(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSelectedNiyamChestaRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoPhotoGalleryScreen() {
  Get.toNamed(RouteHelper.getPhotoGalleryRoute());
}

gotoVanduPath(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getVanduPathRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoMantraJap() {
  Get.toNamed(RouteHelper.getMantraJapRoute());
}

gotoDailyDarshan() {
  Get.toNamed(RouteHelper.getDailyDarshanRoute());
}

gotoTopUser() {
  Get.toNamed(RouteHelper.getTopUserRoute());
}

gotoSadgranthAnusthanApplication(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSadgranthAnusthanApplicationRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoSadgranthAnusthanBook(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getSadgranthAnusthanBookRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoSandgrathAnushthanLesson(List<LessonList> lessonList, int lessonIndex, List<LessonInfoList> lessonInfoList){
  Get.toNamed(RouteHelper.getSandgrathAnushthanLessonRoute(),
      arguments: {'lessonList': lessonList,'lessonIndex':lessonIndex,'lessonInfoList':lessonInfoList,});
}

gotoMeaningMahimaHistory(List<LessonInfoList> lessonInfoList){
  Get.toNamed(RouteHelper.getMeaningMahimaHistoryRoute(),
      arguments: {'lessonInfoList':lessonInfoList});
}

gotoMukhPathNiyam() {
  Get.toNamed(RouteHelper.getMukhPathNiyamRoute());
}

gotoMukhPathApplication(
  MukhPathList mukhPathList,
) {
  Get.toNamed(RouteHelper.getMukhPathApplicationRoute(), arguments: {'mukhPathList': mukhPathList});
}

gotoNamavali(InformationInfoList? informationInfoList) {
  Get.toNamed(RouteHelper.getNamavaliRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoDailyKatha(InformationInfoList informationInfoList) {
  Get.toNamed(RouteHelper.getDailyKathaRoute(),
      arguments: {'informationInfoList': informationInfoList});
}

gotoCoin() {
  Get.toNamed(RouteHelper.getCoinRoute());
}

gotoNotification() {
  Get.toNamed(RouteHelper.getNotificationRoute());
}

gotoRewards() {
  Get.toNamed(RouteHelper.getRewardsRoute());
}

gotoWelcome() {
  Get.toNamed(RouteHelper.getWelcomeRoute());
}

gotoAboutApp() {
  Get.toNamed(RouteHelper.getAboutApp());
}
