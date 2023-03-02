import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../controller/selected_mukha_path_controller.dart';
import '../../../pages/selected_niyam_module/selected_mukha_path/selected_mukha_path_page_view_model.dart';
import '../../../pages/selected_niyam_module/selected_mukha_path/widgets.dart';

SelectedMukhaPathPageViewModel? selectedMukhaPathPageViewModel;

class SelectedMukhaPathPage extends StatelessWidget {
  const SelectedMukhaPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    selectedMukhaPathPageViewModel ??
        (selectedMukhaPathPageViewModel = SelectedMukhaPathPageViewModel(this));
    return GetBuilder<SelectedMukhaPathController>(
      init: SelectedMukhaPathController(),
      builder: (SelectedMukhaPathController controller) {
        return WillPopScope(
          onWillPop: () async {
            selectedMukhaPathPageViewModel = null;
            return true;
          },
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: BhajanBankAppBar(
                  onTap: () {
                    selectedMukhaPathPageViewModel = null;
                    Get.back();
                  },
                  title: selectedMukhaPathPageViewModel!
                      .informationInfoList!.subCatName,
                  isCoin: true,
                  centerTitle: false,
                  isShowSwitch: false,
                  isInformation: true,
                )),
            body: buildMukhaPathBodyView(),
            bottomSheet: buildPageScrollView(),
          ),
        );
      },
    );
  }
}
