import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/common_app_bar.dart';
import '../../constant/string_constant.dart';
import '../../pages/information/widgets.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.px),
            child: CommonAppBar(
              isInformation: false,
              title: AppStringConstants.information.tr.toUpperCase(),
            )),
        body: Column(
          children: [
            buildPhoneIconView(),
            buildRightIconView(context),
          ],
        ),
      ),
    );
  }
}
