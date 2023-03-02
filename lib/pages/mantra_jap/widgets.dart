import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:segment_display/segment_display.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/mantra_jap_controller.dart';
import '../../routes/app_navigation.dart';
import '../../utils/utils.dart';

Widget mantraJapBodyView(BuildContext context, MantraJapController controller) =>
    controller.showPowerMode
        ? mantraJapCountView(controller)
        : Stack(
            children: [
              mantraJapBgView(controller),
              mantraJapSwamiTextView(controller),
              mantraJapCalculateView(controller),
              mantraJapNavigationView(controller),
              backImageView(controller),
            ],
          );

Stack mantraJapCountView(MantraJapController controller) => Stack(
      children: [
        InkWell(
          onTap: () {
            if (isRedundentClick(DateTime.now())) {
              return;
            }
            HapticFeedback.heavyImpact();
            controller.count++;
            if (controller.goalCount == controller.count) {
              Get.dialog(
                  barrierDismissible: false,
                  Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.px),
                    ), // insetPadding: const EdgeInsets.all(15),
                    child: InkWell(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              const AppImageAsset(image: BhajanAssets.congrats),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    HapticFeedback.mediumImpact();
                                    gotoBack();
                                  },
                                  child: SizedBox(
                                    height: 40.px,
                                    width: 60.px,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
            }
            controller.update();
          },
          child: Stack(
            children: [
              AppImageAsset(
                image: BhajanAssets.powerSavageBg,
                width: Device.width,
                height: Device.height,
                fit: BoxFit.cover,
              ),
              Container(
                height: Device.height,
                width: Device.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 3,
                  )
                ]),
                padding: EdgeInsets.only(
                  left: 16.px,
                  right: 16.px,
                  top: Device.height * 0.1.px,
                ),
                child: AppImageAsset(
                  image: BhajanAssets.name,
                  color: controller.textColorChange(),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AbsorbPointer(
                absorbing: true,
                child: AppImageAsset(
                  image: BhajanAssets.god,
                  height: 300.px,
                  width: 300.px,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  width: 140.px,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(50.px)),
                  child: AppText(
                    text: controller.count.toString(),
                    fontColor: BhajanColorConstant.black,
                    fontFamily: AppTheme.poppins,
                    fontSize: 20.px,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 40.px,
          right: 14.px,
          child: InkWell(
            onTap: () {
              if (controller.count != 0) {
                Get.dialog(
                    barrierDismissible: false,
                    Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.px),
                      ),
                      // insetPadding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.px, top: 8.px),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  HapticFeedback.mediumImpact();
                                  gotoBack();
                                },
                                child: Icon(
                                  Icons.cancel,
                                  size: 26.px,
                                ),
                              ),
                            ),
                          ),
                          AppText(
                            text: "Confirmation",
                            fontSize: 26.px,
                            fontColor: BhajanColorConstant.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.px),
                          AppText(
                            text: "Are you sure to reset your\n mantra jaap?",
                            fontSize: 17.px,
                            fontColor: BhajanColorConstant.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.px),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.px),
                                bottomRight: Radius.circular(16.px)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.only(bottomLeft: Radius.circular(16.px)),
                                    onTap: () {
                                      HapticFeedback.mediumImpact();
                                      gotoBack();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 9.px),
                                      color: const Color(0xFF008ABD),
                                      child: Center(
                                          child: AppText(
                                        text: "NO",
                                        fontColor: BhajanColorConstant.whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.px,
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.only(bottomRight: Radius.circular(16.px)),
                                    onTap: () {
                                      HapticFeedback.heavyImpact();
                                      controller.count = 0;
                                      controller.update();
                                      gotoBack();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 9.px),
                                      color: const Color(0xFFF95050),
                                      child: Center(
                                          child: AppText(
                                        text: "YES",
                                        fontColor: BhajanColorConstant.whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.px,
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }
            },
            child: Column(
              children: [
                const AppImageAsset(
                  image: BhajanAssets.reload,
                  color: BhajanColorConstant.whiteColor,
                ),
                SizedBox(height: 5.px),
                AppText(
                  text: AppStringConstants.reset.tr,
                  fontColor: BhajanColorConstant.white,
                  fontFamily: AppTheme.poppins,
                  fontSize: 11.px,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 40.px,
          left: 14.px,
          child: InkWell(
            onTap: () {
              controller.showPowerMode = false;
              controller.update();
            },
            child: Column(
              children: [
                const AppImageAsset(
                  image: BhajanAssets.backArrow,
                  color: BhajanColorConstant.whiteColor,
                ),
                SizedBox(height: 5.px),
                AppText(
                  text: AppStringConstants.back.tr,
                  fontColor: BhajanColorConstant.white,
                  fontFamily: AppTheme.poppins,
                  fontSize: 11.px,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        )
      ],
    );

AppImageAsset mantraJapBgView(MantraJapController controller) => AppImageAsset(
      image: controller.bgImageChange(),
      width: Device.width,
      height: Device.height,
      fit: BoxFit.cover,
    );

InkWell backImageView(MantraJapController controller) => InkWell(
      onTap: () {
        gotoBack();
        controller.player!.stop();
        controller.muteAudio = false;
        controller.update();
      },
      child: Container(
        margin: EdgeInsets.only(top: 30.px, left: 4.px),
        padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
        child: const AppImageAsset(
          image: BhajanAssets.backArrow,
        ),
      ),
    );

SingleChildScrollView mantraJapCalculateView(MantraJapController controller) =>
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: 350.px,
            child: Stack(
              children: [
                Center(
                  child: AppImageAsset(
                    image: controller.machineImageChange(),
                    height: 511.px,
                  ),
                ),
                machineCounterClickView(controller),
                machineResetCounterView(controller),
                machineCounterView(controller),
              ],
            ),
          ),
          SizedBox(
            height: Device.height * 0.23.px,
            width: Device.width,
          )
        ],
      ),
    );

Positioned machineCounterClickView(MantraJapController controller) => Positioned(
      top: 350.px,
      left: 125.px,
      child: Center(
        child: InkWell(
          onTap: () {
            controller.count++;
            HapticFeedback.heavyImpact();
            if (controller.goalCount == controller.count) {
              Get.dialog(
                barrierDismissible: false,
                  Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.px),
                ),
                // insetPadding: const EdgeInsets.all(15),
                child: InkWell(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          const AppImageAsset(image: BhajanAssets.congrats),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                HapticFeedback.mediumImpact();
                                gotoBack();
                              },
                              child: SizedBox(
                                height: 40.px,
                                width: 60.px,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
            }
            controller.update();
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            width: 95.px,
            height: 95.px,
          ),
        ),
      ),
    );

Positioned machineResetCounterView(MantraJapController controller) => Positioned(
      top: 338.px,
      right: 85.px,
      child: Center(
        child: InkWell(
          onTap: () {
            if (controller.count != 0) {
              Get.dialog(
                barrierDismissible: false,
                  Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.px),
                ),
                // insetPadding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.px, top: 8.px),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            gotoBack();
                          },
                          child: Icon(
                            Icons.cancel,
                            size: 26.px,
                          ),
                        ),
                      ),
                    ),
                    AppText(
                      text: "Confirmation",
                      fontSize: 26.px,
                      fontColor: BhajanColorConstant.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.px),
                    AppText(
                      text: "Are you sure to reset your\n mantra jaap?",
                      fontSize: 17.px,
                      fontColor: BhajanColorConstant.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.px),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.px), bottomRight: Radius.circular(16.px)),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.px)),
                              onTap: () {
                                HapticFeedback.mediumImpact();
                                gotoBack();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 9.px),
                                color: const Color(0xFF008ABD),
                                child: Center(
                                  child: AppText(
                                    text: "NO",
                                    fontSize: 18.px,
                                    fontColor: BhajanColorConstant.whiteColor,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.px)),
                              onTap: () {
                                HapticFeedback.heavyImpact();
                                controller.count = 0;
                                controller.update();
                                gotoBack();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 9.px),
                                color: const Color(0xFFF95050),
                                child: Center(
                                  child: AppText(
                                    text: "YES",
                                    fontSize: 18.px,
                                    fontColor: BhajanColorConstant.whiteColor,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            width: 34.px,
            height: 34.px,
          ),
        ),
      ),
    );

