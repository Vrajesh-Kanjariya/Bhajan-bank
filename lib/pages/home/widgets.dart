import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_bar.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_shimmer_class.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/home_page_controller.dart';
import '../../pages/home/home_page.dart';
import '../../routes/app_navigation.dart';

PreferredSizeWidget homeAppBars(HomePageController controller) => PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: BhajanBankAppBar(
      onTap: () {
        homePageViewModel!.handleMenuButtonPressed();
        homePageViewModel!.scaffoldKey.currentState?.openDrawer();
      },
      isShowMenu: true,
      isShowBack: false,
      isShowLeading: true,
      isShowSwitch: true,
      isCoin: true,
      centerTitle: false,
      title: AppStringConstants.home.tr.toUpperCase(),
      fontSize: 24.px,
    ));

RefreshIndicator homePageBodyView(
  int levelClock,
  AnimationController animationController,
  HomePageController controller,
) =>
    RefreshIndicator(
      onRefresh: () => homePageViewModel!.getNiyamData(),
      child: Container(
        color: BhajanColorConstant.white,
        height: Device.height,
        margin: EdgeInsets.only(right: 10.px),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            timeShowUi(levelClock, animationController),
            SliverAppBar(
              pinned: true,
              expandedHeight: 171.px,
              automaticallyImplyLeading: false,
              shadowColor: BhajanColorConstant.transparent,
              backgroundColor: BhajanColorConstant.primary,
              collapsedHeight: 171.px,
              flexibleSpace: Container(
                height: 171.px,
                padding: EdgeInsets.only(top: 10.px),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.px),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5.px),
                    announcementRecipeTitle(),
                    SizedBox(height: 5.px),
                    announcementRecipeUi(controller),
                    SizedBox(height: 5.px),
                    announcementRecipeIndicator(),
                    SizedBox(height: 10.px),
                    niyamEditButton(),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: homePageViewModel!.selectNiyamInfoList.length, (context, index) {
                return Container(
                    color: BhajanColorConstant.white,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(14.px, 2.px, 14.px, 30.px),
                          child: InkWell(
                            onTap: () {
                              homePageViewModel!.selectedNiyamBhajanScreen(index);
                              controller.update();
                            },
                            child: niyamListCard(index),
                          ),
                        ),
                      ),
                      if (homePageViewModel!.selectNiyamInfoList[index].mobileImage.isNotEmpty)
                        niyamListCardMobileImage(index),
                      niyamListCardIsArchiverStatus(index),
                    ]));
              }),
            )
          ],
        ),
      ),
    );

SliverAppBar timeShowUi(int levelClock, AnimationController animationController) => SliverAppBar(
      expandedHeight: 200.px,
      automaticallyImplyLeading: false,
      backgroundColor: BhajanColorConstant.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          height: 200.px,
          color: BhajanColorConstant.white,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: BhajanColorConstant.primary,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
            height: 180.px,
            child: Container(
                height: 150.px,
                width: 326.px,
                decoration: const BoxDecoration(
                    color: BhajanColorConstant.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Countdown(
                  animation: StepTween(
                    begin: levelClock,
                    end: 0,
                  ).animate(animationController),
                )),
          ),
        ),
      ),
    );

Padding announcementRecipeTitle() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppText(
                text: AppStringConstants.homeNiyamText1,
                letterSpacing: 0.75,
                fontStyle: FontStyle.normal,
                fontSize: 16.px,
                fontWeight: FontWeight.w700,
                fontColor: BhajanColorConstant.black),
          ),
          AppText(
              text: '${homePageViewModel!.currentPosition + 1}'
                  '/${homePageViewModel!.announcementInfoList.length}',
              letterSpacing: 0.75,
              fontStyle: FontStyle.normal,
              fontSize: 12.px,
              fontWeight: FontWeight.w400,
              fontColor: BhajanColorConstant.black),
        ],
      ),
    );

SizedBox announcementRecipeUi(HomePageController controller) => SizedBox(
      height: 59.px,
      child: PageView.builder(
          controller: homePageViewModel!.pageController,
          onPageChanged: (position) {
            homePageViewModel!.currentPosition = position;
            controller.refresh();
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.px),
              child: InkWell(
                onTap: () => gotoAnnouncement(homePageViewModel!.announcementInfoList[index]),
                child: Container(
                  width: Device.width * .92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.px),
                      color: BhajanColorConstant.lightGrey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12.px)),
                          child: AppImageAsset(
                            image: homePageViewModel!.announcementInfoList[index].image,
                            isWebImage: true,
                            placeHolder: ShimmerEffectView(height: 59.px),
                            errorWidget: const SizedBox(),
                            fit: BoxFit.cover,
                            height: 100.px,
                            width: 100.px,
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 8.px),
                          child: SizedBox(
                            width: 140.px,
                            child: AppText(
                              text: homePageViewModel!.announcementInfoList[index].shortDescription,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              letterSpacing: 0.75,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.px,
                              fontWeight: FontWeight.w400,
                              fontColor: BhajanColorConstant.black,
                              fontFamily: AppTheme.baloobhai2,
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          alignment: Alignment.center,
                          width: 50.px,
                          height: 20.px,
                          decoration: BoxDecoration(
                              color: BhajanColorConstant.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.px),
                                  bottomRight: Radius.circular(12.px))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.px),
                            child: AppText(
                              text: homePageViewModel!.announcementInfoList[index].tagName,
                              overflow: TextOverflow.ellipsis,
                              letterSpacing: 0.75.px,
                              fontStyle: FontStyle.normal,
                              fontSize: 11.px,
                              fontWeight: FontWeight.w600,
                              fontColor: BhajanColorConstant.white,
                              fontFamily: AppTheme.baloobhai2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: homePageViewModel!.announcementInfoList.length),
    );

