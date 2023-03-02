import 'package:bank/constant/color_constant.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

extension SnackBar on String {
  showInfo() {
    Get.snackbar(
      'Info!!',
      this,
      backgroundColor: BhajanColorConstant.appBlack,
      colorText: BhajanColorConstant.appWhite,
    );
  }

  showError() {
    Get.snackbar(
      'Info!!',
      this,
      backgroundColor: BhajanColorConstant.appBlack,
      colorText: BhajanColorConstant.appWhite,
    );
  }

  showSuccess() {
    Get.snackbar(
      'Info!!',
      this,
      backgroundColor: BhajanColorConstant.appBlack,
      colorText: BhajanColorConstant.appWhite,
    );
  }

  shareLink() => Share.share(this);

  copyCode() => Clipboard.setData(ClipboardData(text: this));
}

extension StringCasingExtension on String {
  String stringAsFixed({int? fixValue}) => padLeft(fixValue ?? 2, '0');
}
