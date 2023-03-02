import 'package:bank/app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../../../controller/profile_controller.dart';
import '../../app/widgets/app_error_text.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_text_form_field.dart';
import '../../app/widgets/app_theme.dart';
import '../../app/widgets/bhajan_loader.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../routes/app_navigation.dart';
import 'profile_page.dart';

AppImageAsset profileBg(BuildContext context) => AppImageAsset(
      image: BhajanAssets.background,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );

Form profileFormView(BuildContext context, ProfileController controller) => Form(
      key: profileViewModel!.formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                rajatJayantiName(),
                stepName(context, controller),
                stepIndicator(),
                if (profileViewModel!.currentStep == 0) buildProfileView(),
                if (profileViewModel!.currentStep == 0) profileName(),
                SizedBox(height: 2.px),
                if (profileViewModel!.currentStep == 0) profileFields(context, controller),
                if (profileViewModel!.currentStep == 1) otherFields(context, controller)
              ],
            ),
          )
        ],
      ),
    );

Visibility rajatJayantiName() => Visibility(
      visible: true,
      child: AppText(
          text: AppStringConstants.rajatJayantiMahotsav.tr,
          textAlign: TextAlign.center,
          fontFamily: AppTheme.oswald,
          fontStyle: FontStyle.normal,
          fontSize: 24.px,
          maxLines: 2,
          letterSpacing: 0.75,
          fontWeight: FontWeight.w500,
          fontColor: BhajanColorConstant.white.withOpacity(0.45)),
    );

Column stepName(BuildContext context, ProfileController controller) => Column(
      children: [
        SizedBox(
          height: 20.px,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: profileViewModel!.stepsNameList.length,
            separatorBuilder: (BuildContext context, index) {
              return SizedBox(width: 23.px);
            },
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () => profileViewModel!.changeStepIndicator(index),
                child: Container(
                  width: 120.px,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 2.px),
                  child: AppText(
                      text: profileViewModel!.stepsNameList[index],
                      fontSize: 16.px,
                      fontWeight: FontWeight.w800,
                      fontColor: BhajanColorConstant.white),
                ),
              );
            },
          ),
        ),
      ],
    );

Padding stepIndicator() => Padding(
      padding: EdgeInsets.only(top: 15.px, bottom: 10.px),
      child: StepsIndicator(
        selectedStep: profileViewModel!.currentStep,
        nbSteps: profileViewModel!.totalSteps,
        doneLineColor: BhajanColorConstant.white,
        undoneLineColor: BhajanColorConstant.gray,
        isHorizontal: true,
        enableLineAnimation: true,
        enableStepAnimation: true,
        selectedStepSize: 9,
        unselectedStepSize: 9,
        doneStepSize: 9,
        lineLength: 150,
        undoneLineThickness: 3,
        doneLineThickness: 3,
        unselectedStepWidget: Container(
          height: 9.px,
          width: 9.px,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: BhajanColorConstant.white),
          ),
        ),
        selectedStepWidget: Container(
          height: 9.px,
          width: 9.px,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: BhajanColorConstant.white),
          ),
        ),
        doneStepWidget: Container(
          height: 9.px,
          width: 9.px,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: BhajanColorConstant.white),
          ),
        ),
      ),
    );

