import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../controller/sandgrath_anushthan_lesson_controller.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_lesson/sandgrath_anushthan_lesson_view_model.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_lesson/widgets.dart';
import '../../../routes/app_navigation.dart';

SandgrathAnushthanLessonViewModel? sandgrathAnushthanLessonViewModel;

class SandgrathAnushthanLesson extends StatelessWidget {
  const SandgrathAnushthanLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sandgrathAnushthanLessonViewModel ??
        (sandgrathAnushthanLessonViewModel =
            SandgrathAnushthanLessonViewModel(this));
    return GetBuilder<SandgrathAnushthanLessonController>(
      init: SandgrathAnushthanLessonController(),
      global: true,
      autoRemove: false,
      builder: (SandgrathAnushthanLessonController controller) {
        return WillPopScope(
          onWillPop: () async {
            sandgrathAnushthanLessonViewModel = null;
            return true;
          },
          child: Scaffold(key: controller.scaffoldKey,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.px),
                  child: BhajanBankAppBar(
                    onTap: () {
                      sandgrathAnushthanLessonViewModel = null;
                      gotoBack();
                    },
                    title: sandgrathAnushthanLessonViewModel!
                        .lessonList[
                    sandgrathAnushthanLessonViewModel!.currentPosition]
                        .lesssonName,
                    fontSize: 23.px,
                    centerTitle: false,
                    isCoin: false,
                    isShowBack: true,
                    isInformation: false,
                    isNotification: false,
                  )),
              body: buildSandgrathAnushthanLessonBodyView(controller,context),
              bottomNavigationBar: buildBottomSheetView(controller)
          ),
        );
      },
    );
  }
}
