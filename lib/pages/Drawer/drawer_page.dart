import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color_constant.dart';
import '../../controller/drawer_controller.dart';
import '../../pages/Drawer/drawer_view_model.dart';
import '../../pages/Drawer/widgets.dart';

DrawerViewModel? drawerViewModel;

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    drawerViewModel ?? (drawerViewModel = DrawerViewModel(this));
    return GetBuilder<DrawerPageController>(
      init: DrawerPageController(),
      global: true,
      autoRemove: false,
      initState: (state) {
        Future.delayed(const Duration(milliseconds: 350),() {
          final drawerController = Get.put(DrawerPageController());
          drawerController.checkProfileComplete(isCalculate: true);
        });
      },
      builder: (DrawerPageController controller) {
        return SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 15.px),
                  buildDrawerUserProfile(),
                  SizedBox(height: 10.px),
                  Divider(
                    endIndent: 50.px,
                    thickness: 1.px,
                    indent: 30.px,
                    color: BhajanColorConstant.white.withOpacity(0.30),
                  ),
                  SizedBox(height: 10.px),
                  buildDrawerNavigationItem(context, controller),
                ],
              ),
              loader(controller.isLoading),
            ],
          ),
        );
      },
    );
  }
}
