import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/vandu_path_screen_controller.dart';
import '../../../../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/vandu_path_screen_view_model.dart';
import '../../../../pages/selected_niyam_module/selected_nitya_bhajan/vandu_path/widgets.dart';

VanduPathScreenViewModel? vanduPathScreenViewModel;

class VanduPathScreen extends StatelessWidget {
  const VanduPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    vanduPathScreenViewModel ?? (vanduPathScreenViewModel = VanduPathScreenViewModel(this));
    return GetBuilder<VanduPathScreenController>(
      init: VanduPathScreenController(),
      builder: (VanduPathScreenController controller) {
        return WillPopScope(  onWillPop: () async {
          vanduPathScreenViewModel = null;
          return true;
        },
          child: Scaffold(
            body: buildVanduPathBodyView(controller),
              bottomNavigationBar:buildBottomView()
          ),
        );
      },
    );
  }
}
