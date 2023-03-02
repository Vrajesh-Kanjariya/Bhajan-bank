import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/namavali_screen_controller.dart';
import '../../../model/information_response.dart';
import '../../../pages/selected_niyam_module/namavali_screen/namavali_screen.dart';
import '../../../pages/selected_niyam_module/namavali_screen/widgets.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';

class NamavaliScreenViewModel {
  late NamavaliScreen namavaliScreen;
  InformationInfoList? informationInfoList;
  String registrationId = '';
  String membersId = '';
  NamavaliScreenController? namavaliScreenController;
  TabController? tabController;
  bool playButtonBool = false;
  bool bookButtonBool = false;
  bool settButtonBool = false;
  PersistentBottomSheetController? persistentBottomSheetController;
  int selectedColor = 0;
  bool lang = true;

  NamavaliScreenViewModel(this.namavaliScreen) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      namavaliScreenController = Get.find<NamavaliScreenController>();
    });
  }

  getArguments() async {
    informationInfoList = Get.arguments['informationInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  tabControllerIncrease() {
    if (namavaliScreenViewModel!.tabController!.index !=
        namavaliScreenViewModel!.tabController!.length - 1) {
      namavaliScreenController!.activeIndex = namavaliScreenViewModel!.tabController!.index + 1;
      namavaliScreenViewModel!.tabController!.index = namavaliScreenController!.activeIndex;
    }
  }

  tabControllerDecrease() {
    if (namavaliScreenViewModel!.tabController!.index != 0) {
      namavaliScreenController!.activeIndex = namavaliScreenViewModel!.tabController!.index - 1;
      namavaliScreenViewModel!.tabController!.index = namavaliScreenController!.activeIndex;
    }
  }

  playButton() async {
    if (persistentBottomSheetController != null) {
      persistentBottomSheetController!.close();
    }
    settButtonBool = false;
    playButtonBool = !playButtonBool;
    bookButtonBool = false;
    namavaliScreenController!.refresh();
  }

  bookButton() {
    if (persistentBottomSheetController != null) {
      persistentBottomSheetController!.close();
    }
    playButtonBool = false;
    bookButtonBool = !bookButtonBool;
    settButtonBool = false;
    namavaliScreenController!.update();
  }

  settingButton() {
    settButtonBool = true;
    playButtonBool = false;
    bookButtonBool = false;
    namavaliScreenController!.update();
    if (settButtonBool) {
      persistentBottomSheetController = namavaliScreenController!.scaffoldKey.currentState!
          .showBottomSheet<void>((BuildContext context) {
        return editChapter(namavaliScreenController!);
      });
      persistentBottomSheetController!.closed.then((value) {
        settButtonBool = !settButtonBool;
        namavaliScreenController!.update();
      });
    } else {
      Get.back();
      settButtonBool = !settButtonBool;
      namavaliScreenController!.update();
    }
  }

  blackColorApply() {
    selectedColor = 0;
    persistentBottomSheetController!.close();
    namavaliScreenController!.update();
  }

  redColorApply() {
    selectedColor = 1;
    persistentBottomSheetController!.close();
    namavaliScreenController!.update();
  }

  darkRedColorApply() {
    selectedColor = 2;
    persistentBottomSheetController!.close();
    namavaliScreenController!.update();
  }

  blueColorApply() {
    selectedColor = 3;
    persistentBottomSheetController!.close();
    namavaliScreenController!.update();
  }

  showColorApply() {
    switch (selectedColor) {
      case 0:
        return BhajanColorConstant.black;
      case 1:
        return BhajanColorConstant.offRed;
      case 2:
        return BhajanColorConstant.darkRed1;
      case 3:
        return BhajanColorConstant.status;
    }
    namavaliScreenController!.update();
  }

  textSizeIncrease() {
    if (namavaliScreenController!.textSize != 25) {
      namavaliScreenController!.textSize++;
      namavaliScreenController!.update();
    } else {
      errorToast(AppStringConstants.youRichMaxFontSize);
      persistentBottomSheetController!.close();
    }
  }

  textSizeDecrease() {
    if (namavaliScreenController!.textSize != 10) {
      namavaliScreenController!.textSize--;
      namavaliScreenController!.update();
    } else {
      errorToast(AppStringConstants.youRichMinFontSize);
      persistentBottomSheetController!.close();
    }
  }

  rectangleShape() {
    persistentBottomSheetController!.close();
  }

  lineHeightIncrease() {
    if (namavaliScreenController!.lineHeight != 4) {
      namavaliScreenController!.lineHeight++;
      namavaliScreenController!.update();
    } else {
      errorToast(AppStringConstants.youRichMaxLineHeight);
      persistentBottomSheetController!.close();
    }
  }

  lineHeightDecrease() {
    if (namavaliScreenController!.lineHeight != 1) {
      namavaliScreenController!.lineHeight--;
      namavaliScreenController!.update();
    } else {
      errorToast(AppStringConstants.youRichMinLineHeight);
      persistentBottomSheetController!.close();
    }
  }
}
