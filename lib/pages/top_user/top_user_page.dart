import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_bar.dart';
import '../../constant/string_constant.dart';
import '../../controller/top_user_controller.dart';
import '../../pages/top_user/top_user_view_model.dart';
import '../../pages/top_user/widgets.dart';
import '../../routes/app_navigation.dart';

TopUserViewModel? topUserViewModel;

class TopUserPage extends StatelessWidget {
  const TopUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    topUserViewModel ?? (topUserViewModel = TopUserViewModel(this));
    return GetBuilder<TopUserController>(
      init: TopUserController(),
      builder: (TopUserController controller) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: BhajanBankAppBar(
                  onTap: () {
                    gotoBack();
                  },
                  isShowSwitch: true,
                  isCoin: true,
                  title: AppStringConstants.topTenUser.tr.toUpperCase(),
                  fontSize: 24.px,
                )),
            body: Column(
              children: [
                const SizedBox(height: 20),
                topUserTabView(),
                const SizedBox(height: 20),
                topUserCategorySelectionView(),
                topUserView(),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<String> userName = [
  ('Hari'),
  ('krishna'),
  ('Shree'),
  ('Pooja'),
  ('Rakesh'),
  ('Devi'),
  ('Hari')
];
List<String> userIndex = [('04'), ('05'), ('06'), ('07'), ('08'), ('09'), ('10')];
