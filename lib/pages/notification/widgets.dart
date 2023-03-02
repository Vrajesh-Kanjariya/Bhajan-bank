import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_text.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/notification_controller.dart';
import '../../pages/notification/notification_page.dart';

Container notificationContainer(NotificationController controller) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: BhajanColorConstant.lightWhite,
    child: Padding(
      padding: EdgeInsets.only(left: 15.px, right: 15.px, top: 15.px),
      child: SingleChildScrollView(
        child: Column(
          children: [
            notification1(controller),
            sizedBox(),
            notification2(controller),
            sizedBox(),
            notification3(controller),
            sizedBox(),
            notification4(controller),
          ],
        ),
      ),
    ),
  );
}

SizedBox sizedBox() => SizedBox(
      height: 15.px,
    );

Container notification1(NotificationController controller) => Container(
      height: notificationViewModel!.isIcon == false ? 215.px : 106.px,
      width: 328.px,
      decoration: BoxDecoration(
          color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(22.px)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.px, left: 15.px),
            child: Row(
              children: [
                AppText(
                  text: AppStringConstants.swamiNarayan,
                  fontSize: 15.px,
                  overflow: TextOverflow.ellipsis,
                  fontColor: BhajanColorConstant.black,
                ),
                AppText(
                  text: AppStringConstants.now,
                  fontSize: 10.px,
                  fontColor: BhajanColorConstant.tabBarText,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      notificationViewModel!.isIcon = !notificationViewModel!.isIcon;
                      notificationViewModel!.isVisible = !notificationViewModel!.isVisible;
                      controller.update();
                    },
                    icon: Icon(
                      notificationViewModel!.isIcon == false
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: BhajanColorConstant.notificationArrow,
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 270.px,
                padding: EdgeInsets.only(left: 15.px),
                child: AppText(
                  text: AppStringConstants.notificationText,
                  maxLines: 2,
                  fontColor: BhajanColorConstant.black,
                  fontSize: 13.px,
                ),
              ),
              Container(
                height: 20.px,
                width: 20.px,
                margin: EdgeInsets.only(bottom: 25.px, left: 25.px),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: BhajanColorConstant.primary,
                ),
              ),
            ],
          ),
          Visibility(
            visible: notificationViewModel!.isVisible,
            child: Container(
              height: 100.px,
              decoration: BoxDecoration(
                  color: BhajanColorConstant.lightBlue, borderRadius: BorderRadius.circular(22.px)),
              child: Padding(
                padding: EdgeInsets.only(right: 35.px, bottom: 10.px),
                child: SizedBox(
                  width: 270.px,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.px),
                        child: AppText(
                          text: AppStringConstants.notificationString,
                          maxLines: 4,
                          fontColor: BhajanColorConstant.black,
                          fontSize: 13.px,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

Container notification2(NotificationController controller) => Container(
      height: 106.px,
      width: 328.px,
      decoration: BoxDecoration(
          color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(22.px)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.px, left: 15.px),
            child: Row(
              children: [
                AppText(
                  text: AppStringConstants.swamiNarayan,
                  fontSize: 15.px,
                  overflow: TextOverflow.ellipsis,
                  fontColor: BhajanColorConstant.black,
                ),
                AppText(
                  text: AppStringConstants.now,
                  fontSize: 10.px,
                  fontColor: BhajanColorConstant.tabBarText,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: BhajanColorConstant.notificationArrow,
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 270.px,
                padding: EdgeInsets.only(left: 15.px),
                child: AppText(
                  text: AppStringConstants.notificationText,
                  maxLines: 2,
                  fontColor: BhajanColorConstant.black,
                  fontSize: 13.px,
                ),
              ),
              Container(
                height: 20.px,
                width: 20.px,
                margin: EdgeInsets.only(bottom: 25.px, left: 25.px),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: BhajanColorConstant.primary,
                ),
              ),
            ],
          ),
          // Visibility(
          //   visible: notificationViewModel!.isVisible,
          //   child: Container(
          //     height: 100.px,
          //     decoration: BoxDecoration(
          //         color: BhajanColorConstant.lightBlue,
          //         borderRadius: BorderRadius.circular(22.px)),
          //     child: Padding(
          //       padding: EdgeInsets.only(right: 35.px, bottom: 10.px),
          //       child: SizedBox(
          //         width: 270.px,
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.px),
          //               child: AppText(
          //                 text: AppStringConstants.notificationText,
          //                 maxLines: 4,
          //                 fontColor: BhajanColorConstant.black,
          //                 fontSize: 13.px,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );

Container notification3(NotificationController controller) => Container(
      height: 106.px,
      width: 328.px,
      decoration: BoxDecoration(
          color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(22.px)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.px, left: 15.px),
            child: Row(
              children: [
                AppText(
                  text: AppStringConstants.swamiNarayan,
                  fontSize: 15.px,
                  overflow: TextOverflow.ellipsis,
                  fontColor: BhajanColorConstant.black,
                ),
                AppText(
                  text: AppStringConstants.now,
                  fontSize: 10.px,
                  fontColor: BhajanColorConstant.tabBarText,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: BhajanColorConstant.notificationArrow,
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 270.px,
                padding: EdgeInsets.only(left: 15.px),
                child: AppText(
                  text: AppStringConstants.notificationText,
                  maxLines: 2,
                  fontColor: BhajanColorConstant.black,
                  fontSize: 13.px,
                ),
              ),
            ],
          ),
          // Visibility(
          //   visible: notificationViewModel!.isVisible,
          //   child: Container(
          //     height: 100.px,
          //     decoration: BoxDecoration(
          //         color: BhajanColorConstant.lightBlue,
          //         borderRadius: BorderRadius.circular(22.px)),
          //     child: Padding(
          //       padding: EdgeInsets.only(right: 35.px, bottom: 10.px),
          //       child: SizedBox(
          //         width: 270.px,
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.px),
          //               child: AppText(
          //                 text:
          //                     "આ આઇકન મદદથી તમે એપ્લીકેશનમાં જ તમે તમારા નિયમ પૂર્ણ કરી શકો છો. જેમ કે. - મંત્રજાપ, મંત્રલેખન, વાંચન, વગેરે...",
          //                 maxLines: 4,
          //                 fontColor: BhajanColorConstant.black,
          //                 fontSize: 13.px,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );

Container notification4(NotificationController controller) => Container(
      height: 106.px,
      width: 328.px,
      decoration: BoxDecoration(
          color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(22.px)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.px, left: 15.px),
            child: Row(
              children: [
                AppText(
                  text: AppStringConstants.swamiNarayan,
                  fontSize: 15.px,
                  overflow: TextOverflow.ellipsis,
                  fontColor: BhajanColorConstant.black,
                ),
                AppText(
                  text: AppStringConstants.now,
                  fontSize: 10.px,
                  fontColor: BhajanColorConstant.tabBarText,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: BhajanColorConstant.notificationArrow,
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 270.px,
                padding: EdgeInsets.only(left: 15.px),
                child: AppText(
                  text: AppStringConstants.notificationText,
                  maxLines: 2,
                  fontColor: BhajanColorConstant.black,
                  fontSize: 13.px,
                ),
              ),
            ],
          ),
          // Visibility(
          //   visible: notificationViewModel!.isVisible,
          //   child: Container(
          //     height: 100.px,
          //     decoration: BoxDecoration(
          //         color: BhajanColorConstant.lightBlue,
          //         borderRadius: BorderRadius.circular(22.px)),
          //     child: Padding(
          //       padding: EdgeInsets.only(right: 35.px, bottom: 10.px),
          //       child: SizedBox(
          //         width: 270.px,
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.px),
          //               child: AppText(
          //                 text:
          //                     "આ આઇકન મદદથી તમે એપ્લીકેશનમાં જ તમે તમારા નિયમ પૂર્ણ કરી શકો છો. જેમ કે. - મંત્રજાપ, મંત્રલેખન, વાંચન, વગેરે...",
          //                 maxLines: 4,
          //                 fontColor: BhajanColorConstant.black,
          //                 fontSize: 13.px,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
