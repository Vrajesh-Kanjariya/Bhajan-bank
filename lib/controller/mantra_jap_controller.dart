import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../constant/bhajan_assets.dart';
import '../constant/color_constant.dart';

class MantraJapController extends GetxController{
  bool isLoading = false;
  int count = 0;
  bool showColorPicker = false;
  int selectedColor = 0;

  AudioPlayer? player;
  bool muteAudio = false;
  bool showPowerMode = false;
  int goalCount = 10;
  bool isIgnore = false;

  @override
  void onInit() {
    super.onInit();
    initializeAudio();
    playAudio();
  }

  initializeAudio(){
    player = AudioPlayer();
  }

  playAudio() async {
    initializeAudio();
    await player!.setAsset(BhajanAssets.music);
    player!.play();
  }

  /// Color Change
  showBottomBarColor() {
    switch (selectedColor) {
      case 0:
        return BhajanColorConstant.bgColor1;
      case 1:
        return BhajanColorConstant.bgColor2;
      case 2:
        return BhajanColorConstant.bgColor3;
      case 3:
        return BhajanColorConstant.bgColor4;
      case 4:
        return BhajanColorConstant.bgColor5;
      case 5:
        return BhajanColorConstant.bgColor6;
    }
  }

  /// Machine Image Change
  machineImageChange() {
    switch (selectedColor) {
      case 0:
        return BhajanAssets.machine1;
      case 1:
        return BhajanAssets.machine2;
      case 2:
        return BhajanAssets.machine3;
      case 3:
        return BhajanAssets.machine4;
      case 4:
        return BhajanAssets.machine5;
      case 5:
        return BhajanAssets.machine6;
    }
  }

  /// Background Image
  bgImageChange() {
    switch (selectedColor) {
      case 0:
        return BhajanAssets.bg1;
      case 1:
        return BhajanAssets.bg2;
      case 2:
        return BhajanAssets.bg3;
      case 3:
        return BhajanAssets.bg4;
      case 4:
        return BhajanAssets.bg5;
      case 5:
        return BhajanAssets.bg6;
    }
  }

  /// Text Color
  textColorChange() {
    switch (selectedColor) {
      case 0:
        return BhajanColorConstant.bgColor1.withOpacity(0.6);
      case 1:
        return BhajanColorConstant.textColor2;
      case 2:
        return BhajanColorConstant.bgColor1.withOpacity(0.4);
      case 3:
        return BhajanColorConstant.textColor4.withOpacity(0.4);
      case 4:
        return BhajanColorConstant.bgColor1.withOpacity(0.4);
      case 5:
        return BhajanColorConstant.textColor6;
    }
  }

  showLoader(bool val){
    isLoading = val;
    update();
  }
}