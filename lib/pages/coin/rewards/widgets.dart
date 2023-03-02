import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scratcher/scratcher.dart';

import '../../../app/widgets/app_fixed_cross_axis_count_and_height.dart';
import '../../../app/widgets/app_image_asset.dart';
import '../../../app/widgets/app_text.dart';
import '../../../app/widgets/app_theme.dart';
import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../pages/coin/rewards/rewards_page.dart';
import '../../../routes/app_navigation.dart';

Container rewardsUi() => Container(
      height: double.infinity,
      width: double.infinity,
      color: BhajanColorConstant.status,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
              color: BhajanColorConstant.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17.px), topRight: Radius.circular(17.px))),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Device.height,
              child: Column(
                children: [
                  tabView(),
                  tabContain(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

Container tabView() => Container(
      width: 304.px,
      height: 29.px,
      margin: EdgeInsets.only(top: 20.px, left: 5.px, right: 5.px),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: BhajanColorConstant.offBlack, borderRadius: BorderRadius.circular(9)),
      child: TabBar(
          controller: rewardsViewModel!.tabController,
          padding: const EdgeInsets.all(4),
          indicator: BoxDecoration(
              color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(9)),
          labelColor: Colors.white,
          unselectedLabelColor: BhajanColorConstant.primary,
          tabs: [
            Tab(
              child: AppText(
                text: AppStringConstants.rewards.tr,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: AppTheme.baloobhai2,
              ),
            ),
            Tab(
              child: AppText(
                text: AppStringConstants.specialRewards.tr,
                textAlign: TextAlign.center,
                letterSpacing: 0.75,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: AppTheme.baloobhai2,
              ),
            ),
          ]),
    );

Expanded tabContain() => Expanded(
      child: TabBarView(controller: rewardsViewModel!.tabController, children: [
        GridView.builder(
          itemCount: rewardsViewModel!.rewardImage.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 13.0,
            height: 143.px,
          ),
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                scratchDialog(context);
              },
              child: AppImageAsset(image: rewardsViewModel!.rewardImage[index]),
            );
          },
        ),
        const Center(
          child: Text("Yearly"),
        )
      ]),
    );

Future<void> scratchDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            content: SizedBox(
              height: 325.px,
              width: 288.px,
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Scratcher(
                  color: Colors.transparent,
                  image: Image.asset(
                    BhajanAssets.rewardBG,
                    fit: BoxFit.fill,
                  ),
                  accuracy: ScratchAccuracy.high,
                  threshold: 30,
                  brushSize: 40,
                  rebuildOnResize: true,
                  onThreshold: () {
                    setState(() {
                      rewardsViewModel!.opacity = 1;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: rewardsViewModel!.opacity,
                    child: Stack(
                      children: [
                        AppImageAsset(
                          image: BhajanAssets.rewardBG,
                          height: 325.px,
                          width: 288.px,
                          color: BhajanColorConstant.white,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.px, left: 8.px, top: 15.px),
                          child: AppText(
                            text: AppStringConstants.rewardsText,
                            textAlign: TextAlign.center,
                            fontSize: 17.px,
                            fontWeight: FontWeight.w600,
                            fontColor: BhajanColorConstant.coinText,
                            maxLines: 2,
                          ),
                        ),
                        Center(
                          child: AppImageAsset(
                            image: BhajanAssets.coinSwami,
                            height: 136.px,
                            width: 156.px,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 235, left: 100),
                          child: AppText(
                            text: AppStringConstants.youEarn.tr,
                            fontFamily: AppTheme.poppins,
                            textAlign: TextAlign.center,
                            fontSize: 17.px,
                            fontColor: BhajanColorConstant.coinText,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AppText(
                            text: AppStringConstants.coin4,
                            fontFamily: AppTheme.poppins,
                            textAlign: TextAlign.center,
                            fontSize: 54.px,
                            fontWeight: FontWeight.w700,
                            fontColor: BhajanColorConstant.golden,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              InkWell(
                onTap: () {
                  gotoBack();
                },
                child: AppImageAsset(
                  image: BhajanAssets.removeIcon,
                  height: 30.px,
                  width: 30.px,
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowAlignment: OverflowBarAlignment.center,
          ),
        );
      });
}