PreferredSize profileAppBar(BuildContext context, ProfileController controller) => PreferredSize(
      preferredSize: Size.fromHeight(60.px),
      child: AppBar(
        shadowColor: BhajanColorConstant.transparent,
        centerTitle: true,
        backgroundColor: BhajanColorConstant.primary,
        leading: Visibility(
          visible: (profileViewModel!.profileStatus && profileViewModel!.isUpdate) ||
              (profileViewModel!.profileStatus && !profileViewModel!.isUpdate),
          child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                profileViewModel!.currentStep = 0;
                controller.isLoading ? null : gotoBack();
              },
              icon: const AppImageAsset(
                image: BhajanAssets.backArrow,
              ),
            ),
          ),
        ),
        title: AppText(
            text: AppStringConstants.profile.tr.toUpperCase(),
            textAlign: TextAlign.center,
            fontFamily: AppTheme.poppins,
            fontStyle: FontStyle.normal,
            fontSize: 24.px,
            letterSpacing: 0.75,
            fontWeight: FontWeight.w700,
            fontColor: BhajanColorConstant.white),
        actions: [
          Visibility(
            visible: profileViewModel!.profileStatus && profileViewModel!.isUpdate,
            child: InkWell(
              onTap: () {
                profileViewModel!.isReadOnly = true;
                controller.update();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.px),
                child: SizedBox(
                  height: 20.px,
                  child: const AppImageAsset(image: BhajanAssets.editIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );

Stack buildProfileView() {
  return Stack(
    alignment: Alignment.center,
    children: [
      InkWell(
        onTap: profileViewModel!.isReadOnly ? null : () => profileViewModel!.getFromGallery(),
        child: Container(
          width: 156.px,
          height: 156.px,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 3.px),
            child: ClipOval(
              child: CircleAvatar(
                radius: 100.px,
                backgroundColor: Colors.white,
                child: profileViewModel!.imagePath.contains("http")
                    ? AppImageAsset(
                        image: profileViewModel!.imagePath,
                        webHeight: 156.px,
                        webWidth: 156.px,
                        isWebImage: true,
                      )
                    : profileViewModel!.imageFile != null
                        ? AppImageAsset(
                            image: profileViewModel!.imagePath,
                            height: 156.px,
                            width: 156.px,
                            isFileImage: true,
                          )
                        : const AppImageAsset(
                            image: BhajanAssets.profilePranam,
                            fit: BoxFit.fill,
                            // height: 156.px,
                            // width: 156.px,
                          ),
              ),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: profileViewModel!.isReadOnly ? null : () => profileViewModel!.getFromGallery(),
        child: Container(
          width: 158.px,
          height: 158.px,
          alignment: Alignment.center,
          child: AppImageAsset(
            image: BhajanAssets.profileBg,
            width: 158.px,
            height: 158.px,
            fit: BoxFit.fill,
          ),
        ),
      ),
      InkWell(
        onTap: profileViewModel!.isReadOnly ? null : () => profileViewModel!.getFromGallery(),
        child: Container(
            width: 158.px,
            height: 165.px,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.px),
              child: AppText(
                  text: AppStringConstants.profileText,
                  textAlign: TextAlign.center,
                  fontFamily: AppTheme.poppins,
                  fontStyle: FontStyle.normal,
                  maxLines: 2,
                  fontSize: 14.px,
                  height: 1.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.white),
            )),
      ),
      Positioned(
          right: 120,
          top: 13,
          child: InkWell(
            onTap: profileViewModel!.isReadOnly ? null : () => profileViewModel!.getFromGallery(),
            child: AppImageAsset(image: BhajanAssets.profileEdit, width: 29.px, height: 26.px),
          ))
    ],
  );
}

Column profileName() => Column(
      children: [
        AppText(
            text:
                '${profileViewModel!.nameController.text} ${profileViewModel!.sureNameController.text}',
            textAlign: TextAlign.center,
            fontFamily: AppTheme.baloobhai2,
            fontStyle: FontStyle.normal,
            fontSize: 18.px,
            letterSpacing: -0.33,
            fontWeight: FontWeight.w600,
            fontColor: BhajanColorConstant.black),
        profileViewModel!.profileStatus && profileViewModel!.isUpdate
            ? AppText(
                text:
                    profileViewModel!.mobileNo,
                textAlign: TextAlign.center,
                fontFamily: AppTheme.baloobhai2,
                fontStyle: FontStyle.normal,
                fontSize: 18.px,
                letterSpacing: -0.33,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.black)
            : SizedBox(),
      ],
    );

Container profileFields(BuildContext context, ProfileController controller) => Container(
      color: BhajanColorConstant.profileBg,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, left: 30.px, right: 30.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.px),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.center,
                child: AppTextFormField(
                  textAlign: TextAlign.center,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  controller: profileViewModel!.sureNameController,
                  hint: AppStringConstants.surname,
                  fontSize: 15.px,
                  fillColor: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.white,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  isBorder: true,
                  readOnly: profileViewModel!.isReadOnly,
                  borderWidth: 2.px,
                  hintFontSize: 14.px,
                  fontColor: BhajanColorConstant.black,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                  ],
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            if (profileViewModel!.surNameError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.surNameError),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.center,
                child: AppTextFormField(
                  controller: profileViewModel!.nameController,
                  hint: AppStringConstants.name,
                  fontSize: 15.px,
                  isBorder: true,
                  textAlign: TextAlign.center,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  fillColor: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.white,
                  readOnly: profileViewModel!.isReadOnly,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  borderWidth: 2.px,
                  hintFontSize: 14.px,
                  fontColor: BhajanColorConstant.black,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                  ],
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            if (profileViewModel!.nameError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.nameError),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.center,
                child: AppTextFormField(
                  controller: profileViewModel!.fatherNameController,
                  hint: AppStringConstants.lastName,
                  fontSize: 15.px,
                  isBorder: true,
                  textAlign: TextAlign.center,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  fillColor: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.white,
                  readOnly: profileViewModel!.isReadOnly,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  borderWidth: 2.px,
                  hintFontSize: 14.px,
                  fontColor: BhajanColorConstant.black,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                  ],
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            if (profileViewModel!.fatherNameError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.fatherNameError),
            /*Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.center,
                child: AppTextFormField(
                  controller: profileViewModel!.dateOfBirthController,
                  hint: AppStringConstants.dateOfBirth,
                  fontSize: 15.px,
                  isBorder: true,
                  textAlign: TextAlign.center,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  fillColor: BhajanColorConstant.white,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  borderWidth: 2.px,
                  hintFontSize: 14.px,
                  fontColor: BhajanColorConstant.black,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1901),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    profileViewModel!.pickedDob(pickedDate);
                  },
                ),
              ),
            ),
            if (profileViewModel!.dobError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.dobError),*/
            Padding(
              padding: EdgeInsets.only(left: 8.px, right: 5.px, top: 5.px),
              child: Container(
                alignment: Alignment.center,
                height: 38.px,
                decoration: BoxDecoration(
                    color: profileViewModel!.isReadOnly
                        ? BhajanColorConstant.grey.withOpacity(0.1)
                        : BhajanColorConstant.white,
                    borderRadius: BorderRadius.circular(42.px),
                    border: Border.all(width: 2.px, color: BhajanColorConstant.status)),
                child: InkWell(
                  onTap: profileViewModel!.isReadOnly
                      ? null
                      : () => openAgeDialog(context, controller),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 110.px),
                        child: AppText(
                          textAlign: TextAlign.center,
                          text: profileViewModel!.selectedAge != null
                              ? ' ${profileViewModel!.selectedAge}'
                              : AppStringConstants.age,
                          overflow: TextOverflow.ellipsis,
                          letterSpacing: -0.41.px,
                          fontFamily: AppTheme.poppins,
                          fontSize: 12.px,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontColor: BhajanColorConstant.black,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 15.px),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: BhajanColorConstant.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (profileViewModel!.ageError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.ageError),
            // if (profileViewModel!.countryError.isNotEmpty)
            //   ErrorText(errorText: profileViewModel!.countryError),
            // Padding(
            //   padding: EdgeInsets.all(7.px),
            //   child: InkWell(
            //     onTap: () {
            //       logs("age print");
            //       openAgeDialog(context, controller);
            //     },
            //     child: Container(
            //       alignment: Alignment.center,
            //       child: AppTextFormField(
            //         controller: profileViewModel!.fatherNameController,
            //         hint: AppStringConstants.age,
            //         fontSize: 15.px,
            //         isBorder: true,
            //         readOnly: true,
            //         suffixIcon: const Icon(
            //           Icons.keyboard_arrow_down_outlined,
            //           color: BhajanColorConstant.black,
            //         ),
            //         textAlign: TextAlign.center,
            //         contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
            //         fillColor: BhajanColorConstant.white,
            //         borderRadius: 20.px,
            //         borderColor: BhajanColorConstant.status,
            //         borderWidth: 2.px,
            //         hintFontSize: 14.px,
            //         fontColor: BhajanColorConstant.black,
            //         inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
            //         keyboardType: TextInputType.text,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10.px),
            Center(
              child: SizedBox(
                width: 298.px,
                height: 43.px,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 144.px,
                      height: 42.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: profileViewModel!.value == 0
                              ? BhajanColorConstant.primary
                              : BhajanColorConstant.white,
                          borderRadius: BorderRadius.circular(42.px),
                          border: Border.all(width: 2.px, color: BhajanColorConstant.white)),
                      child: TextButton.icon(
                        onPressed: profileViewModel!.isReadOnly
                            ? null
                            : () => profileViewModel!.updateGender(0),
                        icon: AppImageAsset(
                          image: BhajanAssets.male,
                          color: profileViewModel!.value == 0
                              ? BhajanColorConstant.white
                              : BhajanColorConstant.black,
                        ),
                        label: AppText(
                          text: AppStringConstants.male,
                          fontFamily: AppTheme.poppins,
                          letterSpacing: -0.41.px,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.px,
                          fontWeight: FontWeight.w500,
                          fontColor: profileViewModel!.value == 0
                              ? BhajanColorConstant.white
                              : BhajanColorConstant.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 137.px,
                      height: 42.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: profileViewModel!.value == 1
                              ? BhajanColorConstant.primary
                              : BhajanColorConstant.white,
                          borderRadius: BorderRadius.circular(42.px),
                          border: Border.all(width: 2.px, color: BhajanColorConstant.status)),
                      child: TextButton.icon(
                        onPressed: profileViewModel!.isReadOnly
                            ? null
                            : () => profileViewModel!.updateGender(1),
                        icon: AppImageAsset(
                          image: BhajanAssets.female,
                          color: profileViewModel!.value == 1
                              ? BhajanColorConstant.white
                              : BhajanColorConstant.black,
                        ),
                        label: AppText(
                          text: AppStringConstants.female,
                          fontFamily: AppTheme.poppins,
                          letterSpacing: -0.41.px,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w500,
                          fontColor: profileViewModel!.value == 1
                              ? BhajanColorConstant.white
                              : BhajanColorConstant.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.px),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.px),
                child: AppButton(
                  color: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.primary,
                  onTap: profileViewModel!.isReadOnly
                      ? null
                      : () => profileViewModel!.checkStepOneValidation(),
                  width: 265.px,
                  height: 45.px,
                  borderRadius: BorderRadius.circular(27.px),
                  text: AppStringConstants.nextSimple.tr.toUpperCase(),
                  fontFamily: AppTheme.poppins,
                  textAlign: TextAlign.center,
                  textColor: BhajanColorConstant.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.px,
                ),
              ),
            )
          ],
        ),
      ),
    );

Align otherFields(BuildContext context, ProfileController controller) => Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, left: 30.px, right: 30.px),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.center,
                child: AppTextFormField(
                  controller: profileViewModel!.societyNameController,
                  hint: AppStringConstants.societyName,
                  fontSize: 15.px,
                  isBorder: true,
                  textAlign: TextAlign.center,
                  autoFocus: profileViewModel!.isReadOnly ,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  fillColor: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.white,
                  readOnly: profileViewModel!.isReadOnly,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  borderWidth: 2.px,
                  hintFontSize: 12.px,
                  fontColor: BhajanColorConstant.black,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(RegExp('[a-z A-Z á-ú Á-Ú 0-9]')),
                  ],
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            Row(
              children: [
                // if (profileViewModel!.plotNoError.isNotEmpty)
                //   ErrorText(
                //     errorText: profileViewModel!.plotNoError,
                //   ),
                if (/*profileViewModel!.plotNoError.isEmpty &&*/
                profileViewModel!.socNameError.isNotEmpty)
                  ErrorText(errorText: profileViewModel!.socNameError),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.center,
                child: AppTextFormField(
                  controller: profileViewModel!.areaController,
                  hint: AppStringConstants.area,
                  fontSize: 15.px,
                  isBorder: true,
                  textAlign: TextAlign.center,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  fillColor: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.white,
                  readOnly: profileViewModel!.isReadOnly,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  borderWidth: 2.px,
                  hintFontSize: 12.px,
                  fontColor: BhajanColorConstant.black,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                  ],
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            Row(
              children: [
                if (profileViewModel!.areaError.isNotEmpty)
                  ErrorText(errorText: profileViewModel!.areaError),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 38.px,
                          decoration: BoxDecoration(
                              color: profileViewModel!.isReadOnly
                                  ? BhajanColorConstant.grey.withOpacity(0.1)
                                  : BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(42.px),
                              border: Border.all(width: 2.px, color: BhajanColorConstant.status)),
                          child: InkWell(
                            onTap: profileViewModel!.isReadOnly
                                ? () => openCountryDialog(context, controller)
                                : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(
                                  textAlign: TextAlign.center,
                                  text: profileViewModel!.selectedCountry != null
                                      ? '${profileViewModel!.selectedCountry!.countyName} '
                                          '(+${profileViewModel!.selectedCountry!.code})'
                                      : AppStringConstants.country,
                                  overflow: TextOverflow.ellipsis,
                                  letterSpacing: -0.41.px,
                                  fontFamily: AppTheme.poppins,
                                  fontSize: 12.px,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontColor: BhajanColorConstant.black,
                                ),
                                SizedBox(
                                  width: 3.px,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: BhajanColorConstant.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (profileViewModel!.countryError.isNotEmpty)
                          ErrorText(errorText: profileViewModel!.countryError),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 38.px,
                          alignment: Alignment.center,
                          width: 130.px,
                          decoration: BoxDecoration(
                              color: profileViewModel!.isReadOnly
                                  ? BhajanColorConstant.grey.withOpacity(0.1)
                                  : BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(42.px),
                              border: Border.all(color: BhajanColorConstant.status, width: 2.px)),
                          child: InkWell(
                            onTap: profileViewModel!.isReadOnly
                                ? () => openStateDialog(context, controller)
                                : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(
                                    text: profileViewModel!.selectedState != null
                                        ? ' ${profileViewModel!.selectedState!.stateName}'
                                        : AppStringConstants.state,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: AppTheme.poppins,
                                    letterSpacing: -0.41.px,
                                    fontSize: 12.px,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontColor: BhajanColorConstant.black),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: BhajanColorConstant.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (profileViewModel!.stateError.isNotEmpty)
                          ErrorText(errorText: profileViewModel!.stateError),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.45.px,
                      child: AppTextFormField(
                        controller: profileViewModel!.pinCodeController,
                        hint: AppStringConstants.pincode,
                        fontSize: 15.px,
                        isBorder: true,
                        textAlign: TextAlign.center,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                        fillColor: profileViewModel!.isReadOnly
                            ? BhajanColorConstant.grey.withOpacity(0.1)
                            : BhajanColorConstant.white,
                        readOnly: profileViewModel!.isReadOnly,
                        borderRadius: 20.px,
                        borderColor: BhajanColorConstant.status,
                        borderWidth: 2.px,
                        hintFontSize: 14.px,
                        fontColor: BhajanColorConstant.black,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 38.px,
                          alignment: Alignment.center,
                          width: 130.px,
                          decoration: BoxDecoration(
                              color: profileViewModel!.isReadOnly
                                  ? BhajanColorConstant.grey.withOpacity(0.1)
                                  : BhajanColorConstant.white,
                              borderRadius: BorderRadius.circular(42.px),
                              border: Border.all(color: BhajanColorConstant.status, width: 2.px)),
                          child: InkWell(
                            onTap: profileViewModel!.isReadOnly
                                ? () => openCityDialog(context, controller)
                                : null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(
                                    text: profileViewModel!.selectedCity != null
                                        ? ' ${profileViewModel!.selectedCity!.cityName}'
                                        : AppStringConstants.city,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: AppTheme.poppins,
                                    letterSpacing: -0.41.px,
                                    fontSize: 12.px,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontColor: BhajanColorConstant.black),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: BhajanColorConstant.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (profileViewModel!.cityError.isNotEmpty)
                          ErrorText(errorText: profileViewModel!.cityError),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (profileViewModel!.pinCodeError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.pinCodeError),
            Padding(
              padding: EdgeInsets.all(7.px),
              child: Container(
                alignment: Alignment.centerLeft,
                child: AppTextFormField(
                  controller: profileViewModel!.emailAddressController,
                  hint: AppStringConstants.emailAddress,
                  fontSize: 15.px,
                  isBorder: true,
                  textAlign: TextAlign.center,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                  fillColor: profileViewModel!.isReadOnly
                      ? BhajanColorConstant.grey.withOpacity(0.1)
                      : BhajanColorConstant.white,
                  readOnly: profileViewModel!.isReadOnly,
                  borderRadius: 20.px,
                  borderColor: BhajanColorConstant.status,
                  borderWidth: 2.px,
                  hintFontSize: 14.px,
                  fontColor: BhajanColorConstant.black,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            if (profileViewModel!.emailError.isNotEmpty)
              ErrorText(errorText: profileViewModel!.emailError),
            SizedBox(height: 10.px),
            Row(
              children: [
                if (profileViewModel!.isUserLogin && !profileViewModel!.profileStatus)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.px),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: BhajanColorConstant.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
                            minimumSize: Size(265.px, 45.px)),
                        onPressed: () => profileViewModel!.updateProfile(),
                        child: AppText(
                          text: AppStringConstants.skip.tr.toUpperCase(),
                          letterSpacing: 0.75,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.px,
                          fontWeight: FontWeight.w600,
                          fontColor: BhajanColorConstant.white,
                          fontFamily: AppTheme.poppins,
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  width: 10.px,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.px),
                    child: AppButton(
                      color: profileViewModel!.isReadOnly
                          ? BhajanColorConstant.primary.withOpacity(0.5)
                          : BhajanColorConstant.primary,
                      onTap: profileViewModel!.isReadOnly
                          ? null
                          : () => profileViewModel!.updateProfile(),
                      width: 265.px,
                      height: 45.px,
                      borderRadius: BorderRadius.circular(27.px),
                      text: AppStringConstants.submit.tr.toUpperCase(),
                      fontFamily: AppTheme.poppins,
                      textAlign: TextAlign.center,
                      textColor: BhajanColorConstant.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.px,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

openCountryDialog(BuildContext context, ProfileController controller) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<ProfileController>(
        builder: (ProfileController controller) {
          return Dialog(
              backgroundColor: BhajanColorConstant.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.px),
                      child: SizedBox(
                        height: 40.px,
                        child: AppTextFormField(
                          controller: profileViewModel!.countryController,
                          hint: AppStringConstants.searchCountry.tr,
                          fontSize: 15.px,
                          borderRadius: 25.px,
                          fillColor: BhajanColorConstant.transparent,
                          fontColor: BhajanColorConstant.white,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: BhajanColorConstant.white,
                          ),
                          autoFocus: false,
                          cursorColor: BhajanColorConstant.white,
                          borderColor: BhajanColorConstant.white,
                          onChanged: (value) {
                            profileViewModel!.updateCountry(value);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: profileViewModel!.searchCountryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  profileViewModel!
                                      .setCountry(profileViewModel!.searchCountryList[index]);
                                  gotoBack();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.px),
                                  width: 200.px,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: BhajanColorConstant.underline)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: AppText(
                                              text:
                                                  '${profileViewModel!.searchCountryList[index].countyName} ',
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppTheme.lato,
                                              letterSpacing: 0.75,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20.px,
                                              fontWeight: FontWeight.w500,
                                              fontColor: BhajanColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                );
              }));
        },
      );
    });

openStateDialog(BuildContext context, ProfileController controller) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<ProfileController>(
        builder: (ProfileController controller) {
          return Dialog(
              backgroundColor: BhajanColorConstant.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.px),
                      child: SizedBox(
                        height: 40.px,
                        child: AppTextFormField(
                          hint: AppStringConstants.searchState.tr,
                          fontSize: 15.px,
                          onChanged: (value) {
                            profileViewModel!.updateState(value);
                          },
                          autoFocus: false,
                          fontColor: BhajanColorConstant.white,
                          controller: profileViewModel!.stateController,
                          cursorColor: BhajanColorConstant.white,
                          borderColor: BhajanColorConstant.white,
                          fillColor: BhajanColorConstant.transparent,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: BhajanColorConstant.white,
                          ),
                          borderRadius: 25.px,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: profileViewModel!.searchStateList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  profileViewModel!
                                      .setStateList(profileViewModel!.searchStateList[index]);
                                  gotoBack();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.px),
                                  width: 200.px,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: BhajanColorConstant.underline)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: AppText(
                                              text:
                                                  ' ${profileViewModel!.searchStateList[index].stateName}',
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppTheme.lato,
                                              letterSpacing: 0.75,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              fontColor: BhajanColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                );
              }));
        },
      );
    });

openCityDialog(BuildContext context, ProfileController controller) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<ProfileController>(
        builder: (ProfileController controller) {
          return Dialog(
              backgroundColor: BhajanColorConstant.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.px),
                      child: SizedBox(
                        height: 40.px,
                        child: AppTextFormField(
                          controller: profileViewModel!.cityController,
                          hint: AppStringConstants.searchCity.tr,
                          fontSize: 15.px,
                          onChanged: (value) {
                            profileViewModel!.updateCity(value);
                          },
                          autoFocus: false,
                          fontColor: BhajanColorConstant.white,
                          cursorColor: BhajanColorConstant.white,
                          borderRadius: 25.px,
                          borderColor: BhajanColorConstant.white,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: BhajanColorConstant.white,
                          ),
                          fillColor: BhajanColorConstant.transparent,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: profileViewModel!.searchCity.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  profileViewModel!.setCity(profileViewModel!.searchCity[index]);
                                  gotoBack();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  width: 200,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: BhajanColorConstant.underline)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: AppText(
                                              text: profileViewModel!.searchCity[index].cityName,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppTheme.lato,
                                              letterSpacing: 0.75,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20.px,
                                              fontWeight: FontWeight.w500,
                                              fontColor: BhajanColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                );
              }));
        },
      );
    });

openAgeDialog(BuildContext context, ProfileController controller) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<ProfileController>(
        builder: (ProfileController controller) {
          return Dialog(
              backgroundColor: BhajanColorConstant.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.px),
                      child: SizedBox(
                        height: 40.px,
                        child: AppTextFormField(
                          hint: AppStringConstants.searchAge.tr,
                          fontSize: 15.px,
                          onChanged: (value) {
                            profileViewModel!.updateAge(value);
                          },
                          autoFocus: false,
                          fontColor: BhajanColorConstant.white,
                          controller: profileViewModel!.ageController,
                          cursorColor: BhajanColorConstant.white,
                          borderColor: BhajanColorConstant.white,
                          fillColor: BhajanColorConstant.transparent,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: BhajanColorConstant.white,
                          ),
                          borderRadius: 25.px,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: profileViewModel!.searchAge.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  profileViewModel!.selectAge(profileViewModel!.searchAge[index]);
                                  gotoBack();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.px),
                                  width: 200.px,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: BhajanColorConstant.underline)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: AppText(
                                              text: ' ${profileViewModel!.searchAge[index]}',
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppTheme.lato,
                                              letterSpacing: 0.75,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              fontColor: BhajanColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                );
              }));
        },
      );
    });

Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();
