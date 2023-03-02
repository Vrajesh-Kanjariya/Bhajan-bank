import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_bar.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/string_constant.dart';
import '../../../controller/rewards_controller.dart';
import '../../../pages/coin/rewards/rewards_view_model.dart';
import '../../../pages/coin/rewards/widgets.dart';
import '../../../routes/app_navigation.dart';

RewardsViewModel? rewardsViewModel;

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rewardsViewModel ?? (rewardsViewModel = RewardsViewModel(this));
    return GetBuilder<RewardsController>(
      init: RewardsController(),
      builder: (RewardsController controller) {
        return SafeArea(
            child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: BhajanBankAppBar(
                      onTap: () {
                        gotoBack();
                      },
                      isShowAction: false,
                      title: AppStringConstants.rewards.tr,
                      backGroundColor: BhajanColorConstant.status,
                    )),
                body: rewardsUi()));
      },
    );
  }
}