Positioned machineCounterView(MantraJapController controller) => Positioned(
      top: 230.px,
      left: 83.px,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.px),
        ),
        alignment: Alignment.centerRight,
        width: 182.px,
        height: 62.px,
        child: SevenSegmentDisplay(
          value: controller.count.toString(),
          size: 2.px,
          backgroundColor: BhajanColorConstant.backgroundColors,
          segmentStyle: HexSegmentStyle(
            enabledColor: BhajanColorConstant.black,
            disabledColor: const Color(0xff35CD34),
            segmentBaseSize: Size(1.px, 5.px),
          ),
        ),
      ),
    );

Positioned mantraJapNavigationView(MantraJapController controller) => Positioned(
      bottom: 16.px,
      left: 0,
      right: 0,
      child: Container(
        height: 46.px,
        padding: EdgeInsets.symmetric(horizontal: 8.px),
        margin: EdgeInsets.symmetric(
          horizontal: 20.px,
          vertical: 16.px,
        ),
        decoration: BoxDecoration(
          color: controller.showBottomBarColor(),
          borderRadius: BorderRadius.circular(60.px),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.muteAudio
                ? commonNavigationImageView(
                    () {
                      HapticFeedback.mediumImpact();
                      controller.muteAudio = false;
                      controller.player!.play();
                      controller.update();
                    },
                    BhajanAssets.mute,
                    color: BhajanColorConstant.whiteColor,
                  )
                : commonNavigationImageView(() {
                    HapticFeedback.mediumImpact();
                    controller.muteAudio = true;
                    controller.player!.pause();
                    controller.update();
                  }, BhajanAssets.audio),
            Container(
              height: 46.px,
              width: 2.px,
              color: const Color(0xFFF7EDD4),
            ),
            commonNavigationImageView(() {
              if (controller.selectedColor == 5) {
                controller.selectedColor = 0;
              } else {
                controller.selectedColor += 1;
              }
              HapticFeedback.mediumImpact();
              controller.update();
            }, BhajanAssets.color),
            Container(
              height: 46.px,
              width: 2.px,
              color: const Color(0xFFF7EDD4),
            ),
            commonNavigationImageView(() {
              HapticFeedback.heavyImpact();
              controller.showPowerMode = true;
              controller.player!.stop();
              controller.update();
            }, BhajanAssets.charge),
            Container(
              height: 46.px,
              width: 2.px,
              color: const Color(0xFFF7EDD4),
            ),
            commonNavigationImageView(() {
              gotoTopUser();
            }, BhajanAssets.leaderBoard),
          ],
        ),
      ),
    );

Container mantraJapSwamiTextView(MantraJapController controller) => Container(
      height: Device.height,
      width: Device.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.2),
          offset: const Offset(1, 1),
          blurRadius: 3,
        )
      ]),
      padding: EdgeInsets.only(
        left: 16.px,
        right: 16.px,
        top: Device.height * 0.1.px,
      ),
      child: AppImageAsset(
        image: BhajanAssets.name,
        color: controller.textColorChange(),
        fit: BoxFit.fill,
      ),
    );

Expanded commonNavigationImageView(GestureTapCallback onTap, String imagePath, {Color? color}) =>
    Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 46.px,
          padding: EdgeInsets.all(10.px),
          child: AppImageAsset(
            image: imagePath,
            height: 25.px,
            width: 25.px,
            color: color,
          ),
        ),
      ),
    );

/// Color Tile
Widget colorTile({required Color color, required GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 36.px,
      width: 36.px,
      padding: EdgeInsets.all(3.px),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.px),
        shape: BoxShape.circle,
      ),
      child: Container(
        height: 30.px,
        width: 30.px,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    ),
  );
}
