import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/widgets/app_button.dart';
import '../../../../app/widgets/app_image_asset.dart';
import '../../../../app/widgets/app_text.dart';
import '../../../../app/widgets/app_text_form_field.dart';
import '../../../../app/widgets/app_theme.dart';
import '../../../../constant/bhajan_assets.dart';
import '../../../../constant/color_constant.dart';
import '../../../../constant/string_constant.dart';
import '../../../../routes/app_navigation.dart';
import '../../../niyam_module/edit_niyam/edit_niyam_sadgranth_anusthan/edit_niyam_sadgranth_anusthan_page.dart';

Widget editSadgranthAnusthanBodyView(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        buildSadgranthVanchanTitleFirst(),
        buildSadgranthVanchanTitleSecond(),
        const SizedBox(height: 10),
        buildImageGridView(context),
      ],
    );

Center buildSadgranthVanchanTitleFirst() => Center(
        child: AppText(
      text: AppStringConstants.sadgranthTarget(editNiyamSadgranthAnusthanViewModel!
          .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].targetDate),
      fontSize: 14.px,
      fontWeight: FontWeight.w400,
      fontColor: BhajanColorConstant.primary,
      letterSpacing: 0.75.px,
    ));

Widget buildSadgranthVanchanTitleSecond() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: AppStringConstants.sadgranthPathCountOne,
          fontSize: 13.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75.px,
          fontColor: BhajanColorConstant.black,
        ),
        const AppImageAsset(
          image: BhajanAssets.blackEdit,
          fit: BoxFit.fill,
        ),
        AppText(
          text: AppStringConstants.sadgranthPathCountTwo,
          fontSize: 13.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75.px,
          fontColor: BhajanColorConstant.black,
        ),
      ],
    );

Widget buildImageGridView(BuildContext context) => Center(
      child: Column(
        children: [
          SizedBox(
            width: 185.px,
            height: 140.px,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.px),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildMeaningView(context),
                        const SizedBox(height: 5),
                        buildTheGloryView(context),
                        const SizedBox(height: 5),
                        buildHistoryView(context),
                      ],
                    ),
                  ),
                ),
                buildImageBgColorBoxView(),
                buildEditSadgranthImageView(),
              ],
            ),
          ),
          buildTotalLessonView(),
        ],
      ),
    );

Padding buildImageBgColorBoxView() => Padding(
      padding: EdgeInsets.only(left: 30.px),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 105.px,
          height: 116.px,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: BhajanColorConstant.gray,
                  blurRadius: 10.px,
                ),
              ],
              border: Border.all(
                color: BhajanColorConstant.hex(editNiyamSadgranthAnusthanViewModel!
                    .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex]
                    .bkColor),
                width: 2.px,
              ),
              color: BhajanColorConstant.hex(editNiyamSadgranthAnusthanViewModel!
                      .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex]
                      .bkColor)
                  .withOpacity(0.75),
              borderRadius: BorderRadius.circular(10.px)),
        ),
      ),
    );

Widget buildEditSadgranthImageView() => Padding(
      padding: EdgeInsets.only(bottom: 25.px, left: 20.px),
      child: Align(
        alignment: Alignment.center,
        child: AppImageAsset(
            webFit: BoxFit.fill,
            isWebImage: true,
            webWidth: 100.px,
            webHeight: 140.px,
            image: editNiyamSadgranthAnusthanViewModel!
                .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].mainImage),
      ),
    );

