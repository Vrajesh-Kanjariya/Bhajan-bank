import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';
import '../../pages/profile/profile_view_model.dart';
import '../../pages/profile/widgets.dart';
import '../../routes/app_navigation.dart';

ProfileViewModel? profileViewModel;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    profileViewModel ?? (profileViewModel = ProfileViewModel(this));
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return SafeArea(
          child: WillPopScope(
              onWillPop: () async {
                if (!profileViewModel!.profileStatus && !profileViewModel!.isUpdate) {
                  return false;
                } else {
                  profileViewModel!.currentStep = 0;
                  gotoBack();
                  return true;
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: profileAppBar(context, controller),
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    profileBg(context),
                    profileFormView(context, controller),
                    loader(controller.isLoading)
                  ],
                ),
              )),
        );
      },
    );
  }
}
