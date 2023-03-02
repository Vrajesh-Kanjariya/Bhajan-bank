import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/string_constant.dart';
import '../../app/widgets/app_bar.dart';
import '../../constant/color_constant.dart';
import '../../controller/coin_controller.dart';
import '../../pages/coin/coin_view_model.dart';
import '../../pages/coin/widgets.dart';

CoinViewModel? coinViewModel;

class CoinPage extends StatelessWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    coinViewModel ?? (coinViewModel = CoinViewModel(this));
    return GetBuilder<CoinController>(
      init: CoinController(),
      builder: (CoinController controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: BhajanBankAppBar(
                  centerTitle: false,
                  backGroundColor: BhajanColorConstant.status,
                  isShowSwitch: true,
                  title: AppStringConstants.coin,
                  isInformation: true,
                  isCoin: true,
                  isNotification: true,
                )),
            body: coinPageView(),
          ),
        );
      },
    );
  }
}
