import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_fixed_cross_axis_count_and_height.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/niyam_module/sadgranth_vanchan/sadgranth_vanchan_page.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/utils.dart';
import '../select_niyams/select_niyam_page.dart';

Widget sadgranthVanchanBodyView(bool isLoading, BuildContext context, int index) =>
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
            children: [
              SizedBox(height: 3.px),
              //buildsadgranthVanchanTitleSecond(),
              //SizedBox(height: 15.px),
              buildImageGridView(context, index),
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
        itemCount: niyamViewModel!.subCategoryInfoList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildImageGridView(context, index);
        }));

Widget buildsadgranthVanchanTitleSecond() => Row(
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

Column buildImageGridView(BuildContext context, int index) => Column(
      children: [
        buildSadgranthView(context, index),
      ],
    );

Widget buildSadgranthView(BuildContext context, int index) => Padding(
      padding: EdgeInsets.only(left: 15.px, right: 15.px, bottom: 15.px),
      child: Container(
        height: 183.px,
        width: 347.px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(
                width: 2.px,
                color: niyamViewModel!.subCategoryList[index].isSelect
                    ? BhajanColorConstant.greenLight
                    : BhajanColorConstant.lightBlack)),
        child: Row(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppImageAsset(
                      image: BhajanAssets.rectangleImage,
                      color: niyamViewModel!.subCategoryList[index].isSelect
                          ? BhajanColorConstant.greenLight
                          : BhajanColorConstant.lightBlack),
                ),
                Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 35.px),
                          child: AppText(
                            text: AppStringConstants.occasionOfFestival.tr,
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            fontColor: BhajanColorConstant.black,
                          ),
                        ),
                        buildSadgranthImageView(index),
                      ],
                    )),
                Positioned(
                    left: 0,
                    right: 20,
                    bottom: 15,
                    child: Column(
                      children: [
                        targetDateText(index),
                        //   htmlText(index),
                      ],
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.px, top: 10.px),
                  child: Column(
                    children: [
                      buildMeaningView(index, context),
                      SizedBox(height: 7.px),
                      buildTheGloryView(index, context),
                      SizedBox(height: 7.px),
                      buildHistoryView(index, context),
                      SizedBox(height: 18.px),
                      selectMukhPathItem(index),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

Container targetDateText(int index) => Container(
      padding: EdgeInsets.only(top: 50.px),
      child: AppText(
        text: '${niyamViewModel!.subCategoryList[index].targetDate} સુધીનો લક્ષ્ય',
        fontSize: 12.px,
        fontWeight: FontWeight.w500,
        fontColor: BhajanColorConstant.black,
      ),
    );

Padding buildSadgranthImageView(int index) => Padding(
      padding: EdgeInsets.only(bottom: 20.px, left: 20.px),
      child: Align(
        alignment: Alignment.center,
        child: AppImageAsset(
            webFit: BoxFit.fill,
            isWebImage: true,
            webWidth: 93.px,
            webHeight: 125.px,
            image: niyamViewModel!.subCategoryList[index].mainImage),
      ),
    );

// Widget buildImageGridView(int index, BuildContext context) => Column(
//       children: [
//         SizedBox(
//           width: 150.px,
//           height: 150.px,
//           child: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 35.px),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       buildMeaningView(index, context),
//                       const SizedBox(height: 5),
//                       buildTheGloryView(index, context),
//                       const SizedBox(height: 5),
//                       buildHistoryView(index, context),
//                     ],
//                   ),
//                 ),
//               ),
//               buildImageBgColorBoxView(index),
//               buildSadgranthVanchanImageView(index),
//             ],
//           ),
//         ),
//         selectMukhPathItem(index),
//       ],
//     );

Widget buildImageBgColorBoxView(int index) => Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(top: 20.px),
        width: 105.px,
        height: 115.px,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: BhajanColorConstant.gray,
                blurRadius: 10.px,
              ),
            ],
            border: Border.all(
              color: BhajanColorConstant.hex(niyamViewModel!.subCategoryList[index].bkColor),
              width: 2.px,
            ),
            color: BhajanColorConstant.hex(niyamViewModel!.subCategoryList[index].bkColor)
                .withOpacity(0.75),
            borderRadius: BorderRadius.circular(10.px)),
      ),
    );

