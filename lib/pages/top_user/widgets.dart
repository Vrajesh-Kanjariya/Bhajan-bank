import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import 'top_user_page.dart';

Container topUserTabView() => Container(
      width: 205.px,
      height: 25.px,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: BhajanColorConstant.offBlack, borderRadius: BorderRadius.circular(9.px)),
      child: TabBar(
          controller: topUserViewModel!.tabController,
          padding: EdgeInsets.all(2.px),
          indicator: BoxDecoration(
              color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(9.px)),
          labelColor: Colors.white,
          unselectedLabelColor: BhajanColorConstant.primary,
          tabs: [
            Tab(
              child: AppText(
                text: AppStringConstants.monthly.tr,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                fontSize: 14.px,
                letterSpacing: 0.75,
                fontWeight: FontWeight.w600,
                fontFamily: AppTheme.baloobhai2,
              ),
            ),
            Tab(
              child: AppText(
                text: AppStringConstants.yearly.tr,
                textAlign: TextAlign.center,
                letterSpacing: 0.75,
                fontStyle: FontStyle.normal,
                fontSize: 14.px,
                fontWeight: FontWeight.w600,
                fontFamily: AppTheme.baloobhai2,
              ),
            ),
          ]),
    );

Stack topUserCategorySelectionView() => Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.px),
          child: AppImageAsset(
            image: BhajanAssets.topCategoryBg,
            height: 45.px,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          child: Container(
            margin: EdgeInsets.only(left: 16.px, top: 7.px, bottom: 7.px),
            width: 6.px,
            decoration: BoxDecoration(
              color: BhajanColorConstant.white,
              borderRadius: BorderRadius.circular(50.px),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 22.px,
          right: 50.px,
          child: Container(
            alignment: Alignment.center,
            child: AppText(
              text: 'જનમંગલ નામાવલી',
              fontSize: 22.px,
              fontFamily: AppTheme.baloobhai2,
              letterSpacing: -0.41.px,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontColor: BhajanColorConstant.white,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 40.px,
          top: 0,
          child: const AppImageAsset(
            image: BhajanAssets.arrowDropDown,
          ),
        ),
      ],
    );

Expanded topUserView() => Expanded(
      child: TabBarView(controller: topUserViewModel!.tabController, children: [
        /// First Tab
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              topUserNameView(),
              topUserCenterView(),
              SizedBox(
                height: 20.px,
              ),
              topUserListView(),
            ],
          ),
        ),

        ///Second Tab
        const Center(
          child: Text("second"),
        ),
      ]),
    );

Container topUserNameView() => Container(
      height: 47.px,
      width: 313.px,
      decoration: BoxDecoration(
          color: BhajanColorConstant.topGrey, borderRadius: BorderRadius.circular(11.px)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.px),
            child: AppText(
              fontFamily: AppTheme.poppins,
              text: '1)',
              fontSize: 17.px,
              fontWeight: FontWeight.w500,
              fontColor: BhajanColorConstant.black,
            ),
          ),
          Container(
            width: 200.px,
            padding: EdgeInsets.only(left: 5.px),
            child: AppText(
              overflow: TextOverflow.ellipsis,
              fontFamily: AppTheme.poppins,
              text: 'Ghanshyam Pande',
              fontSize: 17.px,
              fontWeight: FontWeight.w500,
              fontColor: BhajanColorConstant.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10.px),
            child: AppText(
              fontFamily: AppTheme.poppins,
              text: '10999',
              fontSize: 17.px,
              fontWeight: FontWeight.w500,
              fontColor: BhajanColorConstant.black,
            ),
          ),
        ],
      ),
    );

