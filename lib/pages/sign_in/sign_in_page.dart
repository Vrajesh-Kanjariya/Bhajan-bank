import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_bar.dart';
import '../../constant/string_constant.dart';
import '../../controller/sign_in_controller.dart';
import '../../pages/sign_in/sign_in_view_model.dart';
import '../../pages/sign_in/widgets.dart';

SignInViewModel? signInViewModel;

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    signInViewModel ?? (signInViewModel = SignInViewModel(this));
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (SignInController controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.px),
              child: BhajanBankAppBar(
                title: AppStringConstants.bhajanBank.tr.toUpperCase(),
                isShowAction: false,
                isShowLeading: false,
                centerTitle: true
              ),
            ),
            body: Stack(
              children: [
                loginBg(),
                phoneVerificationView(context),
                signInButton(),
                loader(controller.isLoading),
              ],
            ),
          ),
        );
      },
    );
  }
}
