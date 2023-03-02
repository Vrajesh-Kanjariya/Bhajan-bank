import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/niyam_controller.dart';
import '../../../pages/niyam_module/sadgranth_anusthan/sadgranth_anusthan_view_model.dart';
import '../../../pages/niyam_module/sadgranth_anusthan/widgets.dart';
import '../../../routes/app_navigation.dart';

SadgranthAnusthanViewModel? sadgranthAnusthanViewModel;

class SadgranthAnusthanPage extends StatelessWidget {
  const SadgranthAnusthanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sadgranthAnusthanViewModel ?? (sadgranthAnusthanViewModel = SadgranthAnusthanViewModel(this));
    return GetBuilder<NiyamController>(
      initState: (state) => sadgranthAnusthanViewModel!.getArguments(),
      builder: (NiyamController controller) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.px),
              child: CommonAppBar(
                isShowSwitch: true,
                title: sadgranthAnusthanViewModel!.categoryName,
                onTap: () => gotoBack(),
              ),
            ),
            floatingActionButton: floatingActionButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            // body: sadgranthAnusthanBodyView(controller.isLoading),
          ),
        );
      },
    );
  }
}
