import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/niyam_controller.dart';
import '../../../pages/niyam_module/mukh_path/mukh_path_view_model.dart';
import '../../../pages/niyam_module/mukh_path/widgets.dart';
import '../../../routes/app_navigation.dart';

MukhPathViewModel? mukhPathViewModel;

class MukhPathPage extends StatelessWidget {
  const MukhPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mukhPathViewModel ?? (mukhPathViewModel = MukhPathViewModel(this));
    return GetBuilder<NiyamController>(
      initState: (state) => mukhPathViewModel!.getArguments(),
      builder: (NiyamController controller) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.px),
              child: CommonAppBar(
                isInformation: true,
                isShowSwitch: true,
                title: mukhPathViewModel!.categoryName,
                onTap: () => gotoBack(),
              ),
            ),
            floatingActionButton: floatingActionButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            //body: mukhPathBodyView(controller.isLoading),
          ),
        );
      },
    );
  }
}
