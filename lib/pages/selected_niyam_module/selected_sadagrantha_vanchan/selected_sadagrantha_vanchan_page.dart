import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/selected_sadagrantha_vancana_controller.dart';
import '../../../pages/selected_niyam_module/selected_sadagrantha_vanchan/selected_sadagrantha_vanchan_view_model.dart';
import 'widgets.dart';

SelectedSadagranthaVanchanViewModel? selectedSadagranthaVanchanViewModel;

class SelectedSadagranthaVanchanPage extends StatelessWidget {
  const SelectedSadagranthaVanchanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    selectedSadagranthaVanchanViewModel ??
        (selectedSadagranthaVanchanViewModel = SelectedSadagranthaVanchanViewModel(this));
    return GetBuilder<SelectedSadagranthaVancanaController>(
      init: SelectedSadagranthaVancanaController(),
      builder: (SelectedSadagranthaVancanaController controller) {
        return WillPopScope(
          onWillPop: () async {
            selectedSadagranthaVanchanViewModel = null;
            return true;
          },
          child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: BhajanBankAppBar(
                  centerTitle: false,
                  backGroundColor: BhajanColorConstant.primary,
                  isShowSwitch: false,
                  title: AppStringConstants.sadgramthVachna,
                  isInformation: true,
                  isCoin: true,
                  isNotification: true,
                )),
            body: buildSelectedSadagranthaVanchanBodyView(),
          ),
        );
      },
    );
  }
}
