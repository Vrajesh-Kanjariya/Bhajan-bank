import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../controller/splash_controller.dart';
import '../../model/splash_response.dart';
import '../../pages/splash/splash_page.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';

class SplashViewModel {
  late SplashPage splashPage;
  SplashController? splashController;
  SplashResponse? splashResponse;

  SplashViewModel(this.splashPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      splashController = Get.find<SplashController>();
    });
  }

  Future<void> getSplashData() async {
    splashResponse = await splashController!.getSplashData();
    splashController!.update();
    if (splashResponse != null) {
      startTimer();
    }
  }

  Future<void> startTimer() async {
    Future.delayed(const Duration(seconds: 5), () async {
      if (await getPrefBoolValue(isUserLoginKey) && await getPrefBoolValue(profileStatusKey)) {
        if (await getPrefBoolValue(userSelectedStatusKey)) {
          goToHome(2);
        } else {
          goToNiyam(2);
        }
      } else {
        if(await getPrefBoolValue(isUserLoginKey) && !await getPrefBoolValue(profileStatusKey)) {
          gotoProfile(isReadOnly: false);
        } else{
          gotoSignIn();
        }
      }
    });
  }
}
