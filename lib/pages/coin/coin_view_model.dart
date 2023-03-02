import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/coin_controller.dart';
import '../../pages/coin/coin_page.dart';

class CoinViewModel {
  late CoinPage coinPage;
  TabController? tabController;
  CoinController? coinController;

  List<String> niyam = [
    'માળા',
    'મંત્રજાપ',
    'મંત્રલેખન',
    'દંડવત',
    'પ્રદક્ષિણા',
    'જનમંગલ નામાવલી & સ્તોત્રમ',
    'તિલ-ચિહ્નની ઉથલ'
  ];

  List<String> niyamCoin = [
    '12,580',
    '8,456',
    '235',
    '5,266',
    '529',
    '2,069',
    '5,656',
  ];

  List<String> day = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  CoinViewModel(this.coinPage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      coinController = Get.find<CoinController>();
    });
  }
}
