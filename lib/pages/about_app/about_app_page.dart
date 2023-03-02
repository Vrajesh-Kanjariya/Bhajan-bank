import 'package:bank/controller/about_app_controller.dart';
import 'package:bank/pages/about_app/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_app_view_model.dart';

AboutAppViewModel? aboutAppViewModel;

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    aboutAppViewModel ?? (aboutAppViewModel = AboutAppViewModel(this));

    return GetBuilder<AboutAppController>(
      init: AboutAppController(),
      builder: (AboutAppController controller) {
        return SafeArea(
            child: Scaffold(
          // appBar:  PreferredSize(
          //     preferredSize: Size.fromHeight(60.px),
          //     child: BhajanBankAppBar(
          //       title: "About App".toUpperCase(),
          //       isShowSwitch: false,
          //       isShowLeading: false,
          //       isInformation: false,
          //       isNotification: false,
          //     )),
          body: aboutAppBodyView(),
        ));
      },
    );
  }
}
