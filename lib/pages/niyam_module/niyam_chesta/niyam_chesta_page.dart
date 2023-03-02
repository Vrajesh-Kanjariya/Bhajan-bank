import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/niyam_controller.dart';
import '../../../pages/niyam_module/niyam_chesta/niyam_chesta_view_model.dart';
import '../../../pages/niyam_module/niyam_chesta/widgets.dart';
import '../../../routes/app_navigation.dart';

NiyamChestaViewModel? niyamChestaViewModel;

class NiyamChestaPage extends StatelessWidget {
  const NiyamChestaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    niyamChestaViewModel ?? (niyamChestaViewModel = NiyamChestaViewModel(this));
    return GetBuilder<NiyamController>(
      initState: niyamChestaViewModel!.getArguments(),
      builder: (NiyamController controller) {
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              niyamChestaViewModel = null;
              gotoBack();
              return true;
            },
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.px),
                  child: CommonAppBar(
                    isInformation: true,
                    isShowSwitch: true,
                    title: niyamChestaViewModel!
                        .subCategoryInfoList[niyamChestaViewModel!.selectedIndex].subCatName,
                    onTap: () {
                      niyamChestaViewModel = null;
                      gotoBack();
                    },
                  ),
                ),
                body: niyamChestaBodyView(context)),
          ),
        );
      },
    );
  }
}
