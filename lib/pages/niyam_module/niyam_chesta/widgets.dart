import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/niyam_module/niyam_chesta/niyam_chesta_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/utils.dart';

Widget niyamChestaBodyView(BuildContext context) =>
    niyamChestaViewModel!.subCategoryInfoList.isEmpty
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
        : Stack(
            children: [
              buildNiyamChestaListView(context),
              chestaSaveButtonView(),
            ],
          );

Widget buildNiyamChestaListView(BuildContext context) => SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 60.px),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Stack(alignment: Alignment.bottomCenter, children: [
            SizedBox(
              height: 45.px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildMeaningView(context),
                  buildTheGloryView(context),
                  buildHistoryView(context)
                ],
              ),
            ),
            buildNiyamImageView()
          ]),
          const SizedBox(height: 40),
          AppText(
              text: AppStringConstants.niyamChestaTitle,
              textAlign: TextAlign.center,
              fontFamily: AppTheme.baloobhai2,
              maxLines: 2,
              letterSpacing: 0.75,
              fontSize: 18.px,
              fontWeight: FontWeight.w400,
              fontColor: BhajanColorConstant.black),
          const SizedBox(height: 15),
          AppButton(
            onTap: () {
              successToast(
                  '${niyamChestaViewModel!.subCategoryInfoList[niyamChestaViewModel!.selectedIndex].subCatName} is select');
            },
            width: 130.px,
            height: 40.px,
            borderRadius: BorderRadius.circular(5.px),
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            color: BhajanColorConstant.green,
            text: AppStringConstants.yes.toUpperCase(),
          ),
          const SizedBox(height: 5),
          AppButton(
            onTap: () {
              successToast(
                  '${niyamChestaViewModel!.subCategoryInfoList[niyamChestaViewModel!.selectedIndex].subCatName} is select');
            },
            width: 130.px,
            height: 40.px,
            borderRadius: BorderRadius.circular(5.px),
            fontSize: 20.px,
            fontWeight: FontWeight.w700,
            color: BhajanColorConstant.deepOrange,
            text: AppStringConstants.no.toUpperCase(),
          ),
          const SizedBox(height: 15),
          AppText(
            text: AppStringConstants.niyamChestaTitleSecond,
            textAlign: TextAlign.center,
            letterSpacing: 0.75,
            fontStyle: FontStyle.normal,
            maxLines: 2,
            fontSize: 14.px,
            fontWeight: FontWeight.w400,
            fontColor: BhajanColorConstant.black,
            fontFamily: AppTheme.baloobhai2,
          ),
          SizedBox(height: 15.px),
          AppText(
            text: AppStringConstants.niyamChestaTitleTh,
            fontColor: BhajanColorConstant.red,
            fontSize: 21.px,
            fontFamily: AppTheme.baloobhai2,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );

Widget buildMeaningView(BuildContext context) => InkWell(
      onTap: () => niyamChestaViewModel!.subCategoryInfoList.first.niyamMeaning!.meaning != ''
          ? showMeaningDialog(context)
          : errorToast(AppStringConstants.noDataFound.tr),
      child: Container(
        margin: EdgeInsets.only(right: 10.px),
        padding: EdgeInsets.only(top: 10.px),
        alignment: Alignment.center,
        width: 87.px,
        height: 40.px,
        decoration: BoxDecoration(
            color: BhajanColorConstant.darkRed,
            borderRadius: BorderRadius.circular(7.px),
            border: Border.all(color: BhajanColorConstant.offRed)),
        child: AppText(
          text: AppStringConstants.meaning,
          letterSpacing: 0.25.px,
          fontStyle: FontStyle.normal,
          fontSize: 17.px,
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
            width: Device.width,
            height: Device.height * 0.4,
            child: SingleChildScrollView(
              child: HtmlText(
                text: niyamChestaViewModel!.subCategoryInfoList.first.niyamMeaning!.meaning.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );

Widget buildTheGloryView(BuildContext context) => InkWell(
      onTap: () => niyamChestaViewModel!.subCategoryInfoList.first.niyamMeaning!.meaning != ''
          ? showTheGloryDialog(context)
          : errorToast(AppStringConstants.noDataFound.tr),
      child: Container(
        margin: EdgeInsets.only(right: 10.px),
        padding: EdgeInsets.only(top: 10.px),
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
          fontSize: 17.px,
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
            width: Device.width,
            height: Device.height * 0.4,
            child: SingleChildScrollView(
              child: HtmlText(
                text: niyamChestaViewModel!.subCategoryInfoList.first.niyamMeaning!.meaning.toString(),
                fontSize: 16.px,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );

Widget buildHistoryView(BuildContext context) => InkWell(
      onTap: () => niyamChestaViewModel!.subCategoryInfoList.first.niyamMeaning!.meaning != ''
          ? showHistoryDialog(context)
          : errorToast(AppStringConstants.noDataFound.tr),
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
            width: Device.width,
            height: Device.height * 0.4,
            child: SingleChildScrollView(
                child: HtmlText(
              text: niyamChestaViewModel!.subCategoryInfoList.first.niyamMeaning!.meaning,
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
            )),
          ),
        );
      },
    );

Widget buildNiyamImageView() => Container(
    width: 301.px,
    height: 189.56.px,
    margin: EdgeInsets.only(bottom: 35.px),
    padding: EdgeInsets.all(10.px),
    decoration: BoxDecoration(
      color: BhajanColorConstant.lightBlue,
      borderRadius: BorderRadius.all(Radius.circular(5.px)),
    ),
    child: Container(
      color: Colors.indigo,
      child: niyamChestaViewModel!
              .subCategoryInfoList[niyamChestaViewModel!.selectedIndex].mainImage.isEmpty
          ? AppImageAsset(
              image: niyamChestaViewModel!
                  .subCategoryInfoList[niyamChestaViewModel!.selectedIndex].mainImage,
              webFit: BoxFit.contain,
            )
          : const AppImageAsset(
              image: BhajanAssets.gifiImage,
              fit: BoxFit.contain,
            ),
    ));

Widget chestaSaveButtonView() => Padding(
      padding: EdgeInsets.only(bottom: 10.px),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AppButton(
          width: 185.px,
          height: 39.px,
          fontSize: 25.px,
          fontWeight: FontWeight.w700,
          onTap: () => niyamChestaViewModel!.saveNiyamHistory(),
          text: AppStringConstants.save.toUpperCase(),
        ),
      ),
    );
