import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/widgets/common_app_bar.dart';
import '../../../../controller/selected_niyam_chesta_page_controller.dart';
import '../../../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/widgets.dart';
import '../../../../routes/app_navigation.dart';
import '../selected_niyam_chesta_page.dart';

class GharMandirScreen extends StatelessWidget {
  const GharMandirScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectedNiyamChestaPageController>(
      init: SelectedNiyamChestaPageController(),
      builder: (SelectedNiyamChestaPageController controller) {
        return WillPopScope(
          onWillPop: () async {
            selectedNiyamChestaPageViewModel = null;
            return true;
          },
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: CommonAppBar(
                  onTap: () {
                    selectedNiyamChestaPageViewModel = null;
                    gotoBack();
                  },
                  title: selectedNiyamChestaPageViewModel!.informationInfoList!.subCatName,
                  isCoin: true,
                  isShowSwitch: true,
                  isInformation: true,
                )),
            body: buildGharMandirBodyView(controller),
          ),
        );
      },
    );
  }
}
