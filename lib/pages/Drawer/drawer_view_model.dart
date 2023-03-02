import 'package:get/get.dart';

import '../../controller/drawer_controller.dart';
import '../../model/logout_response.dart';
import '../../pages/Drawer/drawer_page.dart';
import '../../pages/announcement/announcement_page.dart';
import '../../pages/coin/coin_page.dart';
import '../../pages/coin/rewards/rewards_page.dart';
import '../../pages/daily_darshan/daily_darshan_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/language/language_page.dart';
import '../../pages/mantra_jap/mantra_jap_page.dart';
import '../../pages/member/member_page.dart';
import '../../pages/niyam_module/edit_niyam/edit_niyam_sadgranth_anusthan/edit_niyam_sadgranth_anusthan_page.dart';
import '../../pages/niyam_module/nitya_bhajan/nitya_bhajan_page.dart';
import '../../pages/niyam_module/niyam/niyam_page.dart';
import '../../pages/niyam_module/niyam_chesta/niyam_chesta_page.dart';
import '../../pages/niyam_module/sadgranth_anusthan/sadgranth_anusthan_page.dart';
import '../../pages/niyam_module/sadgranth_vanchan/sadgranth_vanchan_page.dart';
import '../../pages/notification/notification_page.dart';
import '../../pages/otp/otp_page.dart';
import '../../pages/profile/profile_page.dart';
import '../../pages/selected_niyam_module/sadgranth_anushthan_path/sandgrath_anushthan_path_page.dart';
import '../../pages/selected_niyam_module/selected_mukha_path/seleted_mukha_path_page.dart';
import '../../pages/selected_niyam_module/selected_nitya_bhajan/selected_nitya_bhajan_page.dart';
import '../../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/vandu_path_screen.dart';
import '../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/photo_gallery_screen.dart';
import '../../pages/selected_niyam_module/selected_niyam_chesta/selected_niyam_chesta_page.dart';
import '../../pages/selected_niyam_module/selected_sadagrantha_vanchan/selected_sadagrantha_vanchan_page.dart';
import '../../pages/sign_in/sign_in_page.dart';
import '../../pages/splash/splash_page.dart';
import '../../pages/top_user/top_user_page.dart';
import '../../pages/welcome/welcome_page.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';
import '../about_app/about_app_page.dart';
import '../niyam_module/mukh_path/mukh_path_page.dart';
import '../selected_niyam_module/meaning_mahima_history/meaning_mahima_history_page.dart';
import '../selected_niyam_module/sadgranth_anusthan_book/sadgranth_anusthan_book_screen.dart';
import '../selected_niyam_module/sandgrath_anushthan_application/sandgrath_anushthan_application_screen.dart';
import '../selected_niyam_module/sandgrath_anushthan_lesson/sandgrath_anushthan_lesson.dart';
import '../niyam_module/select_niyams/select_niyam_page.dart';


class DrawerViewModel {
  late DrawerPage drawerPage;
  DrawerPageController? drawerController;
  LogoutResponse? logoutResponse;
  double profileCompleteValue = 0.0;
  String memberId = '';

  DrawerViewModel(this.drawerPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      drawerController = Get.find<DrawerPageController>();
      memberId = await getPrefStringValue(memberIdKey) ?? '';
    });
  }

  Future<void> logout() async {
    gotoBack();
    logoutResponse = await drawerController!.logout();
    if (logoutResponse != null) {
      successToast(logoutResponse!.msg!);
      await clearViewModelData();
      await Get.deleteAll(force: true);
      await removePref();
      gotoSignIn();
    } else {
      errorToast(logoutResponse!.msg!);
    }
  }

  clearViewModelData(){
    splashViewModel = null;
    signInViewModel = null;
    otpViewModel = null;
    languageViewModel = null;
    profileViewModel = null;
    welcomeViewModel = null;
    memberViewModel = null;
    homePageViewModel = null;
    drawerViewModel = null;
    niyamViewModel = null;
    announcementPageViewModel = null;
    rewardsViewModel = null;
    coinViewModel = null;
    dailyDarshanViewModel = null;
    mantraJapViewModel = null;
    editNiyamSadgranthAnusthanViewModel = null;
    mukhPathViewModel = null;
    nityaBhajanViewModel = null;
    niyamChestaViewModel = null;
    sadgranthAnusthanViewModel = null;
    sadgranthVanchanViewModel = null;
    notificationViewModel = null;
    topUserViewModel = null;
    sadgranthAnushthanPathViewModel = null;
    selectedMukhaPathPageViewModel = null;
    vanduPathScreenViewModel = null;
    selectedNityaBhajanViewModel = null;
    photoGalleryScreenViewModel = null;
    selectedNiyamChestaPageViewModel = null;
    selectedSadagranthaVanchanViewModel = null;
    sandgrathAnushthanLessonViewModel = null;
    meaningMahimaHistoryViewModel = null;
    sandgrathAnushthanApplicationViewModel = null;
    sadgranthAnusthanBookViewModel = null;
    aboutAppViewModel = null;
  }
}
