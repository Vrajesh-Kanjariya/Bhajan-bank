import 'dart:async';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../../constant/string_constant.dart';
import '../../controller/otp_controller.dart';
import '../../model/otp_verify_response.dart';
import '../../model/resend_otp_response.dart';
import '../../pages/otp/otp_page.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class OtpViewModel {
  late OtpPage otpPage;
  OtpController? otpController;
  Map<String, dynamic> parameter = {};
  OtpFieldController otpFieldController = OtpFieldController();
  OtpVerifyResponse? otpVerifyResponse;
  ReSendOtpResponse? reSendOtpResponse;
  String otp = '';
  String registrationId = '';

  OtpViewModel(this.otpPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      otpController = Get.find<OtpController>();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      parameter = Get.parameters;
    });
  }

  Future<void> otpVerify() async {
    if (otpViewModel!.otp.length == 6) {
      Map<String, dynamic> otpRequestMap = {
        'registerId': registrationId,
        'otpCode': otpViewModel!.otp
      };
      otpVerifyResponse = await otpController!.otpVerify(otpRequest: otpRequestMap);
      if (otpVerifyResponse != null) {
        successToast(otpVerifyResponse!.msg.toString());
        await setPrefBoolValue(isUserLoginKey, true);
        await setPrefBoolValue(profileStatusKey, otpVerifyResponse!.info.isProfileStatus);
        await setPrefBoolValue(addMemberStatusKey, otpVerifyResponse!.info.isAddMemeberStatus);
        await setPrefBoolValue(userSelectedStatusKey, otpVerifyResponse!.info.isUserSelectedStatus);
        await setPrefStringValue(memberIdKey, otpVerifyResponse!.info.memberId);
        await setPrefStringValue(registerIdKey, otpVerifyResponse!.info.registerId);
        await setPrefStringValue(accessTokenKey, otpVerifyResponse!.info.token);
        gotoLanguage(otpVerifyResponse);
      }
    } else {
      errorToast(AppStringConstants.enterOtp.tr);
    }
  }

  Future<void> resendOtp() async {
    Map<String, dynamic> otpRequestMap = {'registerId': registrationId};
    reSendOtpResponse = await otpController!.resendOtp(resendOtpRequest: otpRequestMap);
    otpController!.update();
  }
}
