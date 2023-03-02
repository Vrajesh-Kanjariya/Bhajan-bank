import 'package:get/get.dart';

import '../../pages/announcement/announcement_page.dart';

class AnnouncementPageController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    announcementPageViewModel!.getArguments();
  }

}
