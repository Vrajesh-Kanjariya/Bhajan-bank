import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/daily_darshan_controller.dart';
import '../../model/daily_darshan_response.dart';
import '../../pages/daily_darshan/daily_darshan_page.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class DailyDarshanViewModel {
  double scale = 1.0;
  double previousScale = 0;
  int currentIndex = 0;
  bool pageIndex = true;
  DailyDarshanPage? dailyDarshanPage;
  DailyDarshanController? dailyDarshanController;
  String registrationId = '';
  DailyDarshanResponse? dailyDarshan;
  DailyDarshanInfoList? dailyDarshanInfoList;
  InfiniteScrollController controller = InfiniteScrollController();
  PageController pageController = PageController();


  DailyDarshanViewModel(this.dailyDarshanPage) {
    Future.delayed(const Duration(milliseconds: 0), () async {
      dailyDarshanController = Get.find<DailyDarshanController>();
      registrationId = await getPrefStringValue(registerIdKey) ?? '';
      await getDailyDarshanData();
    });
  }

  getDailyDarshanData() async {
    dailyDarshan =
        await dailyDarshanController!.getDailyDarshanData({'registered': registrationId});
    if (dailyDarshan != null) {
      dailyDarshanInfoList = dailyDarshan!.info;
    }
    dailyDarshanController!.update();
  }

  downloadImage(List<DarshanImage>? images,int index) async {
    if (await Permission.storage.request().isGranted) {
      Uint8List bytes =
      (await NetworkAssetBundle(Uri.parse(images![index].image))
          .load(images[index].image))
          .buffer
          .asUint8List();

      String dir = '';
      if (Platform.isAndroid) {
        dir = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS);
      } else {
        dir = (await getApplicationDocumentsDirectory()).path;
      }
      File file = File(
          '$dir/${path.basename(images[index].image)}');
      logs('response.bodyBytes------>$bytes');
      logs('file------>$file');
      file.writeAsBytes(bytes);
      successToast('Save successful');
    } else {
      await Permission.storage.status;
    }
  }
}
