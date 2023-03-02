import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../constant/color_constant.dart';
import '../../../controller/selected_nitya_bhajan_page_controller.dart';
import '../../../pages/selected_niyam_module/selected_nitya_bhajan/selected_nitya_bhajan_view_model.dart';
import '../../../pages/selected_niyam_module/selected_nitya_bhajan/widgets.dart';

SelectedNityaBhajanViewModel? selectedNityaBhajanViewModel;

class SelectedNityaBhajanPage extends StatelessWidget {
  const SelectedNityaBhajanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    selectedNityaBhajanViewModel ??
        (selectedNityaBhajanViewModel = SelectedNityaBhajanViewModel(this));
    return GetBuilder(
      init: SelectedNityaBhajanPageController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            selectedNityaBhajanViewModel = null;
            return true;
          },
          child: Scaffold(
            backgroundColor: BhajanColorConstant.maxDarkWhite,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: BhajanBankAppBar(
                  onTap: () {
                    selectedNityaBhajanViewModel = null;
                    Get.back();
                  },
                  title: selectedNityaBhajanViewModel!.informationInfoList!.subCatName,
                  isCoin: true,
                  isShowBack: true,
                  centerTitle: false,
                  isInformation: true,
                  isNotification: true,
                )),
            body: selectedNityaBhajanBodyView(controller),
          ),
        );
      },
    );
  }
}
