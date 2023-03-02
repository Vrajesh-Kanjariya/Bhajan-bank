import 'package:bank/constant/bhajan_assets.dart';
import 'package:bank/pages/welcome/welcome_page.dart';
import 'package:bank/routes/app_navigation.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../controller/welcome_controller.dart';

class WelcomeViewModel{
  late WelcomePage welcomePage;
  late VideoPlayerController controller;
  ChewieController? chewieController;
  WelcomeController? welcomeController;

  WelcomeViewModel(this.welcomePage){
    Future.delayed(const Duration(milliseconds: 300),() async {
      welcomeController = Get.find<WelcomeController>();
      await initializePlayer();
    });
  }

  initializePlayer() async {
    final videoPlayerController = VideoPlayerController.asset(BhajanAssets.swaminarayanBhagwan);
    await videoPlayerController.initialize();

    welcomeViewModel!.chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        showControls: false,
        showControlsOnInitialize: false,
        showOptions: false);
    welcomeController!.update();

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position == videoPlayerController.value.duration) {
        welcomeController!.update();
        goToNiyam(2);
      }
    });
  }

}