Center announcementRecipeIndicator() => Center(
      child: SizedBox(
        height: 5.px,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homePageViewModel!.announcementInfoList.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 4.px,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(70))),
              width: homePageViewModel!.currentPosition == index ? 18 : 5,
            );
          },
        ),
      ),
    );

Padding niyamEditButton() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
              text: AppStringConstants.homeNiyamText,
              fontFamily: AppTheme.baloobhai2,
              letterSpacing: 0.75,
              fontStyle: FontStyle.normal,
              fontSize: 16.px,
              fontWeight: FontWeight.w700,
              fontColor: BhajanColorConstant.black),
          InkWell(
            onTap: () => goToNiyam(0),
            child: AppImageAsset(
              image: BhajanAssets.editPencilIcon,
              width: 56.px,
              height: 24.px,
            ),
          ),
        ],
      ),
    );

Container niyamListCard(int index) => Container(
      height: 109.px,
      decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage(BhajanAssets.homeBackground)),
          color: BhajanColorConstant.hex(homePageViewModel!.selectNiyamInfoList[index].bkColor),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.only(left: 12.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: homePageViewModel!.selectNiyamInfoList[index].subCatName,
                    letterSpacing: 0.75,
                    fontStyle: FontStyle.normal,
                    fontSize: 24.px,
                    fontWeight: FontWeight.w700,
                    fontColor: BhajanColorConstant.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.px),
                    child: AppText(
                      text:
                          homePageViewModel!.selectNiyamInfoList[index].niyamSelectShortDescription,
                      letterSpacing: 0.75,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w400,
                      fontColor: BhajanColorConstant.offWhiteBlack,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 3.px),
              child: AppImageAsset(
                  image: homePageViewModel!.selectNiyamInfoList[index].mainImage,
                  webHeight: 90.px,
                  fit: BoxFit.contain,
                  isWebImage: true,
                  placeHolder: const SizedBox(),
                  errorWidget: SizedBox(
                    height: 10.px,
                    width: 10.px,
                  )),
            )
          ],
        ),
      ),
    );

Positioned niyamListCardMobileImage(int index) => Positioned(
    left: 20,
    bottom: 10,
    child: Container(
        alignment: Alignment.bottomLeft,
        child: InkWell(
            child: AppImageAsset(
                image: homePageViewModel!.selectNiyamInfoList[index].mobileImage,
                webHeight: 39.px,
                webWidth: 39.px,
                fit: BoxFit.fill,
                isWebImage: true,
                placeHolder: const ShimmerEffectView(borderRadius: 20),
                errorWidget: SizedBox(
                  height: 10.px,
                  width: 10.px,
                )))));

Visibility niyamListCardIsArchiverStatus(int index) => Visibility(
    visible: homePageViewModel!.selectNiyamInfoList[index].isArchiverStatus,
    child: Positioned(
        left: homePageViewModel!.selectNiyamInfoList[index].mobileImage == '' ? 20.px : 60.px,
        bottom: 13.px,
        child: Container(
            alignment: Alignment.bottomLeft,
            child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 5,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: BhajanColorConstant.white,
                  child: AppImageAsset(
                      image: BhajanAssets.rightClick,
                      width: 26.px,
                      height: 26.px,
                      fit: BoxFit.fill),
                )))));

class Countdown extends AnimatedWidget {
  Countdown({Key? key, this.animation}) : super(key: key, listenable: animation!);
  final Animation<int>? animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String timerText =
        '${clockTimer.inDays}/${twoDigits(clockTimer.inHours.remainder(24))}:${twoDigits(clockTimer.inMinutes.remainder(60))}:${twoDigits(clockTimer.inSeconds.remainder(60))}';
    return timerText != '00:00'
        ? Padding(
            padding: EdgeInsets.only(top: 15.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        AppText(
                          height: 0.7.px,
                          text: '${clockTimer.inDays}/',
                          fontSize: 48.px,
                          fontFamily: AppTheme.poppins,
                        ),
                        AppText(
                          text: AppStringConstants.day.tr,
                          fontSize: 11.px,
                          fontFamily: AppTheme.poppins,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          height: 0.7.px,
                          text: '${twoDigits(clockTimer.inHours.remainder(24))}:',
                          fontSize: 48.px,
                          fontFamily: AppTheme.poppins,
                        ),
                        AppText(
                          text: AppStringConstants.hours.tr,
                          fontSize: 11.px,
                          fontFamily: AppTheme.poppins,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          height: 0.7.px,
                          text: '${twoDigits(clockTimer.inMinutes.remainder(60))}:',
                          fontSize: 48.px,
                          fontFamily: AppTheme.poppins,
                        ),
                        AppText(
                          text: AppStringConstants.minute.tr,
                          fontSize: 11.px,
                          fontFamily: AppTheme.poppins,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          height: 0.7.px,
                          text: twoDigits(clockTimer.inSeconds.remainder(60)),
                          fontSize: 48.px,
                          fontFamily: AppTheme.poppins,
                        ),
                        AppText(
                          text: AppStringConstants.second.tr,
                          fontSize: 11.px,
                          fontFamily: AppTheme.poppins,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        // Center(
        //         child: SevenSegmentDisplay(
        //         value: timerText,
        //         size: 3.8,
        //         backgroundColor: BhajanColorConstant.white,
        //         segmentStyle: HexSegmentStyle(
        //           enabledColor: BhajanColorConstant.black,
        //           disabledColor: BhajanColorConstant.black.withOpacity(0.1),
        //           segmentBaseSize: const Size(0.8, 4.0),
        //         ),
        //       ))
        : const SizedBox();
  }
}
