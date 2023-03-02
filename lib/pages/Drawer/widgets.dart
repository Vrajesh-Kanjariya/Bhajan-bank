import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../app/widgets/bhajan_loader.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/drawer_controller.dart';
import '../../pages/Drawer/drawer_page.dart';
import '../../routes/app_navigation.dart';

InkWell drawerField(DrawerPageController controller,
        {required String imgText,
        required String text,
        required GestureTapCallback onTap,
        required int index}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 45.px,
        padding: EdgeInsets.only(left: 30.px),
        decoration: BoxDecoration(
            color:
                controller.value == index ? BhajanColorConstant.white : BhajanColorConstant.primary,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.px), bottomRight: Radius.circular(24.px))),
        child: Row(
          children: [
            AppImageAsset(
              image: imgText,
              fit: BoxFit.fill,
              width: 18.px,
              height: 18.px,
              color: controller.value == index
                  ? BhajanColorConstant.primary
                  : BhajanColorConstant.white,
            ),
            SizedBox(
              width: 10.px,
            ),
            Expanded(
              child: AppText(
                text: text,
                overflow: TextOverflow.ellipsis,
                letterSpacing: 0.75,
                fontStyle: FontStyle.normal,
                fontSize: 15.px,
                fontWeight: FontWeight.w400,
                fontColor: controller.value == index
                    ? BhajanColorConstant.primary
                    : BhajanColorConstant.white,
                fontFamily: AppTheme.poppins,
              ),
            ),
          ],
        ),
      ),
    );

GetBuilder<DrawerPageController> buildDrawerUserProfile() {
  return GetBuilder<DrawerPageController>(
    initState: (state) {
      final controller = Get.find<DrawerPageController>();
      controller.checkProfileComplete();
    },
    builder: (DrawerPageController controller) {
      return Padding(
        padding: EdgeInsets.only(left: 15.px),
        child: InkWell(
          onTap: () =>
              gotoProfile(isUpdate: true, memberInfoResponse: controller.memberInfoResponse!),
          child: Row(
            children: [
              Column(
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: controller.profileCompleteValue.ceil(),
                    stepSize: 10,
                    selectedColor: BhajanColorConstant.offPink,
                    unselectedColor: BhajanColorConstant.backGround,
                    padding: 0,
                    width: 80.px,
                    height: 80.px,
                    unselectedStepSize: 4,
                    selectedStepSize: 4,
                    roundedCap: (_, __) => true,
                    child: controller.memberInfoResponse != null &&
                            controller.memberInfoResponse!.profileImage.isNotEmpty
                        ? ClipOval(
                            child: AppImageAsset(
                              image: controller.memberInfoResponse!.profileImage,
                              webHeight: 80.px,
                              webWidth: 80.px,
                              isWebImage: true,
                            ),
                          )
                        : ClipOval(
                            child: AppImageAsset(
                              image: BhajanAssets.user,
                              fit: BoxFit.fill,
                              height: 80.px,
                              width: 80.px,
                            ),
                          ),
                  ),
                  Container(
                    width: 40.px,
                    height: 15.px,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: BhajanColorConstant.white,
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    child: AppText(
                        text: "${controller.profileCompleteValue.ceil()}%",
                        fontFamily: AppTheme.poppins,
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 0.75,
                        fontStyle: FontStyle.normal,
                        fontSize: 10.px,
                        fontWeight: FontWeight.w500,
                        fontColor: BhajanColorConstant.primary),
                  )
                ],
              ),
              SizedBox(
                width: 5.px,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.px),
                child: AppText(
                    text: controller.memberInfoResponse != null
                        ? controller.memberInfoResponse!.middleName.toCapitalized()
                        : 'hello',
                    fontFamily: AppTheme.poppins,
                    overflow: TextOverflow.ellipsis,
                    letterSpacing: 0.75,
                    fontStyle: FontStyle.normal,
                    fontSize: 17.px,
                    fontWeight: FontWeight.w600,
                    fontColor: BhajanColorConstant.white),
              ),
              SizedBox(width: 15.px),
            ],
          ),
        ),
      );
    },
  );
}

