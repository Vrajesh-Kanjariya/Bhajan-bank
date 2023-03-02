import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/string_constant.dart';
import '../../controller/language_controller.dart';
import '../../model/otp_verify_response.dart';
import '../../pages/language/language_page.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class LanguageViewModel {
  late LanguagePage languagePage;
  LanguageController? languageController;
  OtpVerifyResponse? otpVerifyResponse;
  String? lang;
  int? value;

  LanguageViewModel(this.languagePage) {
    Future.delayed(const Duration(milliseconds: 300), () {
      languageController = Get.find<LanguageController>();
      getArguments();
    });
  }

  void getArguments() {
    otpVerifyResponse = Get.arguments['otpVerifyResponse'];
    languageController!.update();
  }

  Future<void> endOnTap() async {
    lang = 'eng';
    value = 1;
    await setPrefStringValue(languageKey, lang!);
    Get.updateLocale(const Locale('en', 'US'));
    languageController!.update();
  }

  Future<void> gujOnTap() async {
    lang = 'guj';
    value = 2;
    await setPrefStringValue(languageKey, lang!);
    Get.updateLocale(const Locale('gu', 'IN'));
    languageController!.update();
  }

  Future<void> onTapNext() async {
    if (lang != null) {
      if (languageViewModel!.otpVerifyResponse!.info.isAddMemeberStatus) {
        goToMember();
      }else if (!languageViewModel!.otpVerifyResponse!.info.isProfileStatus) {
        gotoProfile(isReadOnly: false);
      } else if (await getPrefBoolValue(isUserLoginKey) && languageViewModel!.otpVerifyResponse!.info.isProfileStatus) {
        if (languageViewModel!.otpVerifyResponse!.info.isUserSelectedStatus) {
          goToHome(2);
        } else {
          goToNiyam(0);
        }
      } else {
        gotoProfile(isReadOnly: false);
      }
    } else {
      errorToast(AppStringConstants.selectLanguage.tr);
    }
  }
}
