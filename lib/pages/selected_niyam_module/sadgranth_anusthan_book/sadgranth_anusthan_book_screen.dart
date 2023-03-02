import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../controller/sadgranth_anusthan_book_controller.dart';
import '../../../pages/selected_niyam_module/sadgranth_anusthan_book/sadgranth_anusthan_book_view_model.dart';
import '../../../pages/selected_niyam_module/sadgranth_anusthan_book/widgets.dart';
import '../../../routes/app_navigation.dart';

SadgranthAnusthanBookViewModel? sadgranthAnusthanBookViewModel;

class SadgranthAnusthanBookScreen extends StatelessWidget {
  const SadgranthAnusthanBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sadgranthAnusthanBookViewModel ??
        (sadgranthAnusthanBookViewModel = SadgranthAnusthanBookViewModel(this));
    return GetBuilder<SadgranthAnusthanBookController>(
      init: SadgranthAnusthanBookController(),
      builder: (SadgranthAnusthanBookController controller) {
        return WillPopScope(
          onWillPop: () async {
            sadgranthAnusthanBookViewModel = null;
            return true;
          },
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: BhajanBankAppBar(
                  onTap: () {
                    sadgranthAnusthanBookViewModel = null;
                    gotoBack();
                  },
                  title: sadgranthAnusthanBookViewModel!
                      .informationInfoList!.subCatName,
                  isCoin: true,
                  isShowBack: true,
                  centerTitle: false,
                  isInformation: true,
                  isNotification: false,
                )),
            body: buildSadgranthAnusthanBookBodyView(controller, context),
          ),
        );
      },
    );
  }
}
