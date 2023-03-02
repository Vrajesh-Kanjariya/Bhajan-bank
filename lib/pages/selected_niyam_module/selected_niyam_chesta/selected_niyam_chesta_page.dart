import 'package:bank/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/selected_niyam_chesta_page_controller.dart';
import '../../../pages/selected_niyam_module/selected_niyam_chesta/ghar_mandir/ghar_mandir_screen.dart';
import '../../../pages/selected_niyam_module/selected_niyam_chesta/selected_niyam_chesta_page_view_model.dart';
import '../../../pages/selected_niyam_module/selected_niyam_chesta/widgets.dart';

SelectedNiyamChestaPageViewModel? selectedNiyamChestaPageViewModel;

class SelectedNiyamChestaPage extends StatelessWidget {
  const SelectedNiyamChestaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    selectedNiyamChestaPageViewModel ??
        (selectedNiyamChestaPageViewModel = SelectedNiyamChestaPageViewModel(this));
    return GetBuilder(
      init: SelectedNiyamChestaPageController(),
      builder: (SelectedNiyamChestaPageController controller) {
        return selectedNiyamChestaPageViewModel!.informationInfoList!.isTypeStatus == 5
            ?  const GharMandirScreen()
            : WillPopScope(
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
                  body: buildSelectedNiyamChestaBodyView(),
                ),
              );
      },
    );
  }
}
