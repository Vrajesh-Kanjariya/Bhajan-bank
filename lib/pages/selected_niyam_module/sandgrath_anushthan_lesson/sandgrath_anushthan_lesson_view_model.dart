import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../constant/bhajan_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/sandgrath_anushthan_lesson_controller.dart';
import '../../../model/lesson_response.dart';
import '../../../model/server_response.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_lesson/sandgrath_anushthan_lesson.dart';
import '../../../pages/selected_niyam_module/sandgrath_anushthan_lesson/widgets.dart';
import '../../../routes/app_navigation.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/utils.dart';

class SandgrathAnushthanLessonViewModel {
  late SandgrathAnushthanLesson sandgrathAnushthanLesson;
  List<LessonList> lessonList = [];
  int currentPosition = 0;
  PageController pageController = PageController();
  List<bool> showList = List.filled(2, false);
  SandgrathAnushthanLessonController? sandgrathAnushthanLessonController;
  ServerResponse? serverResponse;
  List<LessonInfoList> lessonInfoList = [];
  String registrationId = '';
  String membersId = '';
  int lessonInfoIndex = 0;
  bool lang = true;
  bool playing = false;
  Duration position = const Duration();
  late AudioPlayer player = AudioPlayer();
  int selectedColor = 0;
  bool playButtonBool = false;
  bool bookButtonBool = false;
  bool settButtonBool = false;
  PersistentBottomSheetController? persistentBottomSheetController;
  ScrollController scrollController = ScrollController();
  bool listLastPosition = false;

  SandgrathAnushthanLessonViewModel(this.sandgrathAnushthanLesson) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      sandgrathAnushthanLessonController = Get.find<SandgrathAnushthanLessonController>();
    });
  }

  getArguments() async {
    lessonList = Get.arguments['lessonList'];
    currentPosition = Get.arguments['lessonIndex'];
    lessonInfoList = Get.arguments['lessonInfoList'];
    registrationId = await getPrefStringValue(registerIdKey) ?? '';
    membersId = await getPrefStringValue(memberIdKey) ?? '';
  }

  Future<void> saveReadButton() async {
    List<Map<String, dynamic>> targetInfo = [];

    Map<String, dynamic> object = {
      "subcatId": lessonList[currentPosition].subcatId,
      "petasubcatId": lessonList[currentPosition].petasubcatId,
      "dailyTarget": '',
      "niyamId": lessonInfoList[lessonInfoIndex].niyamId,
      "lessonId": lessonList[currentPosition].lessonId,
    };
    targetInfo.add(object);
    serverResponse = await sandgrathAnushthanLessonController!.saveDailyNiyamHistory({
      'registerId': registrationId,
      'memberId': membersId,
      'catId': lessonInfoList[0].lessonList[currentPosition].catId,
      "targetInfo": targetInfo
    });

    if (serverResponse != null) {
      if (serverResponse!.status == 1) {
        successToast(serverResponse!.msg);
        Get.back();
      } else {
        errorToast(serverResponse!.msg);
      }
    }
    sandgrathAnushthanLessonController!.update();
  }

  scrollControllerView(){
    scrollController.addListener(() {
      if(scrollController.offset == scrollController.position.maxScrollExtent){
        listLastPosition = true;
      }else {
        listLastPosition = false;
      }
      sandgrathAnushthanLessonController!.refresh();
    });
  }

  playButton() async {
    if (persistentBottomSheetController != null) {
      persistentBottomSheetController!.close();
    }
    settButtonBool = false;
    playButtonBool = !playButtonBool;
    bookButtonBool = false;
    sandgrathAnushthanLessonController!.refresh();
  }

  bookButton() {
    if (persistentBottomSheetController != null) {
      persistentBottomSheetController!.close();
    }
    playButtonBool = false;
    bookButtonBool = !bookButtonBool;
    settButtonBool = false;
    gotoMeaningMahimaHistory(lessonInfoList);
    sandgrathAnushthanLessonController!.update();
  }

  settingButton() {
    settButtonBool = true;
    playButtonBool = false;
    bookButtonBool = false;
    sandgrathAnushthanLessonController!.update();
    if (settButtonBool) {
      persistentBottomSheetController = sandgrathAnushthanLessonController!
          .scaffoldKey.currentState!
          .showBottomSheet<void>((BuildContext context) {
        return editChapter(sandgrathAnushthanLessonController!);
      });
      persistentBottomSheetController!.closed.then((value) {
        settButtonBool = !settButtonBool;
        sandgrathAnushthanLessonController!.update();
      });
    } else {
      Get.back();
      settButtonBool = !settButtonBool;
      sandgrathAnushthanLessonController!.update();
    }
  }

  backPage() {
    if (currentPosition > 0) {
      currentPosition--;
      pageController.jumpToPage(currentPosition);
    }
    sandgrathAnushthanLessonController!.update();
  }

  previousPage() {
    if (currentPosition < lessonList.length - 1) {
      currentPosition++;
      pageController.jumpToPage(currentPosition);
    }
    sandgrathAnushthanLessonController!.update();
  }

  playAudio() async {
    await player.setAsset(BhajanAssets.music);
    player.positionStream.listen((event) {
      position = event;
      sandgrathAnushthanLessonController!.update();
    });
  }

  playerLess() {
    if (position > const Duration(seconds: 0)) {
      player.seek(position - const Duration(seconds: 15));
    }
  }

  playAudioButton() {
    playing = !playing;
    if (playing) {
      player.play();
    } else {
      player.pause();
    }
  }

  blackColorApply() {
    selectedColor = 0;
    persistentBottomSheetController!.close();
    sandgrathAnushthanLessonController!.update();
  }

  redColorApply() {
    selectedColor = 1;
    persistentBottomSheetController!.close();
    sandgrathAnushthanLessonController!.update();
  }

  darkRedColorApply() {
    selectedColor = 2;
    persistentBottomSheetController!.close();
    sandgrathAnushthanLessonController!.update();
  }

  blueColorApply() {
    selectedColor = 3;
    persistentBottomSheetController!.close();
    sandgrathAnushthanLessonController!.update();
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
    sandgrathAnushthanLessonController!.update();
  }

  textSizeIncrease() {
    if (sandgrathAnushthanLessonController!.textSize != 25) {
      sandgrathAnushthanLessonController!.textSize++;
      sandgrathAnushthanLessonController!.update();
    } else {
      errorToast(AppStringConstants.youRichMaxFontSize);
      persistentBottomSheetController!.close();
    }
  }

  textSizeDecrease() {
    if (sandgrathAnushthanLessonController!.textSize != 10) {
      sandgrathAnushthanLessonController!.textSize--;
      sandgrathAnushthanLessonController!.update();
    } else {
      errorToast(AppStringConstants.youRichMinFontSize);
      persistentBottomSheetController!.close();
    }
  }

  rectangleShape() {
    persistentBottomSheetController!.close();
  }

  lineHeightIncrease() {
    if (sandgrathAnushthanLessonController!.lineHeight != 4) {
      sandgrathAnushthanLessonController!.lineHeight++;
      sandgrathAnushthanLessonController!.update();
    } else {
      errorToast(AppStringConstants.youRichMaxLineHeight);
      persistentBottomSheetController!.close();
    }
  }

  lineHeightDecrease() {
    if (sandgrathAnushthanLessonController!.lineHeight != 1) {
      sandgrathAnushthanLessonController!.lineHeight--;
      sandgrathAnushthanLessonController!.update();
    } else {
      errorToast(AppStringConstants.youRichMinLineHeight);
      persistentBottomSheetController!.close();
    }
  }
}