Container buildTotalLessonView() => Container(
      alignment: Alignment.center,
      width: 185.px,
      child: Padding(
        padding: EdgeInsets.only(left: 35.px),
        child: Column(
          children: [
            HtmlText(
              textAlign: TextAlign.center,
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text:
                  '${editNiyamSadgranthAnusthanViewModel!.selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].totalInputTitle}  '
                  ': ${editNiyamSadgranthAnusthanViewModel!.selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].totalTarget}',
              fontColor: BhajanColorConstant.hex(editNiyamSadgranthAnusthanViewModel!
                      .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex]
                      .bkColor)
                  .withOpacity(0.75),
            ),
            Container(
              alignment: Alignment.center,
              width: 80.px,
              child: Form(
                child: AppTextFormField(
                  controller: editNiyamSadgranthAnusthanViewModel!.dailyTarget,
                  onChanged: (value) => editNiyamSadgranthAnusthanViewModel!
                      .updateDailyControllerValue(
                          value, editNiyamSadgranthAnusthanViewModel!.selectedIndex),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  contentPadding: EdgeInsets.zero,
                  cursorColor: BhajanColorConstant.blackGrey,
                  keyboardType: TextInputType.number,
                  letterSpacing: 0.75,
                  fontSize: 16.px,
                  suffixIcon: const AppImageAsset(
                    image: BhajanAssets.editBorder,
                    color: BhajanColorConstant.black,
                  ),
                  fontWeight: FontWeight.w900,
                  fontColor: BhajanColorConstant.black,
                  fontFamily: AppTheme.lato,
                  textAlign: TextAlign.center,
                  isDecoration: false,
                  hint: '',
                ),
              ),
            ),
          ],
        ),
      ),
    );

InkWell buildMeaningView(BuildContext context) => InkWell(
      onTap: () => showMeaningDialog(context),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15.px),
        width: 61.px,
        height: 18.px,
        decoration: BoxDecoration(
            color: BhajanColorConstant.hex(editNiyamSadgranthAnusthanViewModel!
                .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].bkColor),
            borderRadius: BorderRadius.circular(40.px)),
        child: AppText(
          text: AppStringConstants.meaning,
          fontSize: 10.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25.px,
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
                  fontSize: 11.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.offRed,
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
            width: Device.width,
            height: Device.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text:
                  editNiyamSadgranthAnusthanViewModel!.selectNiyamInfoList[1].niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

InkWell buildTheGloryView(BuildContext context) => InkWell(
      onTap: () => showTheGloryDialog(context),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 13.px),
        width: 61.px,
        height: 18.px,
        decoration: BoxDecoration(
            color: BhajanColorConstant.hex(editNiyamSadgranthAnusthanViewModel!
                .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].bkColor),
            borderRadius: BorderRadius.circular(40.px)),
        child: AppText(
          text: AppStringConstants.theGlory,
          fontSize: 10.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25.px,
        ),
      ),
    );

Future<void> showTheGloryDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BhajanColorConstant.darkGolden,
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
                    color: BhajanColorConstant.darkGolden,
                    borderRadius: BorderRadius.circular(8.px),
                    border: Border.all(color: BhajanColorConstant.offGolden, width: 1.px)),
                child: AppText(
                    text: AppStringConstants.theGlory,
                    fontFamily: AppTheme.poppins,
                    letterSpacing: 0.75,
                    fontStyle: FontStyle.normal,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w700,
                    fontColor: BhajanColorConstant.offGolden),
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
            width: Device.width,
            height: Device.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text:
                  editNiyamSadgranthAnusthanViewModel!.selectNiyamInfoList[0].niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

InkWell buildHistoryView(BuildContext context) => InkWell(
      onTap: () => showHistoryDialog(context),
      child: Container(
        padding: EdgeInsets.only(left: 8.px),
        width: 61.px,
        height: 18.px,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: BhajanColorConstant.hex(editNiyamSadgranthAnusthanViewModel!
                .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex].bkColor),
            borderRadius: BorderRadius.circular(40.px)),
        child: AppText(
          text: AppStringConstants.history,
          fontSize: 10.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25.px,
        ),
      ),
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
                    border: Border.all(color: BhajanColorConstant.darkPink, width: 1.px)),
                child: AppText(
                    text: AppStringConstants.history,
                    fontFamily: AppTheme.poppins,
                    letterSpacing: 0.75,
                    fontStyle: FontStyle.normal,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w700,
                    fontColor: BhajanColorConstant.darkPink),
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
            width: Device.width,
            height: Device.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text:
                  editNiyamSadgranthAnusthanViewModel!.selectNiyamInfoList[0].niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

Container floatingActionButton() => Container(
      height: 39.px,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.px),
          color: Colors.white38.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 60.px,
              spreadRadius: 60.0,
              offset: const Offset(2.0, 2.0), // shadow direction: bottom right
            ),
          ]),
      child: AppButton(
        width: 185.px,
        onTap: () {
          editNiyamSadgranthAnusthanViewModel!.saveNiyamHistory();
        },
        text: AppStringConstants.save.tr.toUpperCase(),
      ),
    );
