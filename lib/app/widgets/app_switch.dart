import 'package:flutter_switch/flutter_switch.dart';

import '../../constant/color_constant.dart';

FlutterSwitch flutterSwitch() {
  bool status = true;
  return FlutterSwitch(
      borderRadius: 20,
      width: 38,
      height: 21,
      activeColor: BhajanColorConstant.white,
      activeToggleColor: BhajanColorConstant.switchColor,
      toggleSize: 15,
      valueFontSize: 10,
      activeText: 'ગુ',
      inactiveText: '',
      padding: 3.0,
      activeTextColor: BhajanColorConstant.primary,
      value: status,
      showOnOff: true,
      onToggle: (value) {
        status = value;
      });
}
