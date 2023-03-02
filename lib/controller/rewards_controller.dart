import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/coin/rewards/rewards_page.dart';

class RewardsController extends GetxController with GetTickerProviderStateMixin {
  @override
  Future<void> onInit() async {
    super.onInit();
    rewardsViewModel!.tabController = TabController(length: 2, vsync: this);
  }
}
