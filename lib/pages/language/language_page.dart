import 'package:bank/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_bar.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/language_controller.dart';
import '../../pages/language/language_view_model.dart';
import '../../pages/language/widgets.dart';

LanguageViewModel? languageViewModel;

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logs("runtimeType --> $runtimeType");
    languageViewModel ?? (languageViewModel = LanguageViewModel(this));
    return GetBuilder(
      init: LanguageController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.px),
                child: BhajanBankAppBar(
                  title: AppStringConstants.bhajanBank.tr.toUpperCase(),
                  isShowSwitch: false,
                  isShowLeading: false,
                  isInformation: false,
                  isNotification: false,
                )),
            body: Container(
              height: Device.height,
              width: Device.width,
              color: BhajanColorConstant.backGround,
              child: Stack(
                children: [
                  bgTemple(),
                  buildLanguageButtonView(),
                  buildNextButtonView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
