import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_error_text.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_text_form_field.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../app/widgets/bhajan_loader.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/niyam_controller.dart';
import '../../../routes/app_navigation.dart';
import 'nitya_bhajan_page.dart';

Column nityaBhajanChildView(BuildContext context) => Column(
      children: [
        const SizedBox(height: 40),
        buildDialogView(context),
        const SizedBox(height: 30),
        buildTextEditingView(),
        const SizedBox(height: 15),
        buildRajatJayantiTargetView(),
        buildTotalTargetView(),
        const SizedBox(height: 15),
        buildGoodIdeaView(),
        const SizedBox(height: 20),
        rajatJayantiContent(),
        const SizedBox(height: 35),
        buildSaveButtonView(),
      ],
    );

Stack buildDialogView(BuildContext context) => Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 45.px,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMeaningView(context),
            buildTheGloryView(context),
            buildHistoryView(context),
          ],
        ),
      ),
      Container(
        width: 301.px,
        height: 189.56.px,
        margin: const EdgeInsets.only(bottom: 35),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: BhajanColorConstant.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(5.px)),
        ),
        child: nityaBhajanViewModel!
            .subCategoryInfoList != null ? nityaBhajanViewModel!
                .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].mainImage.isEmpty
            ? AppImageAsset(
                image: nityaBhajanViewModel!
                    .subCategoryInfoList != null ? nityaBhajanViewModel!
                    .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].mainImage : '',
                webFit: BoxFit.contain,
              )
            : const AppImageAsset(
                image: BhajanAssets.gifiImage,
                fit: BoxFit.contain,
              ) : const SizedBox(),
      ),
    ]);

InkWell buildMeaningView(BuildContext context) => InkWell(
      onTap: () {
        showMeaningDialog(context);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        width: 87,
        height: 40,
        decoration: BoxDecoration(
            color: BhajanColorConstant.darkRed,
            borderRadius: BorderRadius.circular(7.px),
            border: Border.all(color: BhajanColorConstant.offRed)),
        child: AppText(
          text: AppStringConstants.meaning,
          letterSpacing: 0.25.px,
          fontStyle: FontStyle.normal,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontColor: BhajanColorConstant.offRed,
        ),
      ),
    );

