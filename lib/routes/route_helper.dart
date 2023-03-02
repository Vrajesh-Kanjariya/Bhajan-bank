import 'package:bank/pages/niyam_module/select_niyams/select_niyam_page.dart';
import 'package:get/get.dart';

import '../../../pages/coin/coin_page.dart';
import '../../../pages/niyam_module/nitya_bhajan/nitya_bhajan_page.dart';
import '../../../pages/niyam_module/sadgranth_vanchan/sadgranth_vanchan_page.dart';
import '../../../pages/selected_niyam_module/selected_mukha_path/seleted_mukha_path_page.dart';
import '../../../pages/selected_niyam_module/selected_nitya_bhajan/selected_nitya_bhajan_page.dart';
import '../../app/widgets/no_internet_connection.dart';
import '../../pages/announcement/announcement_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/information/information_page.dart';
import '../../pages/language/language_page.dart';
import '../../pages/mantra_jap/mantra_jap_page.dart';
import '../../pages/notification/notification_page.dart';
import '../../pages/otp/otp_page.dart';
import '../../pages/selected_niyam_module/namavali_screen/namavali_screen.dart';
import '../../pages/sign_in/sign_in_page.dart';
import '../../pages/splash/splash_page.dart';
import '../../pages/top_user/top_user_page.dart';
import '../../pages/welcome/welcome_page.dart';
import '../../routes/route_constant.dart';
import '../pages/about_app/about_app_page.dart';
import '../pages/coin/rewards/rewards_page.dart';
import '../pages/daily_darshan/daily_darshan_page.dart';
import '../pages/member/member_page.dart';
import '../pages/niyam_module/edit_niyam/edit_niyam_sadgranth_anusthan/edit_niyam_sadgranth_anusthan_page.dart';
import '../pages/niyam_module/mukh_path/mukh_path_page.dart';
import '../pages/niyam_module/niyam/niyam_page.dart';
import '../pages/niyam_module/niyam_chesta/niyam_chesta_page.dart';
import '../pages/niyam_module/sadgranth_anusthan/sadgranth_anusthan_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/selected_niyam_module/meaning_mahima_history/meaning_mahima_history_page.dart';
import '../pages/selected_niyam_module/sadgranth_anushthan_path/sandgrath_anushthan_path_page.dart';
import '../pages/selected_niyam_module/sadgranth_anusthan_book/sadgranth_anusthan_book_screen.dart';
import '../pages/selected_niyam_module/sandgrath_anushthan_application/sandgrath_anushthan_application_screen.dart';
import '../pages/selected_niyam_module/sandgrath_anushthan_lesson/sandgrath_anushthan_lesson.dart';
import '../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/vandu_path_screen.dart';
import '../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/photo_gallery_screen.dart';
import '../pages/selected_niyam_module/selected_niyam_chesta/selected_niyam_chesta_page.dart';
import '../pages/selected_niyam_module/selected_sadagrantha_vanchan/selected_sadagrantha_vanchan_page.dart';

class RouteHelper {
  static String getNoInternetRoute() => RouteConstant.noInternet;

  static String getSplashRoute() => RouteConstant.splash;

  static String getSignInRoute() => RouteConstant.signIn;

  static String getOtpRoute() => RouteConstant.otp;

  static String getProfileRoute() => RouteConstant.profile;

  static String getHomeRoute() => RouteConstant.home;

  static String getNiyamRoute() => RouteConstant.niyam;

  static String getMemberRoute() => RouteConstant.member;

  static String getMukhPathRoute() => RouteConstant.mukhPath;

  static String getNityaBhajanRoute() => RouteConstant.nityaBhajan;

  static String getChestaNiyamRoute() => RouteConstant.chestaNiyam;

  static String getInformationRoute() => RouteConstant.information;

  static String getSadgranthAnusthanRoute() => RouteConstant.sadgranthAnusthan;

  static String getSadgranthVanchanRoute() => RouteConstant.sadgranthVanchan;

  static String getEditSadgranthAnusthanRoute() => RouteConstant.editSadgranthAnusthan;

  static String getAnnouncementRoute() => RouteConstant.announcement;

  static String getSelectNityaBhajanRoute() => RouteConstant.selectedNityaBhajan;

  static String getSadgranthAnushthanPathRoute() => RouteConstant.sadgranthAnushthanPath;

  static String getSelectedMukhaPathRoute() => RouteConstant.selectedMukhaPath;

  static String getSelectedSadagranthaVancanaRoute() => RouteConstant.selectedSadagranthaVancana;

  static String getSelectedNiyamChestaRoute() => RouteConstant.selectedNiyamChesta;

  static String getMantraJapRoute() => RouteConstant.mantraJap;

  static String getPhotoGalleryRoute() => RouteConstant.photoGallery;

  static String getVanduPathRoute() => RouteConstant.vanduPath;

  static String getDailyDarshanRoute() => RouteConstant.dailyDarshan;

