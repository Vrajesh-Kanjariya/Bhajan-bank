import 'package:get/get.dart';

import '../../controller/notification_controller.dart';
import '../../pages/notification/notification_page.dart';

class NotificationViewModel{
  bool isIcon = true;
  bool isVisible = false;
  late NotificationPage notificationPage;
  NotificationController? notificationController;
  
  NotificationViewModel(this.notificationPage){
    Future.delayed(const Duration(milliseconds: 300), () async {
      notificationController = Get.find<NotificationController>();
    });
  }
}