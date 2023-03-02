import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_button.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../app/widgets/bhajan_loader.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/otp_controller.dart';
import '../../routes/app_navigation.dart';
import 'otp_page.dart';

AppImageAsset signInBg() => AppImageAsset(
      image: BhajanAssets.signInBg,
      height: Device.height,
      width: Device.width,
      fit: BoxFit.fill,
    );

Form otpFormView(BuildContext context, OtpController controller) => Form(
      child: Column(
        children: [
          SizedBox(
            height: 120.px,
            child: Lottie.asset(BhajanAssets.otpAnimation),
          ),
          AppText(
            text: AppStringConstants.enterOTPVerify.tr,
            textAlign: TextAlign.center,
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            fontColor: BhajanColorConstant.white,
            fontFamily: AppTheme.poppins,
          ),
          SizedBox(height: 10.px),
          AppText(
              text: '${AppStringConstants.otpSendMobileNumber.tr}'
                  ' +${otpViewModel!.parameter['countryCode']}'
                  ' ${otpViewModel!.parameter['mobileNumber']}',
              textAlign: TextAlign.center,
              letterSpacing: -0.41,
              fontSize: 13.px,
              fontWeight: FontWeight.w500,
              fontFamily: AppTheme.poppins,
              fontColor: BhajanColorConstant.white),
          SizedBox(height: 5.px),
          GestureDetector(
              onTap: () {
                gotoBack();
              },
              child: AppText(
                  text: AppStringConstants.changeMobileNumber.tr,
                  letterSpacing: -0.41,
                  fontFamily: AppTheme.poppins,
                  fontSize: 14.px,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontColor: BhajanColorConstant.white.withOpacity(0.8))),
          SizedBox(height: 20.px),
          OTPTextField(
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: Colors.white.withOpacity(0.8),
              focusBorderColor: Colors.white,
            ),
            controller: otpViewModel!.otpFieldController,
            length: 6,
            spaceBetween: 10.px,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 40.px,
            style: TextStyle(
                fontSize: 20.px, fontWeight: FontWeight.w700, color: BhajanColorConstant.maleReg),
            textFieldAlignment: MainAxisAlignment.center,
            fieldStyle: FieldStyle.box,
            onChanged: (pin) {
              otpViewModel!.otp = pin;
            },
            onCompleted: (pin) {},
          ),
          GetBuilder<OtpController>(
            builder: (otpController) {
              return Padding(
                padding: EdgeInsets.only(top: 8.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: otpController.enableResend
                            ? () => otpViewModel!.resendOtp()
                            : null,
                        child: AppText(
                          text: AppStringConstants.resendOtp.tr,
                          letterSpacing: -0.41,
                          fontStyle: FontStyle.italic,
                          fontSize: 13.px,
                          fontWeight: otpController.secondsRemaining == 0
                              ? FontWeight.w500
                              : FontWeight.w400,
                          fontColor: BhajanColorConstant.white,
                          fontFamily: AppTheme.poppins,
                        )),
                    AppText(
                      text: otpController.enableResend
                          ? ' ?'
                          : ' : ${otpController.secondsRemaining}',
                      letterSpacing: -0.41,
                      fontStyle: FontStyle.italic,
                      fontSize: 14.px,
                      fontWeight:
                          otpController.secondsRemaining == 0 ? FontWeight.w500 : FontWeight.w400,
                      fontColor: BhajanColorConstant.white,
                      fontFamily: AppTheme.poppins,
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );

Align verifyButton() => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: EdgeInsets.only(bottom: 25.px, left: 60.px, right: 60.px),
          child: AppButton(
            onTap: () async {
              await otpViewModel!.otpVerify();
            },
            text: AppStringConstants.verifyButton.tr,
            fontSize: 25.px,
          )),
    );

Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();
