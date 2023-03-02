import 'dart:io';

import 'package:bank/pages/member/widgets.dart';
import 'package:bank/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/widgets/app_button.dart';
import '../../../../app/widgets/app_image_asset.dart';
import '../../../../app/widgets/app_text.dart';
import '../../../../app/widgets/app_theme.dart';
import '../../../../constant/bhajan_assets.dart';
import '../../../../constant/color_constant.dart';
import '../../../../constant/string_constant.dart';
import '../../../../controller/selected_niyam_chesta_page_controller.dart';
import '../selected_niyam_chesta_page.dart';

Stack buildGharMandirBodyView(SelectedNiyamChestaPageController controller) => Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 33.px, right: 34.px, top: 32.px),
                child: AppText(
                  text: selectedNiyamChestaPageViewModel!.informationInfoList!.dailyInputTitle,
                  textAlign: TextAlign.center,
                  fontSize: 17.px,
                  fontWeight: FontWeight.w500,
                  fontColor: BhajanColorConstant.garyLight,
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 10.px),
              buildDividerView(),
              SizedBox(height: 14.px),
              InkWell(
                onTap: () => selectedNiyamChestaPageViewModel!.gotoButtonImageNextScreen(),
                child: AppImageAsset(
                    image: selectedNiyamChestaPageViewModel!.informationInfoList!.buttonImage!,
                    isWebImage: true,
                    placeHolder: const SizedBox(),
                    webWidth: 200.px),
              ),
              SizedBox(height: 24.px),
              buildDividerView(),
              SizedBox(height: 25.px),
              controller.imagePath.value.isNotEmpty
                  ? Image.file(
                      File(controller.imagePath.value),
                      fit: BoxFit.fitWidth,
                      height: 156.px,
                      width: 156.px,
                    )
                  : buildChoosePhotoView(controller),
              SizedBox(height: 6.px),
              AppText(
                  text: AppStringConstants.maharajThalPhoto,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.px,
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.gray),
              SizedBox(height: 21.px),
              buildDividerView(),
              SizedBox(height: 24.px),
              controller.imgPath.value.isNotEmpty
                  ? Image.file(
                      File(controller.imgPath.value),
                      fit: BoxFit.fitWidth,
                      height: 156.px,
                      width: 156.px,
                    )
                  : buildUploadPhotoView(controller),
              SizedBox(height: 6.px),
              AppText(
                  text: AppStringConstants.lunchPhoto,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.px,
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.gray),
              SizedBox(height: 24.px),
              buildDividerView(),
              SizedBox(height: 24.px),
              buildPhotoLibraryView(),
              SizedBox(height: 11.px),
              AppText(
                  text: AppStringConstants.photoViewClick,
                  fontFamily: AppTheme.baloobhai2,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.px,
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.w700,
                  fontColor: BhajanColorConstant.gray),
              SizedBox(height: 28.px),
              buildDividerView(),
              SizedBox(height: 16.px),
              Padding(
                padding: EdgeInsets.only(left: 35.px, right: 35.px),
                child: HtmlText(
                  textAlign: TextAlign.center,
                  text: selectedNiyamChestaPageViewModel!.informationInfoList!.description,
                  fontSize: 17.px,
                  fontWeight: FontWeight.w500,
                  fontColor: BhajanColorConstant.garyLight,
                ),
              ),
              SizedBox(height: 8.px),
              HtmlText(
                textAlign: TextAlign.center,
                text: selectedNiyamChestaPageViewModel!.informationInfoList!.note,
                fontSize: 18.px,
                fontWeight: FontWeight.w700,
                fontColor: BhajanColorConstant.darkBlue2,
              ),
              SizedBox(height: 10.px),
              buildBookOnYesNoButtonView(controller),
              SizedBox(height: 19.px),
              buildPageScrollView()
            ],
          ),
        ),
        loader(controller.isLoading),
      ],
    );

Divider buildDividerView() => Divider(
      height: 0.5.px,
      color: BhajanColorConstant.gray,
      endIndent: 40,
      indent: 40,
    );

ElevatedButton buildChoosePhotoView(SelectedNiyamChestaPageController controller) =>
    ElevatedButton.icon(
        onPressed: () => controller.getFromGallery(0),
        icon: AppImageAsset(
          image: BhajanAssets.uploadPhoto,
          width: 14.px,
          height: 14.px,
        ),
        label: AppText(
            text: AppStringConstants.choosePhoto.toUpperCase(),
            fontFamily: AppTheme.poppins,
            fontStyle: FontStyle.normal,
            fontSize: 12.px,
            letterSpacing: -0.025,
            fontWeight: FontWeight.w600,
            fontColor: BhajanColorConstant.black),
        style: ElevatedButton.styleFrom(
          backgroundColor: BhajanColorConstant.pistaGreen,
          minimumSize: Size(140.px, 33.px),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.px),
          ),
        ));

ElevatedButton buildUploadPhotoView(SelectedNiyamChestaPageController controller) =>
    ElevatedButton.icon(
        onPressed: () => controller.getFromGallery(1),
        icon: AppImageAsset(
          image: BhajanAssets.uploadPhoto,
          width: 14.px,
          height: 14.px,
        ),
        label: AppText(
            text: AppStringConstants.choosePhoto.toUpperCase(),
            fontFamily: AppTheme.poppins,
            fontStyle: FontStyle.normal,
            fontSize: 12.px,
            letterSpacing: -0.025,
            fontWeight: FontWeight.w600,
            fontColor: BhajanColorConstant.black),
        style: ElevatedButton.styleFrom(
          backgroundColor: BhajanColorConstant.pistaGreen,
          minimumSize: Size(140.px, 33.px),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.px),
          ),
        ));

Row buildBookOnYesNoButtonView(SelectedNiyamChestaPageController controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButton(
          onTap: () => controller.uploadGharMandirApi(),
          text: AppStringConstants.yes.toUpperCase(),
          textColor: BhajanColorConstant.white,
          textAlign: TextAlign.center,
          fontSize: 20.px,
          fontWeight: FontWeight.w700,
          color: BhajanColorConstant.greenButton,
          height: 42.px,
          width: 127.px,
          borderRadius: BorderRadius.circular(0),
        ),
        SizedBox(width: 10.px),
        AppButton(
          onTap: () {},
          text: AppStringConstants.no.toUpperCase(),
          textColor: BhajanColorConstant.white,
          textAlign: TextAlign.center,
          fontSize: 20.px,
          fontWeight: FontWeight.w700,
          color: BhajanColorConstant.deepOrange,
          height: 42.px,
          width: 127.px,
          borderRadius: BorderRadius.circular(0),
        ),
      ],
    );

SizedBox buildPhotoLibraryView() => SizedBox(
      height: 100.px,
      child: InkWell(
        onTap: () => gotoPhotoGalleryScreen(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                text: AppStringConstants.photoLibrary,
                textColor: BhajanColorConstant.white,
                textAlign: TextAlign.center,
                fontSize: 12.px,
                fontWeight: FontWeight.w600,
                color: BhajanColorConstant.primary,
                height: 33.px,
                width: 140.px,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: AppImageAsset(
                  image: BhajanAssets.photo,
                  height: 68.px,
                )),
          ],
        ),
      ),
    );

Container buildPageScrollView() => Container(
      height: 95.px,
      margin: EdgeInsets.only(left: 25.px, right: 25.px),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: AppStringConstants.visheMahit,
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
                    text: AppStringConstants.infoClick,
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