Widget buildSadgranthVanchanImageView(int index) => Padding(
      padding: EdgeInsets.only(bottom: 10.px, left: 35.px),
      child: Align(
          alignment: Alignment.center,
          child: AppImageAsset(
              webWidth: 100.px,
              webHeight: 140.px,
              webFit: BoxFit.fill,
              isWebImage: true,
              image: niyamViewModel!.subCategoryList[index].mainImage)),
    );

Widget buildMeaningView(
  int index,
  BuildContext context,
) =>
    InkWell(
      onTap: () => niyamViewModel!.subCategoryList[1].niyamMeaning!.meaning != ''
          ? showMeaningDialog(context)
          : errorToast(AppStringConstants.noDataFound.tr),
      child: Container(
        alignment: Alignment.center,
        width: 110.px,
        height: 28.px,
        decoration: BoxDecoration(
            color: niyamViewModel!.subCategoryList[index].isSelect
                ? BhajanColorConstant.greenLight
                : BhajanColorConstant.lightBlack,
            borderRadius: BorderRadius.circular(34.px)),
        child: AppText(
          text: AppStringConstants.meaning,
          fontSize: 16.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75.px,
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
              text: niyamViewModel!.subCategoryList[1].niyamMeaning!.meaning.toString(),
            )),
          ),
        );
      },
    );

Widget buildTheGloryView(int index, BuildContext context) => InkWell(
      onTap: () => niyamViewModel!.subCategoryList[0].niyamMeaning!.meaning != ''
          ? showTheGloryDialog(context)
          : errorToast(AppStringConstants.noDataFound.tr),
      child: Container(
        alignment: Alignment.center,
        width: 110.px,
        height: 28.px,
        decoration: BoxDecoration(
            color: niyamViewModel!.subCategoryList[index].isSelect
                ? BhajanColorConstant.greenLight
                : BhajanColorConstant.lightBlack,
            borderRadius: BorderRadius.circular(34.px)),
        child: AppText(
          text: AppStringConstants.theGlory,
          fontSize: 16.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75.px,
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
              text: niyamViewModel!.subCategoryList[0].niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

Widget buildHistoryView(int index, BuildContext context) => InkWell(
      onTap: () => niyamViewModel!.subCategoryList[0].niyamMeaning!.meaning != ''
          ? showHistoryDialog(context)
          : errorToast(AppStringConstants.noDataFound.tr),
      child: Container(
        alignment: Alignment.center,
        width: 110.px,
        height: 28.px,
        decoration: BoxDecoration(
            color: niyamViewModel!.subCategoryList[index].isSelect
                ? BhajanColorConstant.greenLight
                : BhajanColorConstant.lightBlack,
            borderRadius: BorderRadius.circular(34.px)),
        child: AppText(
          text: AppStringConstants.history,
          fontSize: 16.px,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75.px,
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
              text: niyamViewModel!.subCategoryList[0].niyamMeaning!.meaning,
            )),
          ),
        );
      },
    );

Widget selectMukhPathItem(int index) => InkWell(
      onTap: () => niyamViewModel!.selectItemClick(index),
      child: Padding(
        padding: EdgeInsets.only(left: 5.px, top: 5.px),
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: niyamViewModel!.subCategoryList[index].isSelect == false
                    ? BhajanColorConstant.lightBlack
                    : BhajanColorConstant.lightGreen),
            height: 30.px,
            width: 30.px,
            alignment: Alignment.center,
            child: niyamViewModel!.subCategoryList[index].isSelect
                ? AppImageAsset(
                    image: BhajanAssets.selectIcon,
                    height: 21.px,
                    width: 24.px,
                  )
                : null),
      ),
    );

