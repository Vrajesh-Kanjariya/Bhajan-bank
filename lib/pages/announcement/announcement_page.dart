import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/announcement_page_controller.dart';
import '../../pages/announcement/announcement_page_view_model.dart';
import '../../pages/announcement/widgets.dart';

AnnouncementPageViewModel? announcementPageViewModel;

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    announcementPageViewModel ?? (announcementPageViewModel = AnnouncementPageViewModel(this));
    return GetBuilder(
      init: AnnouncementPageController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: bottomNavigationBar(controller),
            body: buildAnnouncementBodyView(),
          ),
        );
      },
    );
  }
}
