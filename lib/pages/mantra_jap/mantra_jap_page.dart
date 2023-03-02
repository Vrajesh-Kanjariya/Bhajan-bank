import 'package:bank/main.dart';
import 'package:bank/pages/mantra_jap/mantra_jap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/mantra_jap_controller.dart';
import '../../pages/mantra_jap/widgets.dart';

MantraJapViewModel? mantraJapViewModel;

class MantraJapPage extends StatelessWidget {
  const MantraJapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mantraJapViewModel ?? (mantraJapViewModel = MantraJapViewModel(this));
    return GetBuilder(
      init: MantraJapController(),
      builder: (MantraJapController controller) {
        return WillPopScope(
          onWillPop: () {
            musicService.stop();
            controller.muteAudio = false;
            controller.update();
            return Future(() => true);
          },
          child: SafeArea(
            child: Scaffold(
              body: mantraJapBodyView(context, controller),
            ),
          ),
        );
      },
    );
  }
}