Future<void> showMeaningDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BhajanColorConstant.darkRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.px),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              Container(
                alignment: Alignment.center,
                width: 140.px,
                height: 40.px,
                decoration: BoxDecoration(
                    color: BhajanColorConstant.darkRed,
                    borderRadius: BorderRadius.circular(8.px),
                    border: Border.all(color: BhajanColorConstant.offRed, width: 1.px)),
                child: AppText(
                  text: AppStringConstants.meaning,
                  letterSpacing: 0.75,
                  fontStyle: FontStyle.normal,
                  fontSize: 24.px,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.offRed,
                  fontFamily: AppTheme.poppins,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => gotoBack(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  child: CircleAvatar(
                    radius: 12.px,
                    backgroundColor: BhajanColorConstant.black,
                    child: Icon(
                      Icons.close,
                      color: BhajanColorConstant.white,
                      size: 18.px,
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              child: HtmlText(
                text:nityaBhajanViewModel!
                    .subCategoryInfoList != null ?
                    nityaBhajanViewModel!.subCategoryInfoList!.first.niyamMeaning!.meaning.toString() : '',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );

InkWell buildTheGloryView(BuildContext context) => InkWell(
      onTap: () => showTheGloryDialog(context),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        width: 87.px,
        height: 40.px,
        decoration: BoxDecoration(
            color: BhajanColorConstant.darkGolden,
            borderRadius: BorderRadius.circular(7.px),
            border: Border.all(color: BhajanColorConstant.offGolden)),
        child: AppText(
          text: AppStringConstants.theGlory,
          letterSpacing: 0.25.px,
          fontStyle: FontStyle.normal,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontColor: BhajanColorConstant.offGolden,
        ),
      ),
    );

Future<void> showTheGloryDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BhajanColorConstant.darkGolden,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: 140.px,
                height: 40.px,
                decoration: BoxDecoration(
                    color: BhajanColorConstant.darkGolden,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: BhajanColorConstant.offGolden, width: 1.0)),
                child: AppText(
                  text: AppStringConstants.theGlory,
                  letterSpacing: 0.75,
                  fontStyle: FontStyle.normal,
                  fontSize: 24.px,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.offGolden,
                  fontFamily: AppTheme.poppins,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => gotoBack(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  child: CircleAvatar(
                    radius: 12.px,
                    backgroundColor: BhajanColorConstant.black,
                    child: Icon(
                      Icons.close,
                      color: BhajanColorConstant.white,
                      size: 18.px,
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              child: HtmlText(
                text:nityaBhajanViewModel!
                    .subCategoryInfoList != null ?
                    nityaBhajanViewModel!.subCategoryInfoList!.first.niyamMeaning!.meaning.toString() : '',
                fontSize: 16.px,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );

InkWell buildHistoryView(BuildContext context) => InkWell(
      onTap: () => showHistoryDialog(context),
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10.px),
          width: 87.px,
          height: 40.px,
          decoration: BoxDecoration(
              color: BhajanColorConstant.offPink,
              borderRadius: BorderRadius.circular(7.px),
              border: Border.all(color: BhajanColorConstant.darkPink)),
          child: AppText(
            text: AppStringConstants.history,
            fontSize: 17.px,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            letterSpacing: 0.25.px,
            fontColor: BhajanColorConstant.darkPink,
          )),
    );

Future<void> showHistoryDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BhajanColorConstant.offPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.px),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              Container(
                alignment: Alignment.center,
                width: 140.px,
                height: 40.px,
                decoration: BoxDecoration(
                    color: BhajanColorConstant.offPink,
                    borderRadius: BorderRadius.circular(8.px),
                    border: Border.all(color: BhajanColorConstant.darkPink, width: 1.0)),
                child: AppText(
                  text: AppStringConstants.history,
                  letterSpacing: 0.75,
                  fontStyle: FontStyle.normal,
                  fontSize: 24.px,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.darkPink,
                  fontFamily: AppTheme.poppins,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => gotoBack(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 30.px,
                  ),
                  child: CircleAvatar(
                    radius: 12.px,
                    backgroundColor: BhajanColorConstant.black,
                    child: Icon(
                      Icons.close,
                      color: BhajanColorConstant.white,
                      size: 18.px,
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              text:nityaBhajanViewModel!
                  .subCategoryInfoList != null ? nityaBhajanViewModel!.subCategoryInfoList!.first.niyamMeaning!.meaning : '',
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
            )),
          ),
        );
      },
    );

Column buildTextEditingView() => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 170.px,
          child: Column(
            children: [
              AppText(
                text: nityaBhajanViewModel!
                    .subCategoryInfoList != null ? nityaBhajanViewModel!
                    .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].targetInputTitle : '',
                letterSpacing: 0.75.px,
                fontSize: 11.px,
                fontColor: BhajanColorConstant.black,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              Column(
                children: [
                  Container(
                    height: 40.px,
                    decoration: BoxDecoration(
                        color: BhajanColorConstant.offBlack,
                        borderRadius: BorderRadius.circular(8.px)),
                    child: AppTextFormField(
                      controller: nityaBhajanViewModel!.dailyTarget,
                      fontColor: BhajanColorConstant.black,
                      fontSize: 20.px,
                      cursorWidth: 2.px,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                      ],
                      textInputAction: TextInputAction.done,
                      fillColor: BhajanColorConstant.offBlack,
                      fontWeight: FontWeight.w600,
                      contentPadding: EdgeInsets.symmetric(vertical: 6.px, horizontal: 8.px),
                      suffixIcon: const AppImageAsset(
                        image: BhajanAssets.editPen,
                      ),
                      cursorColor: BhajanColorConstant.primary,
                      onChanged: (value) => nityaBhajanViewModel!.updateTextFieldValue(value),
                      keyboardType: TextInputType.number,
                      isDecoration: true,
                      textAlign: TextAlign.center,
                      hint: '',
                    ),
                  ),
                  if (nityaBhajanViewModel!
                      .subCategoryInfoList != null && nityaBhajanViewModel!.dailyTargetError.isNotEmpty)
                    ErrorText(errorText: nityaBhajanViewModel!
                        .subCategoryInfoList != null ? nityaBhajanViewModel!.dailyTargetError : ''),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 170.px,
          child: Column(
            children: [
              AppText(
                text: nityaBhajanViewModel!
                    .subCategoryInfoList != null ? nityaBhajanViewModel!
                    .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].totalInputTitle : '',
                maxLines: 2,
                letterSpacing: 0.75.px,
                fontSize: 11.px,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.black,
              ),
              GetBuilder<NiyamController>(builder: (context) {
                return Container(
                  height: 40.px,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: BhajanColorConstant.offBlack,
                      borderRadius: BorderRadius.circular(8.px)),
                  child: AppText(
                    text: nityaBhajanViewModel!.totalValueTarget,
                    letterSpacing: 0.75,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.px,
                    fontWeight: FontWeight.w900,
                    fontColor: BhajanColorConstant.black,
                    fontFamily: AppTheme.lato,
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );

Row buildRajatJayantiTargetView() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImageAsset(
          image: BhajanAssets.target,
          width: 25.px,
          height: 25.px,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 5),
        Container(
          padding: EdgeInsets.only(top: 6.px),
          child: AppText(
            text: AppStringConstants.sadgranthTarget(nityaBhajanViewModel!
                .subCategoryInfoList != null ? nityaBhajanViewModel!
                .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].targetDate : ''),
            letterSpacing: 0.75.px,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            fontColor: BhajanColorConstant.primary,
          ),
        ),
        const SizedBox(width: 5),
        AppImageAsset(image: BhajanAssets.target, width: 25.px, height: 25.px, fit: BoxFit.fill),
      ],
    );

AppText buildTotalTargetView() => AppText(
      text: nityaBhajanViewModel!
          .subCategoryInfoList != null ? nityaBhajanViewModel!
          .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].totalTarget
          .toString() : '',
      textAlign: TextAlign.center,
      letterSpacing: 0.75.px,
      fontSize: 30.px,
      fontFamily: AppTheme.lato,
      fontWeight: FontWeight.w900,
      fontColor: BhajanColorConstant.black,
      fontStyle: FontStyle.normal,
    );

buildGoodIdeaView() => Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 8.px),
        decoration: BoxDecoration(
          color: BhajanColorConstant.lightBlue,
          borderRadius: BorderRadius.circular(10.px),
        ),
        child: SizedBox(
            width: 250.px,
            height: 58.px,
            child: HtmlText(
              text: nityaBhajanViewModel!
                  .subCategoryInfoList != null ? nityaBhajanViewModel!
                  .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].mainDescription : '',
              fontSize: 14.px,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            )),
      ),
    );

Container rajatJayantiContent() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: AppText(
        text: AppStringConstants.addMalaDesc.tr,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        letterSpacing: 0.75.px,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontColor: BhajanColorConstant.red,
        fontSize: 20.px,
        maxLines: 2,
      ),
    );

Padding buildSaveButtonView() => Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AppButton(
        width: 185.px,
        onTap: () => nityaBhajanViewModel!.saveNiyamHistory(),
        text: AppStringConstants.save.tr.toUpperCase(),
      ),
    );

Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();