Widget floatingActionButton() => Container(
      padding: EdgeInsets.only(top: 20.px, bottom: 10.px, left: 100.px, right: 100.px),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.px),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.white38,
              blurRadius: 25.px,
              spreadRadius: 25.0,
              offset: const Offset(1.0, 1.0), // shadow direction: bottom right
            ),
          ]),
      child: AppButton(
        width: 185.px,
        onTap: () => sadgranthVanchanViewModel!.saveNiyamHistory(),
        text: AppStringConstants.save.tr.toUpperCase(),
      ),
    );


Widget sadgranthVachanBodyView() => ListView.builder(
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 15.px),
  physics: const BouncingScrollPhysics(),
  itemCount: niyamViewModel!.subCategoryInfoList[3].subcategoryList.length,
  itemBuilder: (context, subIndex) {
    return Padding(
      padding: EdgeInsets.only(left: 15.px, right: 15.px, bottom: 15.px),
      child: Container(
        height: 183.px,
        width: 347.px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(
                width: 2.px,
                color: niyamViewModel!.subCategoryInfoList[3]
                    .subcategoryList[subIndex].isSelect
                    ? BhajanColorConstant.greenLight
                    : BhajanColorConstant.lightBlack)),
        child: Row(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppImageAsset(
                      image: BhajanAssets.rectangleImage,
                      color: niyamViewModel!.subCategoryInfoList[3]
                          .subcategoryList[subIndex].isSelect
                          ? BhajanColorConstant.greenLight
                          : BhajanColorConstant.lightBlack),
                ),
                Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 35.px),
                          child: AppText(
                            text: AppStringConstants.occasionOfFestival.tr,
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            fontColor: BhajanColorConstant.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.px, left: 20.px),
                          child: Align(
                            alignment: Alignment.center,
                            child: AppImageAsset(
                                webFit: BoxFit.fill,
                                isWebImage: true,
                                webWidth: 93.px,
                                webHeight: 115.px,
                                image: niyamViewModel!.subCategoryInfoList[3]
                                    .subcategoryList[subIndex].mainImage),
                          ),
                        )
                      ],
                    )),
                Positioned(
                    left: 0,
                    right: 20,
                    bottom: 15,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50.px),
                          child: AppText(
                            text:
                            '${niyamViewModel!.subCategoryInfoList[3].subcategoryList[subIndex].targetDate} સુધીનો લક્ષ્ય',
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            fontColor: niyamViewModel!
                                .subCategoryInfoList[3].subcategoryList[subIndex].isSelect
                                ? BhajanColorConstant.textRed
                                : BhajanColorConstant.black,
                          ),
                        )
                        //   htmlText(index),
                      ],
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15.px, top: 15.px),
                  child: Column(
                    children: [
                      buildMeaningView(subIndex, context),
                      SizedBox(height: 7.px),
                      buildTheGloryView(subIndex, context),
                      SizedBox(height: 7.px),
                      buildHistoryView(subIndex, context),
                      SizedBox(height: 18.px),
                      InkWell(
                        onTap: () => niyamViewModel!.selectItemClick(subIndex),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:niyamViewModel!
                                    .subCategoryInfoList[3].subcategoryList[subIndex].isSelect == false
                                    ? BhajanColorConstant.lightBlack
                                    : BhajanColorConstant.lightGreen),
                            height: 34.px,
                            width: 34.px,
                            alignment: Alignment.center,
                            child: niyamViewModel!
                                .subCategoryInfoList[3].subcategoryList[subIndex].isSelect
                                ? AppImageAsset(
                              image: BhajanAssets.selectIcon,
                              height: 21.px,
                              width: 24.px,
                            )
                                : null),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  },
);