SizedBox topUserCenterView() => SizedBox(
      height: 320.px,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.px,
                padding: EdgeInsets.only(left: 5.px, top: 20.px),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.px,
                          ),
                          SizedBox(
                            height: 59.px,
                            width: 59.px,
                            child: const ClipOval(
                                child: AppImageAsset(
                              image: BhajanAssets.topUserSwami,
                              fit: BoxFit.fill,
                            )),
                          ),
                          SizedBox(
                            width: 88.px,
                            child: AppText(
                              text: 'Nilkanth',
                              fontSize: 14.px,
                              fontWeight: FontWeight.w500,
                              fontColor: BhajanColorConstant.black,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 139.px,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    AppImageAsset(
                      image: BhajanAssets.topRectangle,
                      height: 190.px,
                      width: 149.px,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.px,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 76.px,
                                width: 76.px,
                                child: const ClipOval(
                                    child: AppImageAsset(
                                  image: BhajanAssets.topUserSwami,
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 65.px),
                              child: Align(
                                alignment: Alignment.center,
                                child: AppImageAsset(
                                  image: BhajanAssets.star,
                                  height: 13.px,
                                  width: 12.px,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 88.px,
                          child: AppText(
                            text: 'Ghanshyam Pande',
                            fontSize: 14.px,
                            fontWeight: FontWeight.w500,
                            fontColor: BhajanColorConstant.black,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 70.px,
                margin: EdgeInsets.only(top: 35.px),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.px,
                          ),
                          SizedBox(
                            height: 59.px,
                            width: 59.px,
                            child: const ClipOval(
                                child: AppImageAsset(
                              image: BhajanAssets.topUserSwami,
                              fit: BoxFit.fill,
                            )),
                          ),
                          SizedBox(
                            width: 88.px,
                            child: AppText(
                              text: 'Hari',
                              fontSize: 14.px,
                              fontWeight: FontWeight.w500,
                              fontColor: BhajanColorConstant.black,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 150.px),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                        height: 146.px,
                        width: 93.px,
                        margin: EdgeInsets.only(top: 20.px),
                        child: Stack(
                          children: [
                            const AppImageAsset(image: BhajanAssets.topRecRight),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 30.px),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppText(
                                        text: "2",
                                        fontSize: 25.px,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTheme.poppins,
                                      ),
                                      AppText(
                                        text: "nd",
                                        fontSize: 16.px,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTheme.poppins,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Container(
                                  height: 28.px,
                                  width: 76.px,
                                  decoration: BoxDecoration(
                                      color: BhajanColorConstant.top2nd,
                                      borderRadius: BorderRadius.circular(7.px)),
                                  child: Center(
                                    child: AppText(
                                      text: "11000",
                                      fontSize: 19.px,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTheme.poppins,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                    height: 166.px,
                    width: 93.px,
                    child: Stack(
                      children: [
                        const AppImageAsset(image: BhajanAssets.topRecCenter),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30.px),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text: "1",
                                    fontSize: 25.px,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTheme.poppins,
                                  ),
                                  AppText(
                                    text: "st",
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTheme.poppins,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.px,
                            ),
                            Container(
                              height: 28.px,
                              width: 76.px,
                              decoration: BoxDecoration(
                                  color: BhajanColorConstant.top1st,
                                  borderRadius: BorderRadius.circular(7.px)),
                              child: Center(
                                child: AppText(
                                  text: "10999",
                                  fontSize: 19.px,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTheme.poppins,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                    height: 128.px,
                    width: 93.px,
                    margin: EdgeInsets.only(top: 35.px),
                    child: Stack(
                      children: [
                        const AppImageAsset(image: BhajanAssets.topRecLeft),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30.px),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text: "3",
                                    fontSize: 25.px,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTheme.poppins,
                                  ),
                                  AppText(
                                    text: "rd",
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTheme.poppins,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.px,
                            ),
                            Container(
                              height: 28.px,
                              width: 76.px,
                              decoration: BoxDecoration(
                                  color: BhajanColorConstant.top3rd,
                                  borderRadius: BorderRadius.circular(7.px)),
                              child: Center(
                                child: AppText(
                                  text: "10999",
                                  fontSize: 19.px,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTheme.poppins,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );

Container topUserListView() => Container(
      height: 600.px,
      padding: EdgeInsets.symmetric(horizontal: 35.px),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.px, top: 10.px),
            child: Row(
              children: [
                SizedBox(
                    height: 52.px,
                    width: 52.px,
                    child: const ClipOval(
                      child: AppImageAsset(
                        image: BhajanAssets.user,
                      ),
                    )),
                SizedBox(
                  width: 10.px,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Rank : ${userIndex[index]}",
                      fontColor: BhajanColorConstant.black,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: userName[index],
                      fontColor: BhajanColorConstant.black,
                      fontSize: 17.px,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
                const Spacer(),
                AppText(
                  text: '10000',
                  fontColor: BhajanColorConstant.black,
                  fontSize: 21.px,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1,
          );
        },
      ),
    );