Expanded buildDrawerNavigationItem(BuildContext context, DrawerPageController controller) =>
    Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            drawerField(controller, imgText: BhajanAssets.homeIcon, text: AppStringConstants.home,
                onTap: () {
              controller.value = 0;
              controller.update();
              goToHome(2);
            }, index: 0),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.prayIcon, text: AppStringConstants.dailyDarshan, onTap: () {
              controller.value = 1;
              gotoDailyDarshan();
              controller.update();
            }, index: 1),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.mantarlekhan, text: AppStringConstants.mantrajap, onTap: () {
              controller.value = 2;
              controller.update();
              gotoMantraJap();
            }, index: 2),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.youPlay, text: AppStringConstants.liveKatha, onTap: () {
              controller.value = 3;
              controller.update();
            }, index: 3),
            SizedBox(height: 5.px),
            drawerField(controller, imgText: BhajanAssets.book, text: AppStringConstants.books,
                onTap: () {
              controller.value = 4;
              controller.update();
            }, index: 4),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.gharsabha, text: AppStringConstants.gharsabha, onTap: () {
              controller.value = 5;
              controller.update();
            }, index: 5),
            SizedBox(height: 5.px),
            Divider(
              endIndent: 50.px,
              thickness: 1.px,
              indent: 30.px,
              color: BhajanColorConstant.white.withOpacity(0.30),
            ),
            drawerField(controller,
                imgText: BhajanAssets.topUser, text: AppStringConstants.topUsers, onTap: () {
              controller.value = 6;
              controller.update();
              gotoTopUser();
            }, index: 6),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.download, text: AppStringConstants.downloads, onTap: () {
              controller.value = 7;
              controller.update();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const DownloadScreen(),
              //     ));
            }, index: 7),
            Divider(
              endIndent: 50.px,
              thickness: 1.px,
              indent: 30.px,
              color: BhajanColorConstant.white.withOpacity(0.30),
            ),
            drawerField(controller,
                imgText: BhajanAssets.aboutApp, text: AppStringConstants.aboutApp, onTap: () {
              controller.value = 8;
              controller.update();
              gotoAboutApp();
            }, index: 8),
            SizedBox(
              height: 5.px,
            ),
            drawerField(controller, imgText: BhajanAssets.aboutUs, text: AppStringConstants.aboutUs,
                onTap: () {
              controller.value = 9;
              controller.update();
            }, index: 9),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.otherApp, text: AppStringConstants.otherApps, onTap: () {
              controller.value = 10;
              controller.update();
            }, index: 10),
            SizedBox(height: 5.px),
            drawerField(controller, imgText: BhajanAssets.share, text: AppStringConstants.shareApps,
                onTap: () {
              controller.value = 11;
              controller.update();
              Share.share(AppStringConstants.shareTitle);
            }, index: 11),
            SizedBox(height: 5.px),
            drawerField(controller,
                imgText: BhajanAssets.addMemberIcon,
                text: AppStringConstants.addMember1, onTap: () {
              controller.value = 12;
              controller.update();
              goToMember();
            }, index: 12),
            drawerField(controller, imgText: BhajanAssets.logout, text: AppStringConstants.logOut,
                onTap: () {
              controller.value = 13;
              controller.update();
              showAlertDialog(context);
            }, index: 13),
            SizedBox(height: 80.px),
            buildDrawerSocialMedia(),
            SizedBox(height: 15.px),
          ],
        ),
      ),
    );

Padding buildDrawerSocialMedia() => Padding(
      padding: EdgeInsets.only(left: 56.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(AppStringConstants.facebookUrl))) {
                      throw 'Could not launch';
                    }
                  },
                  child: const AppImageAsset(image: BhajanAssets.facebook)),
              SizedBox(width: 23.px),
              InkWell(
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(AppStringConstants.instagramUrl))) {
                      throw 'Could not launch';
                    }
                  },
                  child: AppImageAsset(
                    image: BhajanAssets.instagram,
                    fit: BoxFit.fill,
                    height: 26.px,
                    width: 26.px,
                  )),
              SizedBox(width: 23.px),
              InkWell(
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(AppStringConstants.youtubeUrl))) {
                      throw 'Could not launch';
                    }
                  },
                  child: const AppImageAsset(image: BhajanAssets.youtube)),
              SizedBox(width: 23.px),
              const AppImageAsset(image: BhajanAssets.whatsApp),
            ],
          ),
          SizedBox(height: 5.px),
          AppText(
              text: AppStringConstants.drawerCopyrightText,
              fontFamily: AppTheme.poppins,
              letterSpacing: 0.75,
              fontSize: 8.px,
              fontColor: BhajanColorConstant.white),
          AppText(
              text: AppStringConstants.drawerPrivacyText,
              fontFamily: AppTheme.poppins,
              letterSpacing: 0.75,
              fontSize: 6.px,
              fontColor: BhajanColorConstant.white),
        ],
      ),
    );

Future<void> showAlertDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: const EdgeInsets.all(10),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            title: Column(children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppImageAsset(
                      image: BhajanAssets.close,
                      height: 25.px,
                      width: 25.px,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0),
                alignment: Alignment.center,
                child: AppText(
                  letterSpacing: 0.75.px,
                  text: AppStringConstants.confirmation.tr,
                  textAlign: TextAlign.center,
                  fontSize: 20.px,
                  fontFamily: AppTheme.poppins,
                  fontStyle: FontStyle.normal,
                  fontColor: BhajanColorConstant.black,
                  fontWeight: FontWeight.w600,
                ),
              )
            ]),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250.px,
                  child: AppText(
                    text: AppStringConstants.logoutText.tr,
                    textAlign: TextAlign.center,
                    fontSize: 16.px,
                    fontFamily: AppTheme.poppins,
                    fontStyle: FontStyle.normal,
                    fontColor: BhajanColorConstant.black,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 20.px,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => gotoBack(),
                        child: Container(
                          height: 46.px,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.primary,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.px))),
                          alignment: Alignment.center,
                          child: AppText(
                            text: AppStringConstants.no.tr.toUpperCase(),
                            textAlign: TextAlign.center,
                            fontStyle: FontStyle.normal,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            fontColor: BhajanColorConstant.white,
                            fontFamily: AppTheme.poppins,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => drawerViewModel!.logout(),
                        child: Container(
                          height: 46.px,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.red,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.px))),
                          alignment: Alignment.center,
                          child: AppText(
                            text: AppStringConstants.yes.tr.toUpperCase(),
                            textAlign: TextAlign.center,
                            fontStyle: FontStyle.normal,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            fontColor: BhajanColorConstant.white,
                            fontFamily: AppTheme.poppins,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();
