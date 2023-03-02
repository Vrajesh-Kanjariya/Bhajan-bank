import 'package:bank/app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/string_constant.dart';
import '../../controller/otp_controller.dart';
import '../../pages/otp/otp_view_model.dart';
import '../../pages/otp/widgets.dart';

OtpViewModel? otpViewModel;

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    otpViewModel ?? (otpViewModel = OtpViewModel(this));
    return GetBuilder<OtpController>(
      init: OtpController(),
      initState: (state) {
        Future.delayed(const Duration(milliseconds: 350), () async {
          final otpController = Get.find<OtpController>();
          otpController.startTimer();
        });
      },
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.px),
              child: BhajanBankAppBar(
                title: AppStringConstants.bhajanBank.tr.toUpperCase(),
                isShowAction: false,
                isShowLeading: false,
              ),
            ),
            body: Stack(
              children: [
                signInBg(),
                otpFormView(context, controller),
                verifyButton(),
                loader(controller.isLoading)
              ],
            ),
          ),
        );
      },
    );
  }
}
