import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../pages/coin/coin_page.dart';
import '../../routes/app_navigation.dart';

Container coinPageView() => Container(
      height: Device.height - 85,
      width: Device.width,
      color: BhajanColorConstant.status,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.px),
        child: SingleChildScrollView(
          child: Column(
            children: [
              totalCoin(),
              sizedBox(),
              streakCoin(),
              sizedBox(),
              bonusCoin(),
              sizedBox(),
              rewardDesign(),
              sizedBox(),
            ],
          ),
        ),
      ),
    );

SizedBox sizedBox() => SizedBox(
      height: 20.px,
    );

Container streakCoin() => Container(
      height: 187.px,
      width: 346.px,
      decoration:
          BoxDecoration(color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(17)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 70.px, top: 15.px),
                child: AppText(
                  textAlign: TextAlign.center,
                  text: AppStringConstants.streakCoin,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.px, top: 15.px),
                child: AppImageAsset(
                  image: BhajanAssets.regularCoin,
                  height: 22.px,
                  width: 21.px,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.px, top: 18.px),
                child: AppText(
                  textAlign: TextAlign.center,
                  text: '1,250',
                  fontSize: 16.px,
                  fontWeight: FontWeight.w600,
                  fontColor: BhajanColorConstant.black,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.px),
            alignment: Alignment.center,
            child: AppText(
              textAlign: TextAlign.center,
              text: AppStringConstants.streakWin,
              fontFamily: AppTheme.poppins,
              fontSize: 14.px,
              fontColor: BhajanColorConstant.coinText,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 40.px,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 10.px, right: 10.px),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.px),
                  child: Container(
                      height: 31.px,
                      width: 31.px,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: BhajanColorConstant.status,
                      ),
                      child: AppText(
                        textAlign: TextAlign.center,
                        text: coinViewModel!.day[index],
                        fontSize: 16.px,
                        fontWeight: FontWeight.w700,
                      )),
                );
              },
            ),
          ),
          Container(
            height: 6.px,
            width: 280.px,
            margin: EdgeInsets.only(top: 10.px),
            decoration:
                BoxDecoration(color: BhajanColorConstant.orange, borderRadius: BorderRadius.circular(197.px)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.px),
            alignment: Alignment.center,
            child: AppText(
              text: AppStringConstants.streak,
              fontFamily: AppTheme.poppins,
              fontSize: 20.px,
              fontColor: BhajanColorConstant.red,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

Container bonusCoin() => Container(
      height: 177.px,
      width: 346.px,
      decoration:
          BoxDecoration(color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(17)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppImageAsset(
            image: BhajanAssets.bonus,
            height: 143.px,
            width: 120.px,
          ),
          Column(
            children: [
              SizedBox(
                height: 25.px,
              ),
              AppText(
                text: AppStringConstants.bonusCoin,
                fontSize: 16.px,
                fontFamily: AppTheme.poppins,
                fontColor: BhajanColorConstant.primary,
              ),
              Row(
                children: [
                  AppImageAsset(
                    image: BhajanAssets.regularCoin,
                    height: 24.px,
                    width: 23.px,
                  ),
                  AppText(
                    fontFamily: AppTheme.poppins,
                    textAlign: TextAlign.center,
                    text: '12,580',
                    fontSize: 22.px,
                    fontWeight: FontWeight.w600,
                    fontColor: BhajanColorConstant.black,
                  )
                ],
              ),
              SizedBox(
                height: 15.px,
              ),
              AppText(
                text: AppStringConstants.congrats,
                fontSize: 16.px,
                fontWeight: FontWeight.w600,
                fontColor: BhajanColorConstant.black,
                fontFamily: AppTheme.poppins,
              ),
              SizedBox(
                height: 5.px,
              ),
              SizedBox(
                width: 131.px,
                child: AppText(
                  text: AppStringConstants.earnedCoins,
                  fontSize: 11.px,
                  fontColor: BhajanColorConstant.offGrey,
                  fontFamily: AppTheme.poppins,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );

Stack totalCoin() => Stack(
      children: [
        Container(
          height: 338.px,
          width: 346.px,
          margin: EdgeInsets.only(top: 50.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.px), color: BhajanColorConstant.white),
          child: Column(
            children: [
              Container(
                width: 263.px,
                height: 25.px,
                margin: EdgeInsets.only(top: 40.px),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: BhajanColorConstant.offBlack, borderRadius: BorderRadius.circular(9.px)),
                child: TabBar(
                    controller: coinViewModel!.tabController,
                    padding: EdgeInsets.all(3.px),
                    indicator: BoxDecoration(
                        color: BhajanColorConstant.primary, borderRadius: BorderRadius.circular(9.px)),
                    labelColor: Colors.white,
                    unselectedLabelColor: BhajanColorConstant.primary,
                    tabs: [
                      Tab(
                        child: AppText(
                          text: AppStringConstants.daily.tr,
                          textAlign: TextAlign.center,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppTheme.baloobhai2,
                        ),
                      ),
                      Tab(
                        child: AppText(
                          text: AppStringConstants.monthly.tr,
                          textAlign: TextAlign.center,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppTheme.baloobhai2,
                        ),
                      ),
                      Tab(
                        child: Text(
                          AppStringConstants.yearly.tr,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.balooBhai2(
                            letterSpacing: 0.75,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.px,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(controller: coinViewModel!.tabController, children: [
                  Column(
                    children: [
                      Container(
                        height: 38.px,
                        margin: EdgeInsets.only(left: 20.px, right: 20.px, top: 10.px),
                        decoration: BoxDecoration(
                          color: BhajanColorConstant.greenBG,
                          borderRadius: BorderRadius.circular(8.px),
                          border: Border.all(
                            color: BhajanColorConstant.greenBorder,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: AppText(
                                text: AppStringConstants.streakCoin,
                                fontFamily: AppTheme.poppins,
                                fontSize: 16.px,
                                fontColor: BhajanColorConstant.black,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            AppImageAsset(
                              image: BhajanAssets.regularCoin,
                              height: 22.px,
                              width: 21.px,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15.px, left: 5.px),
                              child: AppText(
                                text: "12,580",
                                textAlign: TextAlign.center,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.px,
                                fontColor: BhajanColorConstant.black,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200.px,
                        margin:
                            EdgeInsets.only(left: 20.px, right: 20.px, top: 10.px, bottom: 10.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.px),
                          border: Border.all(color: BhajanColorConstant.greenBorder),
                        ),
                        child: ListView.builder(
                          itemCount: coinViewModel!.niyam.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: 190.px,
                                  margin: EdgeInsets.only(left: 15.px, top: 5.px),
                                  child: AppText(
                                    text: coinViewModel!.niyam[index],
                                    fontFamily: AppTheme.poppins,
                                    fontSize: 17.px,
                                    fontColor: BhajanColorConstant.black,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                AppImageAsset(
                                  image: BhajanAssets.regularCoin,
                                  height: 16.px,
                                  width: 16.px,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15.px, left: 5.px),
                                  child: AppText(
                                    text: coinViewModel!.niyamCoin[index],
                                    textAlign: TextAlign.center,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.px,
                                    fontColor: BhajanColorConstant.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const Center(
                    child: Text("Yearly"),
                  ),
                  const Center(
                    child: Text("Yearly"),
                  ),
                ]),
              ),
            ],
          ),
        ),
        coinDesign(),
        Positioned(
          top: -10,
          left: 10,
          child: AppImageAsset(
            image: BhajanAssets.firstCoin,
            height: 69.px,
            width: 71.px,
          ),
        ),
      ],
    );

Stack coinDesign() => Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 20.px),
            alignment: Alignment.center,
            width: 245.px,
            height: 62.px,
            decoration: BoxDecoration(
              color: BhajanColorConstant.primary,
              gradient: const LinearGradient(colors: [
                BhajanColorConstant.coinColor,
                BhajanColorConstant.coinColors,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.px, right: 10),
                  child: AppImageAsset(
                    image: BhajanAssets.secondCoin,
                    height: 29.px,
                    width: 35.px,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      text: "60,555",
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      fontSize: 19.px,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppText(
                      text: AppStringConstants.earnedTotalCoin.tr,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      fontSize: 13.px,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.px, bottom: 5.px),
                  child: AppImageAsset(
                    image: BhajanAssets.thirdCoin,
                    height: 35.px,
                    width: 34.px,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

InkWell rewardDesign() => InkWell(
      onTap: () {
        gotoRewards();
      },
      child: Stack(
        children: [
          AppImageAsset(
            image: BhajanAssets.rewards,
            height: 129.px,
            width: 346.px,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.px, left: 15.px, bottom: 5.px),
                child: AppImageAsset(
                  image: BhajanAssets.yourRewards,
                  height: 53.px,
                  width: 108.px,
                ),
              ),
              Container(
                height: 26.px,
                width: 100.px,
                decoration: BoxDecoration(
                    color: BhajanColorConstant.blue, borderRadius: BorderRadius.circular(56.px)),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.px),
                    child: AppImageAsset(
                      image: BhajanAssets.regularCoin,
                      height: 22.px,
                      width: 21.px,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.px),
                    child: AppText(
                      text: "1,250",
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
