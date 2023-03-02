import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/coin/coin_page.dart';

class CoinController extends GetxController with GetTickerProviderStateMixin {

  @override
  Future<void> onInit() async {
    super.onInit();
    coinViewModel!.tabController = TabController(length: 3, vsync: this);
  }
}
