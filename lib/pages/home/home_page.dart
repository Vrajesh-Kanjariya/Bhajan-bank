import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../pages/home/home_page_view_model.dart';
import '../../../pages/home/widgets.dart';
import '../../constant/color_constant.dart';
import '../../controller/home_page_controller.dart';
import '../Drawer/drawer_page.dart';

HomePageViewModel? homePageViewModel;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    homePageViewModel ?? (homePageViewModel = HomePageViewModel(this));
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (HomePageController controller) {
        return AdvancedDrawer(
          backdropColor: BhajanColorConstant.primary,
          controller: homePageViewModel!.advancedDrawerController,
          animationCurve: Curves.ease,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: BhajanColorConstant.black,
                offset: const Offset(
                  5,
                  5,
                ),
                blurRadius: 10.px,
                spreadRadius: 2.px,
              ), //BoxShadow//BoxShadow
            ],
          ),
          drawer: const DrawerPage(),
          child: Scaffold(
            backgroundColor: BhajanColorConstant.primary,
            appBar: homeAppBars(controller),
            body: homePageBodyView(controller.levelClock, controller.animationController!,controller),
          ),
        );
      },
    );
  }
}
