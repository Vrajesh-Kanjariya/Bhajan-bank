import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/widgets/app_bar.dart';
import '../../constant/string_constant.dart';
import '../../controller/notification_controller.dart';
import '../../pages/notification/notification_view_model.dart';
import '../../pages/notification/widgets.dart';

NotificationViewModel? notificationViewModel;

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    notificationViewModel ??
        (notificationViewModel = NotificationViewModel(this));
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (NotificationController controller) {
        return SafeArea(
            child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: BhajanBankAppBar(
                      centerTitle: false,
                      isShowSwitch: true,
                      title: AppStringConstants.notification.tr,
                      isInformation: true,
                      isCoin: true,
                      isNotification: false,
                    )),
                body: notificationContainer(controller)));
      },
    );
  }
}
