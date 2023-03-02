import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_bar.dart';
import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../model/daily_darshan_response.dart';
import '../../pages/daily_darshan/daily_darshan_page.dart';

CustomScrollView customScrollView() => CustomScrollView(
      slivers: [
        sliderSliverAppbar(),
        dateSliverAppbar(),
        dailyImages(),
      ],
    );

SliverAppBar sliderSliverAppbar() => SliverAppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: BhajanColorConstant.white,
    expandedHeight: 165.px,
    flexibleSpace: FlexibleSpaceBar(
        background: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.px),
          child: CarouselSlider(
              items: [
                SizedBox(
                  width: 326.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.px),
                    child: const AppImageAsset(
                      image: 'assets/images/image11.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 326.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.px),
                    child: const AppImageAsset(
                      image: 'assets/images/image12.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 326.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.px),
                    child: const AppImageAsset(
                      image: 'assets/images/image13.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 149,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),
      ],
    )));

SliverAppBar dateSliverAppbar() => SliverAppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: BhajanColorConstant.white,
      pinned: true,
      flexibleSpace: Container(
        height: 29.px,
        margin: EdgeInsets.only(left: 90.px, right: 90.px, top: 20.px),
        decoration: const BoxDecoration(
            color: BhajanColorConstant.grayBG, borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 188.px,
        alignment: Alignment.center,
        child: Center(
          child: AppText(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            text: '19 Aug,2022',
            fontColor: BhajanColorConstant.black,
            fontSize: 22.px,
            fontWeight: FontWeight.w600,
            fontFamily: AppTheme.baloobhai2,
          ),
        ),
      ),
    );

SliverToBoxAdapter dailyImages() => SliverToBoxAdapter(
      child: Container(
        color: BhajanColorConstant.white,
        height: Device.height,
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dailyDarshanViewModel!.dailyDarshanInfoList!.image.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.px),
              child: InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      dailyDarshanViewModel!.pageController =
                          PageController(initialPage: index, viewportFraction: 1.0);
                      dailyDarshanViewModel!.controller =
                          InfiniteScrollController(initialItem: index);
                      return viewImage(dailyDarshanViewModel!.dailyDarshanInfoList!.image, index);
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.px),
                  child: AppImageAsset(
                    image: dailyDarshanViewModel!.dailyDarshanInfoList!.image[index].image,
                    fit: BoxFit.cover,
                    isWebImage: true,
                    placeHolder: const SizedBox(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

Widget viewImage(List<DarshanImage>? images, int index) => StatefulBuilder(
      builder: (context, setState) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.px,
            sigmaY: 10.px,
          ),
          child: SizedBox(
            width: Device.width,
            height: Device.height,
            child: Column(
              children: [
                PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: BhajanBankAppBar(
                      isShowSwitch: true,
                      title: dailyDarshanViewModel!.dailyDarshanInfoList != null
                          ? dailyDarshanViewModel!.dailyDarshanInfoList!.title
                          : '',
                      isInformation: true,
                      isCoin: true,
                      isNotification: true,
                    )),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: BhajanColorConstant.white,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 5),
                                height: 407.px,
                                width: 500.px,
                                padding: EdgeInsets.only(bottom: 15.px),
                                child: AppImageAsset(
                                  image: dailyDarshanViewModel!.pageIndex == false
                                      ? images![index].image
                                      : images![index].image,
                                  webFit: BoxFit.fill,
                                  isWebImage: true,
                                  placeHolder: const SizedBox(),
                                ),
                              ),
                            ),
                            Row(children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8.px),
                                child: AppText(
                                  text: '19 Aug,  2022',
                                  fontFamily: AppTheme.baloobhai2,
                                  fontSize: 21.px,
                                  fontColor: BhajanColorConstant.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () async {
                                    dailyDarshanViewModel!.downloadImage(images, index);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(bottom: 8.px),
                                      child: AppImageAsset(
                                        image: BhajanAssets.imageDownload,
                                        height: 27.px,
                                        width: 27.px,
                                      ))),
                              SizedBox(
                                width: 10.px,
                              ),
                              GestureDetector(
                                onTap: () async {},
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 8.px),
                                    child: AppImageAsset(
                                      image: BhajanAssets.imageShare,
                                      height: 27.px,
                                      width: 27.px,
                                    )),
                              ),
                              SizedBox(
                                width: 20.px,
                              )
                            ])
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                margin: EdgeInsets.only(right: 10.px, top: 15.px),
                                height: 25.px,
                                width: 25.px,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: BhajanColorConstant.black),
                                child: AppImageAsset(
                                  image: BhajanAssets.removeIcon,
                                  height: 15.px,
                                  width: 15.px,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

InkWell floatingActionButton(BuildContext context) => InkWell(
      onTap: () async {
        await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now());
      },
      child: Container(
        height: 50.px,
        width: 150.px,
        decoration: const BoxDecoration(
            color: BhajanColorConstant.primary,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Row(children: [
          SizedBox(width: 10.px),
          AppImageAsset(
            image: BhajanAssets.calender,
            width: 32.px,
            height: 32.px,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 8.px),
          Expanded(
            child: AppText(
              overflow: TextOverflow.ellipsis,
              text: 'Select Date',
              fontSize: 18.px,
              fontFamily: AppTheme.baloobhai2,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );
