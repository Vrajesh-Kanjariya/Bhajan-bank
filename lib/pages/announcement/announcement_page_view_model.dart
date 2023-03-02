import 'package:get/get.dart';

import '../../model/announcement_response.dart';
import '../../pages/announcement/announcement_page.dart';

class AnnouncementPageViewModel {
  AnnouncementPage? announcementPage;
  AnnouncementInfoList? announcementInfoList;
  bool show = false;

  AnnouncementPageViewModel(this.announcementPage);

  getArguments() {
    Map<String, dynamic> arguments = Get.arguments;
    announcementInfoList = arguments['announcementInfoList'];
  }
}
