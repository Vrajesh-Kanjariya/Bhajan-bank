import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../app/widgets/bhajan_loader.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/sandgrath_anushthan_application_controller.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_application/sandgrath_anushthan_application_screen.dart';
import '../../../routes/app_navigation.dart';

buildSandgrathAnushthanApplicationBodyView(
        SandgrathAnushthanApplicationController controller,
        BuildContext context) =>
    sandgrathAnushthanApplicationViewModel!.lessonResponse != null
        ? Padding(
            padding: EdgeInsets.only(top: 4.5.px),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AppText(
                    textAlign: TextAlign.center,
                    text: AppStringConstants.noteVancham,
                    fontColor: BhajanColorConstant.offGrey,
                    fontFamily: AppTheme.baloobhai2,
                    fontSize: 17.px,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.px),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AppImageAsset(
                      image: BhajanAssets.goldBack,
                      width: Device.width * 0.9.px,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                buildTitleNameView(),
                Container(margin: EdgeInsets.only(top: 110.px),width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                      buildAnnualTargetView(),
                      SizedBox(height: 11.px),
                      buildDropDownView(controller, context),
                      SizedBox(height: 12.px),
                      buildItemListView(),
                    ],),
                  ),
                )
              ],
            ),
          )
        : const BhajanLoader();

Align buildTitleNameView() => Align(
      alignment: Alignment.topCenter,
      child: Container(
          margin: EdgeInsets.only(top: 30.px),
          alignment: Alignment.topCenter,
          height: 75.px,
          width: Device.width * 0.7.px,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(BhajanAssets.greenTie), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.only(top: 8.px),
            child: SizedBox(
              width: 170.px,
              child: AppText(
                  text: sandgrathAnushthanApplicationViewModel!.selectPrakran,
                  overflow: TextOverflow.ellipsis,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 21.px,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.white),
            ),
          )),
    );

Column buildDropDownView(SandgrathAnushthanApplicationController controller,
        BuildContext context) =>
    Column(children: [
      AppText(
        text: AppStringConstants.selectPraakran,
        fontColor: BhajanColorConstant.darkRedLight,
        fontFamily: AppTheme.baloobhai2,
        fontSize: 15.px,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(height: 5.px),
      // CustomDropdownButton(
      //   buttonHeight: 30.px,
      //   buttonWidth: 128.px,
      //   buttonDecoration: BoxDecoration(
      //       color: BhajanColorConstant.white,
      //       borderRadius: BorderRadius.circular(60.px)),
      //   hint: '',
      //   value: sandgrathAnushthanApplicationViewModel!
      //       .lessonInfoList[
      //           sandgrathAnushthanApplicationViewModel!.currentPosition]
      //       .lessonCatName,
      //   dropdownItems:
      //       sandgrathAnushthanApplicationViewModel!.lessonCatNameList,
      //   onChanged: (value) {
      //     sandgrathAnushthanApplicationViewModel!
      //         .lessonInfoList[
      //             sandgrathAnushthanApplicationViewModel!.currentPosition]
      //         .lessonCatName = value!;
      //     sandgrathAnushthanApplicationViewModel!.lessonInfoList
      //         .forEach((element) {
      //       if (element.lessonCatName == value) {
      //         sandgrathAnushthanApplicationViewModel!.lessonList =
      //             element.lessonList;
      //       }
      //     });
      //     controller.update();
      //   },
      // ),
      InkWell(
        onTap: () => openPraakranDialog(context),
        child: Container(
          height: 39.px,
          width: 157.px,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: BhajanColorConstant.white,
              borderRadius: BorderRadius.circular(8.px)),
          child: Padding(
            padding: EdgeInsets.only(left: 11.px, right: 11.px),
            child: Row(
              children: [
                SizedBox(
                  width: 90.px,
                  child: AppText(
                    text: sandgrathAnushthanApplicationViewModel!.selectPrakran,
                    fontColor: BhajanColorConstant.applicationText,
                    fontFamily: AppTheme.baloobhai2,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                const AppImageAsset(image: BhajanAssets.dropIcon)
              ],
            ),
          ),
        ),
      )
    ]);

openPraakranDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: BhajanColorConstant.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: StatefulBuilder(builder: (context, setState) {
            return ListView.builder(
                itemCount: sandgrathAnushthanApplicationViewModel!
                    .lessonCatNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => sandgrathAnushthanApplicationViewModel!
                        .selectedChapter(sandgrathAnushthanApplicationViewModel!
                            .lessonInfoList[index].lessonCatName),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.px),
                      width: 200.px,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: BhajanColorConstant.underline)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.px),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppText(
                                  text: sandgrathAnushthanApplicationViewModel!
                                      .lessonCatNameList[index],
                                  fontFamily: AppTheme.lato,
                                  letterSpacing: 0.75,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontColor: BhajanColorConstant.white),
                            ),
                            sandgrathAnushthanApplicationViewModel!
                                    .selectPrakran!
                                    .contains(
                                        sandgrathAnushthanApplicationViewModel!
                                            .lessonCatNameList[index])
                                ? AppImageAsset(
                                    image: BhajanAssets.rightClick,
                                    height: 30.px,
                                    width: 30.px,
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }));
    });

Column buildAnnualTargetView() => Column(
      children: [
        AppText(
          text: AppStringConstants.youYearTimeAll,
          fontColor: BhajanColorConstant.darkRedLight,
          fontFamily: AppTheme.baloobhai2,
          fontSize: 15.px,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 5.px),
        Container(
          height: 39.px,
          width: 157.px,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: BhajanColorConstant.white,
              borderRadius: BorderRadius.circular(8.px)),
          child: AppText(
            text:
                '${sandgrathAnushthanApplicationViewModel!.informationInfoList!.myAnnualTarget}',
            fontColor: BhajanColorConstant.applicationText,
            fontFamily: AppTheme.lato,
            fontSize: 22.px,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );

Widget buildItemListView() => SizedBox(
  width: Device.width * 0.8.px,
  child: ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: sandgrathAnushthanApplicationViewModel!.lessonList.length,
    separatorBuilder: (context, index) {
      return SizedBox(height: 8.px);
    },
    itemBuilder: (context, index) => InkWell(
      onTap: () => gotoSandgrathAnushthanLesson(
          sandgrathAnushthanApplicationViewModel!.lessonList,
          index,
          sandgrathAnushthanApplicationViewModel!.lessonInfoList),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 39.px,
            width: Device.width * 0.8.px,
            padding: EdgeInsets.only(left: 10.px, right: 3.px),
            margin: EdgeInsets.only(top: 8.px),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: sandgrathAnushthanApplicationViewModel!
                            .lessonList[index].isReadStatus
                        ? const AssetImage(
                            BhajanAssets.applicationBackground1)
                        : const AssetImage(
                            BhajanAssets.applicationBackground3),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.only(left: 8.px),
              child: AppText(
                  text: sandgrathAnushthanApplicationViewModel!
                      .lessonList[index].lesssonName,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.px,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.75.px,
                  fontColor: BhajanColorConstant.black),
            ),
          ),
          sandgrathAnushthanApplicationViewModel!
                      .lessonList[index].isReadStatus !=
                  true
              ? Align(
                  alignment: Alignment.topRight,
                  child: AppImageAsset(
                    image: BhajanAssets.lockIcon,
                    height: 20.px,
                    width: 15.px,
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  ),
);
