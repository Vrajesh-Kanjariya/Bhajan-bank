import 'dart:io';

import 'package:get/get.dart';

import '../model/photo_gallery_response.dart';
import '../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/photo_gallery/photo_gallery_screen.dart';
import '../services/rest_service.dart';
import '../utils/string_extensions.dart';
import '../utils/utils.dart';

class PhotoGalleryScreenController extends GetxController {
  bool isLoading = false;
  PhotoGalleryResponse? photoGalleryResponse;

  @override
  void onInit() async {
    photoGalleryScreenViewModel!.getArguments();
    disableScreenshot();
    super.onInit();
  }

  Future<PhotoGalleryResponse?> getPhotoGalleryResponse(Map<String, String> map) async {
    try {
      showLoader(true);
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.photoGallery, body: map);
      if (response != null && response.isNotEmpty) {
        photoGalleryResponse = photoGalleryResponseFromJson(response);
      }
    } on SocketException catch (e) {
      logs('Socket exception in niyam history data --> ${e.message}');
      e.message.showError();
    }
    showLoader(false);
    return photoGalleryResponse;
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
