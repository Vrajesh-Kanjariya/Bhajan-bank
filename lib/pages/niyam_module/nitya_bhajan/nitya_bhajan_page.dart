import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/widgets/common_app_bar.dart';
import '../../../controller/niyam_controller.dart';
import '../../../pages/niyam_module/nitya_bhajan/nitya_bhajan_view_model.dart';
import '../../../pages/niyam_module/nitya_bhajan/widgets.dart';
import '../../../routes/app_navigation.dart';

NityaBhajanViewModel? nityaBhajanViewModel;

class NityaBhajanPage extends StatelessWidget {
  const NityaBhajanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    nityaBhajanViewModel ?? (nityaBhajanViewModel = NityaBhajanViewModel(this));
    return GetBuilder<NiyamController>(
        init: NiyamController(),
        builder: (NiyamController controller) {
          return WillPopScope(
            onWillPop: () async {
              nityaBhajanViewModel = null;
              gotoBack();
              return true;
            },
            child: SafeArea(
                child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: CommonAppBar(
                  isInformation: true,
                  isShowSwitch: true,
                  title: nityaBhajanViewModel!
                      .subCategoryInfoList != null ? nityaBhajanViewModel!
                      .subCategoryInfoList![nityaBhajanViewModel!.selectedIndex].subCatName : '',
                  fontSize: 28.px,
                  onTap: () {
                    nityaBhajanViewModel = null;
                    gotoBack();
                  },
                ),
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: nityaBhajanChildView(context),
                  ),
                  loader(controller.isLoading),
                ],
              ),
            )),
          );
        });
  }
}
