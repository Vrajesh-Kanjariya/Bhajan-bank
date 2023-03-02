import 'package:bank/app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/string_constant.dart';
import '../../controller/member_controller.dart';
import '../../pages/member/member_view_model.dart';
import '../../pages/member/widgets.dart';
import '../../routes/app_navigation.dart';

MemberViewModel? memberViewModel;

class MemberPage extends StatelessWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    memberViewModel ?? (memberViewModel = MemberViewModel(this));
    return GetBuilder<MemberController>(
      init: MemberController(),
      builder: (MemberController controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: BhajanBankAppBar(
                  onTap: () => controller.isLoading ? null : goToHome(1),
                  isShowAction: false,
                  isShowLeading: true,
                  centerTitle: true,
                  title: AppStringConstants.selectMember.tr.toUpperCase(),
                )),
            body: Stack(
              children: [
                addMember(context),
                memberView(context),
                loader(controller.isLoading)
              ],
            ),
          ),
        );
      },
    );
  }
}
