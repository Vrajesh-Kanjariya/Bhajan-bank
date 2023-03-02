import 'dart:ui';

import 'package:bank/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_alert_box.dart';
import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_fixed_cross_axis_count_and_height.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_text_form_field.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../app/widgets/bhajan_loader.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../routes/app_navigation.dart';
import '../select_niyams/select_niyam_page.dart';
import 'sadgranth_anusthan_page.dart';

sadgranthAnusthanBodyView(bool isLoading, BuildContext context, int subIndex) =>
    niyamViewModel!.subCategoryInfoList.isEmpty
        ? Center(
            child: AppText(
            text: AppStringConstants.noDataFound.tr,
            letterSpacing: 0.75,
            fontStyle: FontStyle.normal,
            fontSize: 22.px,
            fontWeight: FontWeight.w700,
            fontColor: BhajanColorConstant.red,
            fontFamily: AppTheme.poppins,
          ))
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.px),
              //  buildSadgranthTitleSecond(),
              // SizedBox(height: 15.px),
              buildImageGridView(context, subIndex),
              // SizedBox(height: 10.px),
            ],
          );

Row buildSadgranthTitleSecond() => Row(
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
        AppImageAsset(
          image: BhajanAssets.bookEdit,
          fit: BoxFit.fill,
          height: 12.px,
          width: 12.px,
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

Expanded buildGridView() => Expanded(
    child: GridView.builder(
        padding: EdgeInsets.only(left: 15.px, right: 15.px, bottom: 15.px),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 1,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 3.0,
          height: 205.px,
        ),
        itemCount: niyamViewModel!.subCategoryInfoList[1].subcategoryList.length,
        itemBuilder: (BuildContext context, int subIndex) {
          return buildImageGridView(context, subIndex);
        }));

Column buildImageGridView(BuildContext context, int subIndex) => Column(
      children: [
        buildSadgranthView(context, subIndex),
      ],
    );

Widget buildSadgranthView(BuildContext context, int subIndex) => Padding(
      padding: EdgeInsets.only(left: 15.px, right: 15.px, bottom: 15.px),
      child: Container(
        height: 183.px,
        width: 347.px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(width: 2.px, color: BhajanColorConstant.purple)),
        child: Row(
          children: [
            Stack(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppImageAsset(
                      image: BhajanAssets.rectangleImage, color: BhajanColorConstant.purple),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45.px),
                  child: AppText(
                    text: AppStringConstants.occasionOfFestival.tr,
                    fontSize: 12.px,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontColor: BhajanColorConstant.black,
                  ),
                ),
                buildSadgranthImageView(subIndex),
                Positioned(
                    left: 0,
                    right: 20,
                    bottom: 0,
                    child: Column(
                      children: [
                        targetDateText(subIndex),
                        htmlText(subIndex),
                      ],
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5.px, top: 15.px),
                  child: Column(
                    children: [
                      buildMeaningView(context, subIndex),
                      SizedBox(height: 7.px),
                      buildTheGloryView(context, subIndex),
                      SizedBox(height: 7.px),
                      buildHistoryView(context, subIndex),
                      SizedBox(height: 18.px),
                    ],
                  ),
                ),
                buildTotalAddView(context, subIndex),
                //  buildTotalLessonView(index),
              ],
            )
          ],
        ),
      ),
    );

Padding buildSadgranthImageView(int subIndex) => Padding(
      padding: EdgeInsets.only(bottom: 25.px, left: 20.px),
      child: Align(
        alignment: Alignment.center,
        child: AppImageAsset(
            webFit: BoxFit.fill,
            isWebImage: true,
            webWidth: 93.px,
            webHeight: 115.px,
            image: niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].mainImage),
      ),
    );

Widget targetDateText(int subIndex) => AppText(
      textAlign: TextAlign.center,
      text: '${niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].targetDate} સુધીનો લક્ષ્ય',
      fontSize: 12.px,
      fontWeight: FontWeight.w500,
      fontColor: BhajanColorConstant.textRed,
    );

SizedBox htmlText(int subIndex) => SizedBox(
      height: 26.px,
      width: 140.px,
      child: AppText(
        textAlign: TextAlign.center,
        fontSize: 19.px,
        fontWeight: FontWeight.w600,
        text: '${niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].totalInputTitle}  '
            ': ${niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].totalTarget}',
        fontColor: BhajanColorConstant.black,
      ),
    );

