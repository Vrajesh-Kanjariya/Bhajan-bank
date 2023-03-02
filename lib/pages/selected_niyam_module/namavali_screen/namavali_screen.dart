import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../controller/namavali_screen_controller.dart';
import '../../../pages/selected_niyam_module/namavali_screen/namavali_screen_view_model.dart';
import '../../../pages/selected_niyam_module/namavali_screen/widgets.dart';
import '../../../routes/app_navigation.dart';

NamavaliScreenViewModel? namavaliScreenViewModel;

class NamavaliScreen extends StatelessWidget {
  const NamavaliScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    namavaliScreenViewModel ?? (namavaliScreenViewModel = NamavaliScreenViewModel(this));
    return GetBuilder<NamavaliScreenController>(
      init: NamavaliScreenController(),
      builder: (NamavaliScreenController controller) {
        return WillPopScope(
          onWillPop: () async {
            namavaliScreenViewModel = null;
            return true;
          },
          child: Scaffold(
              key: controller.scaffoldKey,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.px),
                  child: BhajanBankAppBar(
                    onTap: () {
                      namavaliScreenViewModel = null;
                      gotoBack();
                    },
                    title: namavaliScreenViewModel!.informationInfoList != null
                        ? namavaliScreenViewModel!.informationInfoList!.subCatName
                        : '',
                    isNotification: false,
                    isInformation: false,
                    centerTitle: false,
                  )),
              body: namavaliBodyView(controller),
              bottomNavigationBar: buildBottomSheetView(controller)),
        );
      },
    );
  }
}
