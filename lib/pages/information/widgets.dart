import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';

Padding buildPhoneIconView() => Padding(
      padding: EdgeInsets.all(8.px),
      child: SizedBox(
        height: 202.px,
        width: 365.px,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.px),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppImageAsset(
                      image: BhajanAssets.editingPhoneIcon,
                      height: 60.px,
                      width: 60.px,
                    ),
                    AppText(
                      text: AppStringConstants.infoIconTitle,
                      fontSize: 20.px,
                      fontColor: BhajanColorConstant.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75.px,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Divider(
                    height: 1.px,
                    color: BhajanColorConstant.gray,
                    indent: 20.px,
                    endIndent: 20.px,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.px),
                  child: AppText(
                    text: AppStringConstants.editPhoneIconDesc,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20.px,
                    fontColor: BhajanColorConstant.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

Padding buildRightIconView(BuildContext context) => Padding(
      padding: EdgeInsets.all(8.px),
      child: SizedBox(
        height: 210.px,
        width: 365.px,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.px),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.px),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppImageAsset(
                          image: BhajanAssets.rightClick,
                          height: 60.px,
                          width: 60.px,
                        ),
                        AppText(
                          text: AppStringConstants.infoIconTitle,
                          fontSize: 20.px,
                          fontColor: BhajanColorConstant.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.75.px,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.px),
                      child: const Divider(
                        height: 1,
                        color: BhajanColorConstant.gray,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.px),
                        child: AppText(
                          text: AppStringConstants.rightIconDesc,
                          fontSize: 20.px,
                          fontColor: BhajanColorConstant.black,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 38.px,
                    decoration: BoxDecoration(
                        color: BhajanColorConstant.primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.px),
                            bottomRight: Radius.circular(15.px))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImageAsset(
                          image: BhajanAssets.youtubeIcon,
                          height: 30.px,
                          width: 30.px,
                        ),
                        AppText(
                          text: AppStringConstants.watchNow.tr,
                          fontFamily: AppTheme.poppins,
                          fontSize: 18.px,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