  static String getTopUserRoute() => RouteConstant.topUser;

  static String getSadgranthAnusthanApplicationRoute() =>
      RouteConstant.sadgranthAnusthanApplication;

  static String getSadgranthAnusthanBookRoute() => RouteConstant.sadgranthAnusthanBook;

  static String getMukhPathNiyamRoute() => RouteConstant.mukhPathNiyam;

  static String getMukhPathApplicationRoute() => RouteConstant.mukhPathApplication;

  static String getNamavaliRoute() => RouteConstant.namavali;

  static String getDailyKathaRoute() => RouteConstant.dailyKatha;

  static String getCoinRoute() => RouteConstant.coin;

  static String getNotificationRoute() => RouteConstant.notification;

  static String getRewardsRoute() => RouteConstant.rewards;

  static String getLanguageRoute() => RouteConstant.language;

  static String getWelcomeRoute() => RouteConstant.welcome;
  static String getSandgrathAnushthanLessonRoute() => RouteConstant.sandgrathAnushthanLesson;
  static String getMeaningMahimaHistoryRoute() => RouteConstant.meaningMahimaHistory;

  static String getAboutApp() => RouteConstant.aboutApp;

  static List<GetPage> routes = [
    GetPage(name: RouteConstant.noInternet, page: () => const NoInternetConnection()),
    GetPage(name: RouteConstant.splash, page: () => const SplashPage()),
    GetPage(name: RouteConstant.signIn, page: () => const SignInPage()),
    GetPage(name: RouteConstant.profile, page: () => const ProfilePage()),
    GetPage(name: RouteConstant.otp, page: () => const OtpPage()),
    GetPage(name: RouteConstant.niyam, page: () => const SelectNiyamPage()),
    GetPage(name: RouteConstant.member, page: () => const MemberPage()),
    GetPage(name: RouteConstant.information, page: () => const InformationPage()),
    GetPage(name: RouteConstant.sadgranthAnusthan, page: () => const SadgranthAnusthanPage()),
    GetPage(name: RouteConstant.sadgranthVanchan, page: () => const SadgranthVanchanPage()),
    GetPage(name: RouteConstant.mukhPath, page: () => const MukhPathPage()),
    GetPage(name: RouteConstant.nityaBhajan, page: () => const NityaBhajanPage()),
    GetPage(name: RouteConstant.chestaNiyam, page: () => const NiyamChestaPage()),
    GetPage(
        name: RouteConstant.editSadgranthAnusthan,
        page: () => const EditNiyamSadgranthAnusthanPage()),
    GetPage(name: RouteConstant.home, page: () => const HomePage()),
    GetPage(name: RouteConstant.announcement, page: () => const AnnouncementPage()),
    GetPage(name: RouteConstant.selectedNityaBhajan, page: () => const SelectedNityaBhajanPage()),
    GetPage(
        name: RouteConstant.sadgranthAnushthanPath, page: () => const SadgranthAnushthanPathPage()),
    GetPage(name: RouteConstant.selectedMukhaPath, page: () => const SelectedMukhaPathPage()),
    GetPage(
        name: RouteConstant.selectedSadagranthaVancana,
        page: () => const SelectedSadagranthaVanchanPage()),
    GetPage(name: RouteConstant.selectedNiyamChesta, page: () => const SelectedNiyamChestaPage()),
    GetPage(name: RouteConstant.mantraJap, page: () => const MantraJapPage()),
    GetPage(name: RouteConstant.photoGallery, page: () => const PhotoGalleryScreen()),
    GetPage(name: RouteConstant.vanduPath, page: () => const VanduPathScreen()),
    GetPage(name: RouteConstant.dailyDarshan, page: () => const DailyDarshanPage()),
    GetPage(name: RouteConstant.coin, page: () => const CoinPage()),
    GetPage(name: RouteConstant.notification, page: () => const NotificationPage()),
    GetPage(name: RouteConstant.rewards, page: () => const RewardsPage()),
    GetPage(name: RouteConstant.topUser, page: () => const TopUserPage()),
    GetPage(name: RouteConstant.language, page: () => const LanguagePage()),
    GetPage(name: RouteConstant.welcome, page: () => const WelcomePage()),
    GetPage(name: RouteConstant.namavali, page: () => const NamavaliScreen()),
    GetPage(name: RouteConstant.sadgranthAnusthanApplication, page: () =>  const SandgrathAnushthanApplicationScreen()),
    GetPage(name: RouteConstant.sadgranthAnusthanBook, page: () =>  const SadgranthAnusthanBookScreen()),
    GetPage(name: RouteConstant.sandgrathAnushthanLesson, page: () =>  const SandgrathAnushthanLesson()),
    GetPage(name: RouteConstant.meaningMahimaHistory, page: () =>  const MeaningMahimaHistoryPage()),
    GetPage(name: RouteConstant.aboutApp, page: () => const AboutAppPage()),
  ];
}
