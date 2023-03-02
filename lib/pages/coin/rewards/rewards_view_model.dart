import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/bhajan_assets.dart';
import '../../../controller/rewards_controller.dart';
import '../../../pages/coin/rewards/rewards_page.dart';

class RewardsViewModel {
  late RewardsPage rewardsPage;
  TabController? tabController;
  RewardsController? rewardsController;
  double opacity = 0.0;
  List<String> rewardImage = [
    (BhajanAssets.rewards1),
    (BhajanAssets.rewards2),
    (BhajanAssets.rewards3),
    (BhajanAssets.rewards4),
    (BhajanAssets.rewards5),
    (BhajanAssets.rewards6),
  ];

  RewardsViewModel(this.rewardsPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      rewardsController = Get.find<RewardsController>();
    });
  }
}
