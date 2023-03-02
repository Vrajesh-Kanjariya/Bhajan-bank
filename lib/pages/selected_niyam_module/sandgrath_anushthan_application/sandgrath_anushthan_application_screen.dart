import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../controller/sandgrath_anushthan_application_controller.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_application/sandgrath_anushthan_application_view_model.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_application/widgets.dart';
import '../../../routes/app_navigation.dart';

SandgrathAnushthanApplicationViewModel? sandgrathAnushthanApplicationViewModel;

class SandgrathAnushthanApplicationScreen extends StatelessWidget {
  const SandgrathAnushthanApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sandgrathAnushthanApplicationViewModel ??
        (sandgrathAnushthanApplicationViewModel =
            SandgrathAnushthanApplicationViewModel(this));
    return GetBuilder<SandgrathAnushthanApplicationController>(
      init: SandgrathAnushthanApplicationController(),
      builder: (SandgrathAnushthanApplicationController controller) {
        return WillPopScope(
          onWillPop: () async {
            sandgrathAnushthanApplicationViewModel = null;
            return true;
          },
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.px),
                  child: BhajanBankAppBar(
                    onTap: () {
                      sandgrathAnushthanApplicationViewModel = null;
                      gotoBack();
                    },
                    title: sandgrathAnushthanApplicationViewModel!
                        .informationInfoList!.subCatName,
                    isCoin: true,
                    isShowBack: true,
                    centerTitle: false,
                    isInformation: true,
                    isNotification: false,
                  )),
              body: buildSandgrathAnushthanApplicationBodyView(
                  controller, context)),
        );
      },
    );
  }
}
