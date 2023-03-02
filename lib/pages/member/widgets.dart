import 'dart:ui';

import 'package:bank/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_alert_box.dart';
import '../../app/widgets/app_fixed_cross_axis_count_and_height.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_shimmer_class.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../app/widgets/bhajan_loader.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/member_controller.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';
import 'member_page.dart';

Align addMember(BuildContext context) => Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 235.px,
        width: 257.px,
        child: const AppImageAsset(image: BhajanAssets.addMembers),
      ),
    );

Widget memberView(BuildContext context) => GetBuilder<MemberController>(
      builder: (MemberController controller) {
        return GridView.builder(
            padding: const EdgeInsets.only(top: 50.0),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 15.px,
              height: 137.px,
            ),
            itemCount: controller.memInfoList.length >= 3
                ? controller.memInfoList.length
                : controller.memInfoList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  print("controller.memInfoList[index].memberId --> ${controller.memInfoList[index].middleName}");
                  await setPrefStringValue(
                      memberIdKey, controller.memInfoList[index].memberId.toString());
                  await setPrefBoolValue(
                      userSelectedStatusKey, controller.memInfoList[index].isUserSelectedStatus);
                  if (controller.memInfoList[index].isUserSelectedStatus) {
                    goToHome(2);
                  } else {
                    if (await getPrefBoolValue(isUserLoginKey) &&
                        !controller.memInfoList[index].isUserSelectedStatus) {
                      goToNiyam(0);
                    } else {
                      gotoWelcome();
                    }
                  }
                  controller.update();
                },
                child: (controller.memInfoList.length < 3 && index == controller.memInfoList.length)
                    ? Padding(
                        padding: EdgeInsets.only(top: 15.px),
                        child: Visibility(
                          visible: controller.memInfoList.length == 3 ? false : true,
                          child: SizedBox(
                            width: 123.px,
                            height: 123.px,
                            child: InkWell(
                              onTap: () => gotoProfile(isReadOnly: false),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 70.px,
                                    height: 70.px,
                                    child: const AppImageAsset(
                                      image: BhajanAssets.addMember,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  AppText(
                                    text: AppStringConstants.addMember.tr.toUpperCase(),
                                    fontFamily: AppTheme.poppins,
                                    letterSpacing: 0.75,
                                    fontSize: 17.px,
                                    fontWeight: FontWeight.w700,
                                    fontColor: BhajanColorConstant.addMemberGrey,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : memberGridView(context, index, controller),
              );
            });
      },
    );

Column memberGridView(BuildContext context, int index, MemberController controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.isLoading
                ? ShimmerEffectView(width: 136.px, height: 136.px)
                : Container(
                    alignment: Alignment.center,
                    width: 136.px,
                    height: 136.px,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.px),
                        border: Border.all(
                            width: 3.px,
                            color:
                                memberViewModel!.membersId == controller.memInfoList[index].memberId
                                    ? BhajanColorConstant.addSelectMainMemberBorder
                                    : BhajanColorConstant.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      width: 123.px,
                      height: 123.px,
                      decoration: BoxDecoration(
                          color:
                              memberViewModel!.membersId == controller.memInfoList[index].memberId
                                  ? BhajanColorConstant.addSelectMemberBackground
                                  : BhajanColorConstant.white,
                          borderRadius: BorderRadius.circular(18.px),
                          border: Border.all(
                            width: 2,
                            color: memberViewModel!.membersId ==
                                controller.memInfoList[index].memberId
                                ? BhajanColorConstant.addSelectMemberBorder
                                : BhajanColorConstant.primary,
                          )),
                      child: Column(
                        children: [
                          Stack(children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(4.px, 6.px, 6.px, 4.px),
                                child: GestureDetector(
                                    onTap: () {
                                      showDeleteMemberDialog(
                                          context, controller.memInfoList[index].memberId);
                                    },
                                    child: AppImageAsset(
                                      image: BhajanAssets.removeMember,
                                      height: 17.px,
                                      width: 17.px,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.px, 12.px, 8.px, 8.px),
                              child: Container(
                                alignment: Alignment.center,
                                child: ClipOval(
                                  child: controller.memInfoList[index].profileImage != null &&
                                          controller.memInfoList[index].profileImage.isNotEmpty
                                      ? AppImageAsset(
                                          image: controller.memInfoList[index].profileImage,
                                          webWidth: 73.px,
                                          webHeight: 73.px,
                                          fit: BoxFit.fill,
                                          isWebImage: true,
                                        )
                                      : AppImageAsset(
                                          image: BhajanAssets.sahajanand,
                                          fit: BoxFit.fill,
                                          height: 73.px,
                                          width: 73.px,
                                        ),
                                ),
                              ),
                            )
                          ]),
                          controller.isLoading
                              ? ShimmerEffectView(width: 123.px, height: 26.px)
                              : Container(
                                  alignment: Alignment.center,
                                  width: 123.px,
                                  height: 26.px,
                                  decoration: BoxDecoration(
                                      color: memberViewModel!.membersId ==
                                          controller.memInfoList[index].memberId
                                          ? BhajanColorConstant.addSelectMemberBorder
                                          : BhajanColorConstant.primary,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15.px),
                                          bottomRight: Radius.circular(15.px))),
                                  child: AppText(
                                      text:
                                      controller.memInfoList[index].middleName.toString().toCapitalized(),
                                      textAlign: TextAlign.center,
                                      fontFamily: AppTheme.poppins,
                                      letterSpacing: 0.75,
                                      fontSize: 16.px,
                                      fontWeight: FontWeight.w600,
                                      fontColor: BhajanColorConstant.white),
                                ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );

Future<void> showDeleteMemberDialog(BuildContext context, String membersId) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialogBox(
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: AppStringConstants.memberDeleteMsg.tr,
                  textAlign: TextAlign.center,
                  fontSize: 14.px,
                  fontFamily: AppTheme.poppins,
                  fontStyle: FontStyle.normal,
                  fontColor: BhajanColorConstant.black,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Container(
                  width: 249.px,
                  height: 2.px,
                  color: BhajanColorConstant.gray,
                ),
                const SizedBox(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.only(left: 25.px, bottom: 65.px),
                      child: AppText(
                        text: '${AppStringConstants.note.tr}:',
                        fontSize: 16.px,
                        fontFamily: AppTheme.poppins,
                        fontStyle: FontStyle.normal,
                        fontColor: BhajanColorConstant.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppText(
                      text: AppStringConstants.memberDeleteMsgDesc.tr,
                      fontSize: 14.px,
                      fontFamily: AppTheme.poppins,
                      fontStyle: FontStyle.normal,
                      fontColor: BhajanColorConstant.black,
                      fontWeight: FontWeight.w400,
                      maxLines: 4,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.36,
                        height: 46.px,
                        // color: BhajanColorConstant.primary,
                        decoration: BoxDecoration(
                            color: BhajanColorConstant.primary,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.px))),
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              gotoBack();
                            },
                            child: AppText(
                              text: AppStringConstants.no.tr,
                              textAlign: TextAlign.center,
                              fontFamily: AppTheme.poppins,
                              fontStyle: FontStyle.normal,
                              fontSize: 19.px,
                              fontWeight: FontWeight.w600,
                              fontColor: BhajanColorConstant.white,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 46.px,
                        decoration: BoxDecoration(
                            color: BhajanColorConstant.red,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.px))),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () async {
                            gotoBack();
                            await memberViewModel!.deleteMember(membersId);
                          },
                          child: AppText(
                              text: AppStringConstants.yes.tr,
                              textAlign: TextAlign.center,
                              fontStyle: FontStyle.normal,
                              fontSize: 19.px,
                              fontFamily: AppTheme.poppins,
                              fontWeight: FontWeight.w600,
                              fontColor: BhajanColorConstant.white),
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
