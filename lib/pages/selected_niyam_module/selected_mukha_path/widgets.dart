import 'package:bank/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/selected_niyam_module/selected_mukha_path/seleted_mukha_path_page.dart';

Padding buildMukhaPathBodyView() => Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          buildTvView(),
          buildTargetAchievementView(),
          Padding(
            padding: EdgeInsets.only(left: 39.px, right: 39.px),
            child: AppText(
              text: selectedMukhaPathPageViewModel!.informationInfoList!.noteApp!,
              fontColor: BhajanColorConstant.offGrey,
              maxLines: 2,
              textAlign: TextAlign.center,
              fontFamily: AppTheme.baloobhai2,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          selectedMukhaPathPageViewModel!.mukhapathDataList != null &&
                  selectedMukhaPathPageViewModel!.mukhapathDataList!.isNotEmpty
              ? buildMukhaPathListView()
              : const SizedBox(),
          SizedBox(height: 19.px),
          Divider(
            color: BhajanColorConstant.gray.withOpacity(0.4),
            thickness: 1.px,
            indent: 55.px,
            endIndent: 55.px,
          ),
          SizedBox(height: 14.px),
          AppText(
            text: AppStringConstants.clickToWatchVideoStunner.tr,
            fontColor: BhajanColorConstant.offGrey,
            fontSize: 17.px,
            fontWeight: FontWeight.w500,
            fontFamily: AppTheme.baloobhai2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18.px),
          AppImageAsset(
            image: BhajanAssets.watchNow,
            height: 60.px,
            width: 206.px,
          ),
          SizedBox(height: 26.px),
        ],
      ),
    );

Padding buildTvView() => Padding(
      padding: EdgeInsets.only(top: 27.px),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AppImageAsset(
              image: BhajanAssets.tv,
              width: 275.px,
              height: 163.px,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AppImageAsset(
                image: BhajanAssets.tvPhoto, width: 273.px, height: 145.px, fit: BoxFit.fill),
          ),
          Positioned(
              top: 6,
              bottom: 0,
              left: 0,
              right: 47,
              child: Container(
                  alignment: Alignment.topRight,
                  child: Material(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 5,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: BhajanColorConstant.white,
                        child: AppImageAsset(
                            image: BhajanAssets.videoPlayListIcon,
                            width: 9.px,
                            height: 7.px,
                            fit: BoxFit.fill),
                      ))))
        ],
      ),
    );

Padding buildTargetAchievementView() => Padding(
      padding: EdgeInsets.only(left: 23.px, right: 28.px, top: 27.px, bottom: 25.px),
      child: Row(
        children: [
          AppText(
            text: AppStringConstants.targetAchievement,
            fontFamily: AppTheme.hindsiliguri,
            fontSize: 22.px,
            fontWeight: FontWeight.w600,
            fontColor: BhajanColorConstant.darkBlue,
            fontStyle: FontStyle.normal,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              gotoMukhPathNiyam();
            },
            child: AppImageAsset(
              image: BhajanAssets.editPencilIcon,
              width: 56.px,
              height: 24.px,
            ),
          )
        ],
      ),
    );

ListView buildMukhaPathListView() => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedMukhaPathPageViewModel!.mukhapathDataList!.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(top: 9.px, left: 32.px, right: 34.px),
        child: InkWell(
          onTap: () {
            gotoMukhPathApplication(selectedMukhaPathPageViewModel!.mukhapathDataList![index],);
            // Navigator.push(
            //     this.context,
            //     MaterialPageRoute(
            //       builder: (context) => MukhapathaApplication(
            //           mukhapathData: init.mukhapath![index],
            //           subCatId: init.userSelectedNiyamHistory![index].subcatId
            //       ),
            //     ));
          },
          child: Container(
              height: 61.px,
              decoration: BoxDecoration(
                  color: BhajanColorConstant.hex(
                          selectedMukhaPathPageViewModel!.mukhapathDataList![index].bkColor!)
                      .withOpacity(0.7),
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 0.5.px, color: Colors.white),
                  borderRadius: BorderRadius.circular(11.px)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.px, top: 7.px, bottom: 8.px, right: 15.px),
                    child: Container(
                      width: 51.px,
                      height: 46.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: BhajanColorConstant.white,
                          borderRadius: BorderRadius.circular(11.px)),
                      child: AppImageAsset(
                        image: BhajanAssets.book4,
                        color: BhajanColorConstant.hex(
                                selectedMukhaPathPageViewModel!.mukhapathDataList![index].bkColor!)
                            .withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 165.px,
                    child: AppText(
                      text: selectedMukhaPathPageViewModel!.mukhapathDataList![index].subCatName,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w700,
                      fontColor: BhajanColorConstant.white,
                      fontSize: 24.px,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10.px),
                    child: AppText(
                      text:
                          '${selectedMukhaPathPageViewModel!.mukhapathDataList![index].myDailyTarget.toString()}'
                              '/${selectedMukhaPathPageViewModel!.mukhapathDataList![index].totalTarget.toString()}',
                      fontFamily: AppTheme.poppins,
                      letterSpacing: 0.75.px,
                      fontColor: BhajanColorConstant.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.px,
                    ),
                  )
                ],
              )),
        ),
      ),
    );

Padding buildPageScrollView() => Padding(
  padding: EdgeInsets.only(left: 25.px, right: 25.px),
  child:   Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: AppStringConstants.specialInformation.tr,
            style: GoogleFonts.balooBhai2(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.75,
                color: BhajanColorConstant.offGrey,
                fontSize: 17.px),
            children: [
              WidgetSpan(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 4.px),
                child: const Icon(
                  Icons.info,
                  color: BhajanColorConstant.offGrey,
                ),
              )),
              TextSpan(
                text: AppStringConstants.clickOnInfo.tr,
                style: GoogleFonts.balooBhai2(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.75,
                    color: BhajanColorConstant.offGrey,
                    fontSize: 17.px),
              )
            ]),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppImageAsset(
                  image: BhajanAssets.leftArrowIcon,
                  width: 17.px,
                  height: 17.px,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 5.px),
                AppText(
                    text: AppStringConstants.namePrevious,
                    fontFamily: AppTheme.baloobhai2,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.75,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w500,
                    fontColor: BhajanColorConstant.black),
              ]),
              AppText(
                  text: AppStringConstants.previous,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w500,
                  fontColor: BhajanColorConstant.black),
            ],
          ),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppText(
                    text: AppStringConstants.moreName,
                    fontFamily: AppTheme.baloobhai2,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.75,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w500,
                    fontColor: BhajanColorConstant.black),
                SizedBox(
                  width: 5.px,
                ),
                AppImageAsset(
                  image: BhajanAssets.rightArrow,
                  width: 17.px,
                  height: 17.px,
                  fit: BoxFit.fill,
                ),
              ]),
              AppText(
                  text: AppStringConstants.next,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w500,
                  fontColor: BhajanColorConstant.black),
            ],
          ),
        ],
      ),
    ],
  ),
);
