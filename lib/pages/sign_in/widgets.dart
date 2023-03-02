import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_button.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../app/widgets/bhajan_loader.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import 'sign_in_page.dart';

Container openCountryPickerDialog(BuildContext context) => Container(
      width: 210.px,
      alignment: Alignment.center,
      child: IntlPhoneField(
        flagsButtonMargin: EdgeInsets.zero,
        onCountryChanged: (Country country) => signInViewModel!.countryPicked(country),
        initialCountryCode: 'IN',
        showDropdownIcon: false,
        showCountryFlag: true,
        showCursor: false,
        showCountryName: true,
        pickerDialogStyle: PickerDialogStyle(
            searchFieldInputDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 0.px),
                hintText: AppStringConstants.search.tr,
                hintStyle: TextStyle(
                    fontSize: 12.px,
                    height: 0.9,
                    fontWeight: FontWeight.w500,
                    color: BhajanColorConstant.grey,
                    letterSpacing: -0.41.px,
                    fontFamily: AppTheme.poppins,
                    fontStyle: FontStyle.normal),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: BhajanColorConstant.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: BhajanColorConstant.grey)),
                suffixIcon: const Icon(Icons.search))),
        validator: (p0) => null,
        readOnly: true,
        style: TextStyle(
          fontFamily: AppTheme.poppins,
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
          color: BhajanColorConstant.white,
        ),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: BhajanColorConstant.underline)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: BhajanColorConstant.underline)),
          prefixIcon: const SizedBox(),
          labelStyle: TextStyle(
            fontFamily: AppTheme.poppins,
            fontSize: 14.px,
            fontWeight: FontWeight.w600,
            color: BhajanColorConstant.whiteColor,
          ),
          suffixIconConstraints: BoxConstraints(minHeight: 2.px, minWidth: 4.px),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10.px),
            child: const AppImageAsset(
                image: BhajanAssets.arrowDropDown, color: BhajanColorConstant.whiteColor),
          ),
          contentPadding: EdgeInsets.zero,
          counterText: '',
        ),
      ),
    );

AppImageAsset loginBg() => AppImageAsset(
      image: BhajanAssets.signInBg,
      height: Device.height,
      width: Device.width,
      fit: BoxFit.fill,
    );

Align signInButton() => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: EdgeInsets.only(bottom: 25.px, left: 60.px, right: 60.px),
          child: AppButton(
            onTap: () async => await signInViewModel!.userLogin(),
            text: AppStringConstants.getOTPButton.tr,
            fontSize: 25.px,
          )),
    );

SingleChildScrollView phoneVerificationView(BuildContext context) => SingleChildScrollView(
      child: Form(
        key: signInViewModel!.formKey,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: verificationFormView(context),
        ),
      ),
    );

Column verificationFormView(BuildContext context) => Column(
      children: [
        SizedBox(height: 5.px),
        SizedBox(
          height: 120.px,
          child: Lottie.asset(BhajanAssets.loginAnimation),
        ),
        SizedBox(height: 15.px),
        AppText(
            text: AppStringConstants.phoneVerification.tr,
            fontFamily: AppTheme.poppins,
            textAlign: TextAlign.center,
            letterSpacing: -0.408,
            fontStyle: FontStyle.normal,
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            fontColor: BhajanColorConstant.white),
        SizedBox(height: 8.px),
        AppText(
            text: AppStringConstants.enterMobileNumber.tr,
            fontFamily: AppTheme.poppins,
            letterSpacing: -0.41,
            fontStyle: FontStyle.normal,
            fontSize: 13.7.px,
            fontWeight: FontWeight.w400,
            fontColor: BhajanColorConstant.white),
        SizedBox(height: 30.px),
        openCountryPickerDialog(context),
        SizedBox(height: 5.px),
        Container(
          height: 35.px,
          padding: EdgeInsets.symmetric(horizontal: 75.px),
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(signInViewModel!.selectedDialogCountry.maxLength),
            ],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            controller: signInViewModel!.mobileNumberController,
            cursorColor: BhajanColorConstant.white,
            style: GoogleFonts.lato(
                letterSpacing: 0.75,
                fontStyle: FontStyle.normal,
                fontSize: 20.px,
                fontWeight: FontWeight.w700,
                color: BhajanColorConstant.white),
            decoration: const InputDecoration(
              counterStyle: TextStyle(color: BhajanColorConstant.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: BhajanColorConstant.underline)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: BhajanColorConstant.underline)),
            ),
          ),
        ),
      ],
    );

Widget countryPickerField() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 150.px,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.px, left: 7.px),
                child: SizedBox(
                  height: 13.px,
                  width: 18.px,
                  child: AppImageAsset(
                      image: signInViewModel!.selectedDialogCountry.flag,
                      width: 20.px,
                      height: 20
                          .px) /*CountryPickerUtils.getDefaultFlagImage(
                        signInViewModel!.selectedDialogCountry))*/
                  ,
                ),
              ),
              SizedBox(width: 5.px),
              Flexible(
                child: AppText(
                  text: '${signInViewModel!.selectedDialogCountry.name}'
                      ' (+${signInViewModel!.selectedDialogCountry.dialCode})',
                  fontSize: 15.px,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppTheme.lato,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 30.px),
        Padding(
          padding: EdgeInsets.only(top: 5.px),
          child: AppImageAsset(
            image: BhajanAssets.arrowDropDown,
            height: 7.px,
            width: 13.px,
          ),
        )
      ],
    );

Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();
