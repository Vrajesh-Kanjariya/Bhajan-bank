import 'package:bank/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/sadgranth_anushthan_path_controller.dart';
import '../../../pages/selected_niyam_module/sadgranth_anushthan_path/sadgranth_anushthan_path_view_model.dart';
import '../../../pages/selected_niyam_module/sadgranth_anushthan_path/widgets.dart';

SadgranthAnushthanPathViewModel? sadgranthAnushthanPathViewModel;

class SadgranthAnushthanPathPage extends StatelessWidget {
  const SadgranthAnushthanPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sadgranthAnushthanPathViewModel ??
        (sadgranthAnushthanPathViewModel = SadgranthAnushthanPathViewModel(this));
    return GetBuilder<SadgranthAnushthanPathController>(
      init: SadgranthAnushthanPathController(),
      builder: (SadgranthAnushthanPathController controller) {
        return WillPopScope(
          onWillPop: () async {
            sadgranthAnushthanPathViewModel = null;
            return true;
          },
          child: Scaffold(backgroundColor: BhajanColorConstant.cream1,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: BhajanBankAppBar(
                  onTap: () {
                    sadgranthAnushthanPathViewModel = null;
                    Get.back();
                  },
                  title: sadgranthAnushthanPathViewModel!.informationInfoList!.subCatName,
                  isCoin: true,
                  isNotification: false,
                  centerTitle: false,
                  isInformation: true,
                )),
            body: buildBodyView(),
          ),
        );
      },
    );
  }
}
