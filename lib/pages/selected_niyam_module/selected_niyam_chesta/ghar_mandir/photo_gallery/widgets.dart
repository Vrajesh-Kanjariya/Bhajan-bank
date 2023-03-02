import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/widgets/app_image_asset.dart';
import '../../../../../app/widgets/app_text.dart';
import '../../../../../app/widgets/app_theme.dart';
import '../../../../../constant/color_constant.dart';
import '../../../../../controller/photo_gallery_screen_controller.dart';
import '../../../../../pages/member/widgets.dart';
import '../../../../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/photo_gallery_screen.dart';

buildPhotoGalleryBodyView(PhotoGalleryScreenController controller) =>
    photoGalleryScreenViewModel!.photoGalleryInfoList.isNotEmpty
        ? MasonryGridView.count(
            padding: EdgeInsets.only(left: 15.px, right: 15.px),
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 8,
            itemCount: photoGalleryScreenViewModel!.photoGalleryInfoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () async {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.px),
                      child: AppImageAsset(
                        image: photoGalleryScreenViewModel!.photoGalleryInfoList[index].firstImage,
                        fit: BoxFit.cover,
                        isWebImage: true,
                        errorWidget: Container(
                          height: 100.px,
                          width: 100.px,
                          color: Colors.indigo,
                        ),
                        placeHolder: const SizedBox(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText(
                            text: photoGalleryScreenViewModel!.photoGalleryInfoList[index].fullName
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.px,
                            letterSpacing: -0.33,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppTheme.baloobhai2,
                            fontColor: BhajanColorConstant.grey),
                      ),
                      AppText(
                          text: photoGalleryScreenViewModel!.photoGalleryInfoList[index].createdAt,
                          fontFamily: AppTheme.baloobhai2,
                          fontStyle: FontStyle.normal,
                          fontSize: 7.px,
                          letterSpacing: -0.025,
                          fontWeight: FontWeight.w400,
                          fontColor: BhajanColorConstant.grey),
                    ],
                  ),
                ],
              );
            },
          )
        : loader(controller.isLoading);
