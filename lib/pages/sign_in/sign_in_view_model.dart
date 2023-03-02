import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import '../../constant/string_constant.dart';
import '../../controller/sign_in_controller.dart';
import '../../model/login_data_response.dart';
import '../../model/login_request.dart';
import '../../pages/sign_in/sign_in_page.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class SignInViewModel {
  late SignInController signInController;
  SignInPage? signInPage;
  LoginDataResponse? loginDataResponse;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Country selectedDialogCountry = const Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "91",
    minLength: 10,
    maxLength: 10,
  );
  // Country? selectedDialogCountry;
  TextEditingController mobileNumberController = TextEditingController();

  SignInViewModel(this.signInPage) {
    Future.delayed(
        const Duration(milliseconds: 300), () => signInController = Get.find<SignInController>());
  }

  countryPicked(Country country) {
    selectedDialogCountry = country;
    mobileNumberController.clear();
    signInController.update();
  }

  Future<void> userLogin() async {
    String mobile = mobileNumberController.text.trim().toString();
    if (mobile.isEmpty) {
      errorToast(AppStringConstants.enterMobileNumber.tr);
    } else if (mobile.length != selectedDialogCountry.maxLength) {
      errorToast(AppStringConstants.mobileError.tr);
    } else {
      LoginRequest loginRequest = LoginRequest(
          mobileNo: mobile,
          countryName: selectedDialogCountry.name,
          fcmToken: 'testing');

      loginDataResponse = await signInController.userLogin(loginRequest);

      if (loginDataResponse != null) {
        mobileNumberController.clear();
        successToast(loginDataResponse!.msg.toString());
        await setPrefStringValue(mobileNoKey, mobile);
        await setPrefStringValue(registerIdKey, loginDataResponse!.info.registerId);
        gotoVerifyOTP(selectedDialogCountry.code, mobile);
      }
    }
  }
}
