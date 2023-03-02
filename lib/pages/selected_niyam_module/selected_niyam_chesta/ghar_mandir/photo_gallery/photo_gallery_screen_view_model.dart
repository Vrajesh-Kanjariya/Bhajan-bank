import 'package:get/get.dart';

import '../../../../../controller/photo_gallery_screen_controller.dart';
import '../../../../../model/photo_gallery_response.dart';
import '../../../../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/photo_gallery_screen.dart';
import '../../../../../utils/shared_preference.dart';
import '../../../../../utils/utils.dart';

class PhotoGalleryScreenViewModel {
  late PhotoGalleryScreen photoGalleryScreen;
  PhotoGalleryResponse? photoGalleryResponse;
  String registrationId = '';
  PhotoGalleryScreenController? photoGalleryScreenController;
  List<PhotoGalleryInfoList> photoGalleryInfoList = [];

  PhotoGalleryScreenViewModel(this.photoGalleryScreen) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      photoGalleryScreenController = Get.find<PhotoGalleryScreenController>();
      getPhotoGalleryData();
    });
  }

  void getArguments() async {
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
  }

  Future<void> getPhotoGalleryData() async {
    photoGalleryResponse =
        await photoGalleryScreenController!.getPhotoGalleryResponse({'registerId': registrationId});
    if (photoGalleryResponse != null) {
      photoGalleryInfoList = photoGalleryResponse!.info;
    } else {
      errorToast(photoGalleryResponse!.msg);
    }
    photoGalleryScreenController!.update();
  }
}