Widget buildTotalAddView(BuildContext context, int index) => InkWell(
      onTap: () {
        yourTargetAlertBox(context, index);
      },
      child: Container(
        height: 35.px,
        width: 135.px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.px),
            border: Border.all(color: BhajanColorConstant.purple, width: 2.px)),
        child: Center(
          child: AppText(
            textAlign: TextAlign.center,
            text: "Add Your Target",
            fontSize: 16.px,
            fontWeight: FontWeight.w500,
            fontColor: BhajanColorConstant.black,
          ),
        ),
      ),
    );

Container buildTotalLessonView(int subIndex) => Container(
      alignment: Alignment.center,
      width: 160.px,
      child: Form(
        child: AppTextFormField(
          controller: niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].dailyTargetController,
          onChanged: (value) => niyamViewModel!.updateDailyControllerValue(value, subIndex),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          contentPadding: EdgeInsets.all(8.px),
          cursorColor: BhajanColorConstant.blackGrey,
          keyboardType: TextInputType.number,
          letterSpacing: -0.41.px,
          fontSize: 16.px,
          textInputAction: TextInputAction.done,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.px),
            child: AppImageAsset(
              image: BhajanAssets.profileEditBlack,
              height: 14.px,
              width: 14.px,
            ),
          ),
          iconWidth: 20.px,
          borderColor: BhajanColorConstant.gray,
          borderWidth: 2.px,
          borderRadius: 8.px,
          fontWeight: FontWeight.w500,
          fontColor: BhajanColorConstant.grey,
          fontFamily: AppTheme.poppins,
          textAlign: TextAlign.center,
          hint: AppStringConstants.yourActivity.tr,
          hintFontSize: 16.px,
        ),
      ),
    );

InkWell buildMeaningView(BuildContext context, int subIndex) => InkWell(
      onTap: () => showMeaningDialog(context),
      child: Container(
        alignment: Alignment.center,
        width: 110.px,
        height: 28.px,
        decoration: BoxDecoration(
            color: BhajanColorConstant.purple, borderRadius: BorderRadius.circular(34.px)),
        child: AppText(
          text: AppStringConstants.meaning,
          fontSize: 16.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75.px,
          fontColor: BhajanColorConstant.black,
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
              SizedBox(width: 30.px),
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text: niyamViewModel!.subCategoryList[1].niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

InkWell buildTheGloryView(BuildContext context, int index) => InkWell(
      onTap: () => showTheGloryDialog(context),
      child: Container(
        width: 110.px,
        height: 28.px,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: BhajanColorConstant.purple, borderRadius: BorderRadius.circular(34.px)),
        child: AppText(
          text: AppStringConstants.theGlory,
          fontSize: 16.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75.px,
          fontColor: BhajanColorConstant.black,
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text: niyamViewModel!.subCategoryList.first.niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

InkWell buildHistoryView(BuildContext context, int index) => InkWell(
      onTap: () => showHistoryDialog(context),
      child: Container(
        width: 110.px,
        height: 28.px,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: BhajanColorConstant.purple, borderRadius: BorderRadius.circular(34.px)),
        child: AppText(
          text: AppStringConstants.history,
          fontSize: 16.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75.px,
          fontColor: BhajanColorConstant.black,
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              text: niyamViewModel!.subCategoryList.first.niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

Future<void> yourTargetAlertBox(BuildContext context, int index) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialogBox(
            setText: true,
            titleText: niyamViewModel!.subCategoryInfoList[1].subcategoryList[index].subCatName,
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.px,
                ),
                Container(
                  width: 249,
                  height: 2,
                  color: BhajanColorConstant.gray,
                ),
                SizedBox(
                  height: 15.px,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25.px, bottom: 25.px),
                      child: AppText(
                        text: '${AppStringConstants.note.tr}:',
                        fontSize: 16.px,
                        fontFamily: AppTheme.poppins,
                        fontStyle: FontStyle.normal,
                        fontColor: BhajanColorConstant.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 200.px,
                      child: AppText(
                        text: niyamViewModel!.subCategoryInfoList[1].subcategoryList[index].noteApp,
                        fontSize: 14.px,
                        fontFamily: AppTheme.poppins,
                        fontStyle: FontStyle.normal,
                        textAlign: TextAlign.center,
                        fontColor: BhajanColorConstant.black,
                        fontWeight: FontWeight.w400,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.px,
                ),
                buildTotalLessonView(index),
                SizedBox(
                  height: 15.px,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                            color: BhajanColorConstant.primary,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.px))),
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              gotoBack();
                            },
                            child: AppText(
                                text: AppStringConstants.back.tr,
                                textAlign: TextAlign.center,
                                fontStyle: FontStyle.normal,
                                fontSize: 19.px,
                                fontWeight: FontWeight.w600,
                                fontColor: BhajanColorConstant.white)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                            color: BhajanColorConstant.red,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.px))),
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              if (niyamViewModel!.subCategoryInfoList[1].subcategoryList[index].dailyTargetController!.text.isNotEmpty) {
                                niyamViewModel!.saveAnushthasanBook();
                              } else {
                                errorToast("Enter Your Target");
                              }
                            },
                            child: AppText(
                                text: AppStringConstants.save.tr,
                                textAlign: TextAlign.center,
                                fontStyle: FontStyle.normal,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                fontColor: BhajanColorConstant.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

Container floatingActionButton() => Container(
      height: 39,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white38.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 60.0,
              spreadRadius: 60.0,
              offset: const Offset(2.0, 2.0), // shadow direction: bottom right
            ),
          ]),
      child: AppButton(
        width: 185.px,
        onTap: () {
          sadgranthAnusthanViewModel!.saveNiyamHistory();
        },
        text: AppStringConstants.save.tr.toUpperCase(),
      ),
    );

Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();


