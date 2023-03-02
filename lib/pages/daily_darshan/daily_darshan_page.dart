import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_bar.dart';
import '../../app/widgets/bhajan_loader.dart';
import '../../controller/daily_darshan_controller.dart';
import '../../pages/daily_darshan/daily_darshan_view_model.dart';
import '../../pages/daily_darshan/widgets.dart';

DailyDarshanViewModel? dailyDarshanViewModel;

class DailyDarshanPage extends StatelessWidget {
  const DailyDarshanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dailyDarshanViewModel ?? (dailyDarshanViewModel = DailyDarshanViewModel(this));
    return GetBuilder<DailyDarshanController>(
      init: DailyDarshanController(),
      builder: (DailyDarshanController controller) {
        return SafeArea(
            child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: BhajanBankAppBar(
                isShowSwitch: true,
                title: dailyDarshanViewModel!.dailyDarshanInfoList != null
                    ? dailyDarshanViewModel!.dailyDarshanInfoList!.title
                    : '',
                isInformation: true,
                isCoin: true,
                centerTitle: false,
                isNotification: true,
              )),
          body: dailyDarshanViewModel!.dailyDarshanInfoList != null
              ? customScrollView()
              : BhajanLoader(loaderSize: 20.px),
          floatingActionButton: floatingActionButton(context),
        ));
      },
    );
  }
}
