import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/widgets/app_button.dart';
import '../../../../app/widgets/app_image_asset.dart';
import '../../../../app/widgets/app_text.dart';
import '../../../../app/widgets/app_theme.dart';
import '../../../../constant/bhajan_assets.dart';
import '../../../../constant/color_constant.dart';
import '../../../../constant/string_constant.dart';
import '../../../../controller/vandu_path_screen_controller.dart';
import '../../../../pages/member/widgets.dart';
import '../../../../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/vandu_path_screen.dart';
import '../../../../routes/app_navigation.dart';

Widget buildVanduPathBodyView(VanduPathScreenController controller) =>
    vanduPathScreenViewModel!.lessonInfoList.isNotEmpty
        ? Stack(children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: AppImageAsset(
                image: BhajanAssets.backgroundWhite,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.px, right: 57.px, left: 57.px, bottom: 150.px),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 700.px,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(BhajanAssets.roundCurveGrey)))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.px, right: 65.px, left: 65.px, bottom: 160.px),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 690.px,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(BhajanAssets.blueBackground)))),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    vanduPathScreenViewModel = null;
                    gotoBack();
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 38.px, left: 15.px),
                      child: AppImageAsset(
                        image: BhajanAssets.backArrow,
                        height: 21.px,
                        width: 12.px,
                        color: BhajanColorConstant.black,
                      )),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 40),
                child: Image.network(
                  vanduPathScreenViewModel!.lessonInfoList[0].lessonList[0].image,
                  width: 291.px,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Device.height * 0.34,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: BhajanColorConstant.white,
                    blurRadius: 60.0,
                    spreadRadius: 60.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  ),
                ]),
                child: Column(
                  children: [
                    AppText(
                      text: vanduPathScreenViewModel!.informationInfoList!.subCatName,
                      letterSpacing: 0.5.px,
                      fontStyle: FontStyle.normal,
                      fontSize: 26.px,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.offBlue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 85, right: 85),
                      child: AppButton(
                        height: 46,
                        onTap: () => vanduPathScreenViewModel!.buttonClick(),
                        text: AppStringConstants.readNow.toUpperCase(),
                        borderRadius: BorderRadius.circular(12.px),
                        fontSize: 22.px,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color:BhajanColorConstant.white,
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: HtmlText(
                        text: vanduPathScreenViewModel!
                            .lessonInfoList.first.lessonList.first.lesssonShortDescription,
                        fontSize: 17.px,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ])
        : loader(controller.isLoading);

SizedBox buildBottomView() => SizedBox(
      width: Device.width,
      height: Device.height * 0.15,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Device.width,
              height: 116,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(BhajanAssets.rectangleSkyBlue),)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(height: 80.px,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        BhajanAssets.rectangleBlue,
                      ))),
              child: Padding(
                padding:EdgeInsets.only(top: 35.px,left: 22.px,right: 22.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: AppStringConstants.meaning,
                      fontFamily: AppTheme.poppins,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.white,
                      fontSize: 20.px,
                      letterSpacing: 0.25.px,
                    ),
                    AppText(
                      text: AppStringConstants.theGlory,
                      fontFamily: AppTheme.poppins,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.white,
                      fontSize: 20.px,
                      letterSpacing: 0.25.px,
                    ),
                    AppText(
                      text: AppStringConstants.history,
                      fontFamily: AppTheme.poppins,
                      fontWeight: FontWeight.w600,
                      fontColor: BhajanColorConstant.white,
                      fontSize: 20.px,
                      letterSpacing: 0.25.px,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
