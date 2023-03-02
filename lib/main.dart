import 'package:bank/constant/string_constant.dart';
import 'package:bank/utils/utils.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/localization/bhajan_localization.dart';
import '../../app/widgets/app_theme.dart';
import '../../services/music_service.dart';
import '../constant/color_constant.dart';
import '../routes/route_helper.dart';

MusicService musicService = MusicService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: BhajanColorConstant.appBlack,
      statusBarColor: BhajanColorConstant.primary,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp /*, DeviceOrientation.portraitDown*/
  ]);
  logs('Get.deviceLocale --> ${Get.deviceLocale!.languageCode}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, screenType) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: GetMaterialApp(
            builder: BotToastInit(),
            title: AppStringConstants.bhajanBank.tr,
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            initialRoute: RouteHelper.getSplashRoute(),
            navigatorObservers: [BotToastNavigatorObserver()],
            getPages: RouteHelper.routes,
            theme: AppTheme().lightTheme,
            defaultTransition: Transition.fadeIn,
            scrollBehavior: MyBehavior(),
            locale: Get.deviceLocale,
            translations: AppTranslations(),
          ),
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
