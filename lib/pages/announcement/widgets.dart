import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../controller/announcement_page_controller.dart';
import '../../pages/announcement/announcement_page.dart';

SizedBox bottomNavigationBar(AnnouncementPageController controller) => SizedBox(
      height:announcementPageViewModel!.show ? 66.px : 56.px,
      child: Column(children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.px),
            child:announcementPageViewModel!.show ? Container(
              height: 10,
              width: 10,
              color: Colors.yellow,
            ):const SizedBox()),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xFF008ABD),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36.px), topLeft: Radius.circular(36.px))),
          padding: EdgeInsets.symmetric(vertical: 12.px),
          child: InkWell(
              onTap: () {
                announcementPageViewModel!.show = !announcementPageViewModel!.show;
                controller.refresh();
              },
              child: AppImageAsset(
                image: BhajanAssets.setting,
                height: 32.px,
                width: 29.px,
              )),
        )
      ]),
    );

Stack buildAnnouncementBodyView() => Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.teal,
            child: AppImageAsset(
              image: announcementPageViewModel!.announcementInfoList!.image,
              isWebImage: true,
              width: 424.px,
              height: 324.px,
            ),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: Padding(
                  padding: EdgeInsets.only(top: 10.px, left: 15.px),
                  child: AppImageAsset(
                    image: BhajanAssets.backArrow,
                    height: 21.px,
                    width: 12.px,
                    color: Colors.white,
                  )),
            )),
        Container(
          margin: EdgeInsets.only(top: 270.px),
          padding: EdgeInsets.only(top: 15.px, left: 10.px, right: 10.px, bottom: 10.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(31.px), topLeft: Radius.circular(31.px)),
              color: BhajanColorConstant.white),
          child: ListView(
            children: [
              HtmlText(
                fontSize: 10.px,
                text: announcementPageViewModel!.announcementInfoList!.description,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(
              top: 245.px,
            ),
            alignment: Alignment.center,
            width: 221.px,
            height: 50.px,
            decoration: BoxDecoration(
              color: BhajanColorConstant.primary,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 12,
                  color: BhajanColorConstant.primary.withOpacity(0.50),
                )
              ],
            ),
            child: AppText(
              text: announcementPageViewModel!.announcementInfoList!.title,
              textAlign: TextAlign.center,
              fontStyle: FontStyle.normal,
              fontSize: 23.px,
              fontColor: BhajanColorConstant.white,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
