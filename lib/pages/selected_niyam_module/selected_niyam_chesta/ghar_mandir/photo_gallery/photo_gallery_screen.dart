import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/widgets/common_app_bar.dart';
import '../../../../../constant/string_constant.dart';
import '../../../../../controller/photo_gallery_screen_controller.dart';
import '../../../../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/photo_gallery_screen_view_model.dart';
import '../../../../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/widgets.dart';
import '../../../../../routes/app_navigation.dart';

PhotoGalleryScreenViewModel? photoGalleryScreenViewModel;

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    photoGalleryScreenViewModel ??
        (photoGalleryScreenViewModel = PhotoGalleryScreenViewModel(this));
    return GetBuilder<PhotoGalleryScreenController>(
      init: PhotoGalleryScreenController(),
      builder: (PhotoGalleryScreenController controller) {
        return WillPopScope( onWillPop: () async {
          photoGalleryScreenViewModel = null;
          return true;
        },
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: CommonAppBar(
                  onTap: () {
                    photoGalleryScreenViewModel = null;
                    gotoBack();
                  },
                  title: AppStringConstants.photoGallery.toUpperCase(),
                  fontSize: 24.px,
                )),
            body: buildPhotoGalleryBodyView(controller),
          ),
        );
      },
    );
  }
}
