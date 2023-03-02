import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_button.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../app/widgets/bhajan_loader.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/sadgranth_anusthan_book_controller.dart';
import '../../../pages/selected_niyam_module/sadgranth_anusthan_book/sadgranth_anusthan_book_screen.dart';

buildSadgranthAnusthanBookBodyView(
        SadgranthAnusthanBookController controller, BuildContext context) =>
    sadgranthAnusthanBookViewModel!.lessonResponse != null
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
                Container(
                  margin: EdgeInsets.only(top: 110.px),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildAnnualTargetView(),
                        SizedBox(height: 11.px),
                        buildDropDownView(controller, context),
                        SizedBox(height: 12.px),
                        buildGridViewList(controller)
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 70.px),
                //   margin: EdgeInsets.only(top: 45.px),
                //   alignment: Alignment.topCenter,
                //   child: Column(
                //     children: [
                //       buildAnnualTargetView(),
                //       SizedBox(height: 11.px),
                //       buildDropDownView(controller, context),
                //       SizedBox(height: 12.px),
                //       buildGridViewList(controller)
                //     ],
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.px),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AppButton(
                      onTap: () => sadgranthAnusthanBookViewModel!.saveBookButton(),
                      text: AppStringConstants.save.toUpperCase(),
                      borderRadius: BorderRadius.circular(27.5.px),
                      color: BhajanColorConstant.greenDark1,
                      height: 45.px,
                      width: 199.px,
                      fontSize: 30.px,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppTheme.baloobhai2,
                    ),
                  ),
                ),
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
              image: DecorationImage(image: AssetImage(BhajanAssets.greenTie), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.only(top: 8.px),
            child: SizedBox(
              width: 170.px,
              child: AppText(
                  text: sadgranthAnusthanBookViewModel!.selectPrakran,
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

Column buildDropDownView(SadgranthAnusthanBookController controller, BuildContext context) =>
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
      //   value: sadgranthAnusthanBookViewModel!
      //       .lessonInfoList[sadgranthAnusthanBookViewModel!.currentPosition]
      //       .lessonCatName,
      //   dropdownItems: sadgranthAnusthanBookViewModel!.lessonCatNameList,
      //   onChanged: (value) {
      //     sadgranthAnusthanBookViewModel!
      //         .lessonInfoList[sadgranthAnusthanBookViewModel!.currentPosition]
      //         .lessonCatName = value!;
      //     sadgranthAnusthanBookViewModel!.lessonInfoList.forEach((element) {
      //       if (element.lessonCatName == value) {
      //         sadgranthAnusthanBookViewModel!.lessonList = element.lessonList;
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
              color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(8.px)),
          child: Padding(
            padding: EdgeInsets.only(left: 11.px, right: 11.px),
            child: Row(
              children: [
                SizedBox(
                  width: 90.px,
                  child: AppText(
                    text: sadgranthAnusthanBookViewModel!.selectPrakran,
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

openPraakranDialog(
  BuildContext context,
) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: BhajanColorConstant.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: StatefulBuilder(builder: (context, setState) {
                return ListView.builder(
                    itemCount: sadgranthAnusthanBookViewModel!.lessonCatNameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => sadgranthAnusthanBookViewModel!.selectedChapter(
                            sadgranthAnusthanBookViewModel!.lessonInfoList[index].lessonCatName),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.px),
                          width: 200.px,
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: BhajanColorConstant.underline)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AppText(
                                      text:
                                          sadgranthAnusthanBookViewModel!.lessonCatNameList[index],
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: AppTheme.lato,
                                      letterSpacing: 0.75,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontColor: BhajanColorConstant.white),
                                ),
                                sadgranthAnusthanBookViewModel!.selectPrakran!.contains(
                                        sadgranthAnusthanBookViewModel!.lessonCatNameList[index])
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
              color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(8.px)),
          child: AppText(
            text: '${sadgranthAnusthanBookViewModel!.informationInfoList!.myAnnualTarget}',
            fontColor: BhajanColorConstant.applicationText,
            fontFamily: AppTheme.poppins,
            fontSize: 19.px,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );

Widget buildGridViewList(SadgranthAnusthanBookController controller) => SizedBox(
      width: Device.width * 0.8.px,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 6,
          ),
          itemCount: sadgranthAnusthanBookViewModel!.lessonList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 45.px),
          itemBuilder: (context, index) {
            sadgranthAnusthanBookViewModel!.isSelected =
                sadgranthAnusthanBookViewModel!.selectedIndex.contains(index);
            return InkWell(
              onTap: sadgranthAnusthanBookViewModel!.lessonList[index].isOpenStatus
                  ? () => sadgranthAnusthanBookViewModel!.selectedItemLogic(index, controller)
                  : null,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 58.px,
                    width: 58.px,
                    margin: EdgeInsets.only(top: 8.px),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: sadgranthAnusthanBookViewModel!.lessonList[index].isReadStatus && sadgranthAnusthanBookViewModel!.lessonList[index].isOpenStatus
                                ? const AssetImage(BhajanAssets.bookBg1)
                                : sadgranthAnusthanBookViewModel!.lessonList[index].isReadStatus
                                    ? const AssetImage(BhajanAssets.bookBg2)
                                    : const AssetImage(BhajanAssets.bookBg3),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: [
                        AutoSizeText(
                          textAlign: TextAlign.start,
                          '${index + 1}',
                          maxFontSize: 30.px,
                          style: GoogleFonts.karla(
                            fontStyle: FontStyle.normal,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = BhajanColorConstant.black,
                            fontSize: 30.px,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.75,
                          ),
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 1,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          textAlign: TextAlign.start,
                          '${index + 1}',
                          maxFontSize: 30.px,
                          style: GoogleFonts.karla(
                            color: BhajanColorConstant.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 30.px,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.75,
                          ),
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 1,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  sadgranthAnusthanBookViewModel!.lessonList[index].isReadStatus
                      ? const SizedBox()
                      : AppImageAsset(
                          image: BhajanAssets.lockIcon,
                          height: 20.px,
                          width: 15.px,
                        )
                ],
              ),
            );
          }),
    );
