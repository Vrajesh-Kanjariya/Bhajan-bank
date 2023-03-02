import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../../model/member_response.dart';
import '../../model/otp_verify_response.dart';
import '../../model/resend_otp_response.dart';
import '../../utils/string_extensions.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class OtpController extends GetxController {
  int secondsRemaining = 60;
  bool enableResend = false;
  bool isLoading = false;
  ReSendOtpResponse? reSendOtpResponse;
  OtpVerifyResponse? otpVerifyResponse;
  MemberResponse? memberResponse;
  Timer? timer;

  @override
  void onClose() {
    timer!.cancel();
    super.onClose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        logs("timer --> $secondsRemaining");
        update();
      } else {
        timer!.cancel();
        enableResend = true;
        update();
      }
    });
  }

  Future<OtpVerifyResponse?> otpVerify({required Map<String, dynamic> otpRequest}) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.otpVerify, body: otpRequest);
      if (response != null && response.isNotEmpty) {
        otpVerifyResponse = otpVerifyResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in userLogin --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return otpVerifyResponse;
  }

  Future<ReSendOtpResponse?> resendOtp({required Map<String, dynamic> resendOtpRequest}) async {
    try {
      timer = null;
      secondsRemaining = 60;
      enableResend = false;
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.resendOtp, body: resendOtpRequest);
      if (response != null && response.isNotEmpty) {
        reSendOtpResponse = reSendOtpResponseFromJson(response);
        successToast(reSendOtpResponse!.msg);
        startTimer();
      }
    } on SocketException catch (e) {
      logs('Socket exception in userLogin --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return reSendOtpResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