Widget sadgranthanusthsanBodyuView() => ListView.builder(
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 15.px),
  physics: const BouncingScrollPhysics(),
  itemCount: niyamViewModel!.subCategoryInfoList[1].subcategoryList.length,
  itemBuilder: (context, subIndex) {
    return Padding(
      padding: EdgeInsets.only(left: 15.px, right: 15.px, bottom: 15.px),
      child: Container(
        height: 183.px,
        width: 347.px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(width: 2.px, color: BhajanColorConstant.purple)),
        child: Row(
          children: [
            Stack(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppImageAsset(
                      image: BhajanAssets.rectangleImage,
                      color: BhajanColorConstant.purple),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45.px),
                  child: AppText(
                    text: AppStringConstants.occasionOfFestival.tr,
                    fontSize: 12.px,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontColor: BhajanColorConstant.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.px, left: 20.px),
                  child: Align(
                    alignment: Alignment.center,
                    child: AppImageAsset(
                        webFit: BoxFit.fill,
                        isWebImage: true,
                        webWidth: 93.px,
                        webHeight: 115.px,
                        image: niyamViewModel!.subCategoryInfoList[1]
                            .subcategoryList[subIndex].mainImage),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 20,
                    bottom: 0,
                    child: Column(
                      children: [
                        AppText(
                          textAlign: TextAlign.center,
                          text:
                          '${niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].targetDate} સુધીનો લક્ષ્ય',
                          fontSize: 12.px,
                          fontWeight: FontWeight.w500,
                          fontColor: BhajanColorConstant.textRed,
                        ),
                        AppText(
                          textAlign: TextAlign.center,
                          fontSize: 19.px,
                          fontWeight: FontWeight.w600,
                          text:
                          '${niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].totalInputTitle}  '
                              ': ${niyamViewModel!.subCategoryInfoList[1].subcategoryList[subIndex].totalTarget}',
                          fontColor: BhajanColorConstant.black,
                        ),
                      ],
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5.px, top: 15.px),
                  child: Column(
                    children: [
                      InkWell(
                         onTap: () => showMeaningDialog(context),
                        child: Container(
                          alignment: Alignment.center,
                          width: 110.px,
                          height: 28.px,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.purple,
                              borderRadius: BorderRadius.circular(34.px)),
                          child: AppText(
                            text: AppStringConstants.meaning,
                            fontSize: 16.px,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.75.px,
                            fontColor: BhajanColorConstant.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.px),
                      InkWell(
                         onTap: () => showTheGloryDialog(context),
                        child: Container(
                          width: 110.px,
                          height: 28.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.purple,
                              borderRadius: BorderRadius.circular(34.px)),
                          child: AppText(
                            text: AppStringConstants.theGlory,
                            fontSize: 16.px,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.75.px,
                            fontColor: BhajanColorConstant.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.px),
                      InkWell(
                          onTap: () => showHistoryDialog(context),
                        child: Container(
                          width: 110.px,
                          height: 28.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.purple,
                              borderRadius: BorderRadius.circular(34.px)),
                          child: AppText(
                            text: AppStringConstants.history,
                            fontSize: 16.px,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.75.px,
                            fontColor: BhajanColorConstant.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.px),
                    ],
                  ),
                ),
                buildTotalAddView(context, subIndex),
                //  buildTotalLessonView(index),
              ],
            )
          ],
        ),
      ),
    );
  },
);