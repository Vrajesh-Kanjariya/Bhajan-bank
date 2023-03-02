import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/niyam_controller.dart';
import '../../../pages/niyam_module/sadgranth_vanchan/sadgranth_vanchan_view_model.dart';
import '../../../pages/niyam_module/sadgranth_vanchan/widgets.dart';
import '../../../routes/app_navigation.dart';

SadgranthVanchanViewModel? sadgranthVanchanViewModel;

class SadgranthVanchanPage extends StatelessWidget {
  const SadgranthVanchanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sadgranthVanchanViewModel ?? (sadgranthVanchanViewModel = SadgranthVanchanViewModel(this));
    return GetBuilder<NiyamController>(
      initState: (state) => sadgranthVanchanViewModel!.getArguments(),
      builder: (NiyamController controller) {
        return SafeArea(
            child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.px),
            child: CommonAppBar(
              isInformation: true,
              isShowSwitch: true,
              title: sadgranthVanchanViewModel!.categoryName,
              onTap: () {
                gotoBack();
              },
            ),
          ),
          floatingActionButton: floatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         // body: sadgranthVanchanBodyView(controller.isLoading),
        ));
      },
    );
  }
}
