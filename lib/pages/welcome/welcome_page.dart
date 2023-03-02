import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/welcome_controller.dart';
import '../../pages/welcome/welcome_view_model.dart';

WelcomeViewModel? welcomeViewModel;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    welcomeViewModel ?? (welcomeViewModel = WelcomeViewModel(this));
    return GetBuilder(
      init: WelcomeController(),
      builder: (WelcomeController controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: welcomeViewModel!.chewieController != null ? Chewie(
              controller: welcomeViewModel!.chewieController!,
            ) : Container(),
          ),
        );
      },
    );
  }
}
