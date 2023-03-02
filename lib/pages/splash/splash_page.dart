import 'package:bank/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../constant/bhajan_assets.dart';
import '../../controller/splash_controller.dart';
import '../../pages/splash/splash_view_model.dart';

SplashViewModel? splashViewModel;

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    splashViewModel ?? (splashViewModel = SplashViewModel(this));
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (state) {
        Future.delayed(const Duration(milliseconds: 350), () async {
          splashViewModel!.getSplashData();
        });
      },
      builder: (SplashController controller) {
        return const SafeArea(
          child: Scaffold(
            body: /*splashViewModel!.splashResponse != null &&
                    splashViewModel!.splashResponse!.info!.image!.isNotEmpty
                ? AppImageAsset(
              image: splashViewModel!.splashResponse!.info!.image!,
              isWebImage: true,
              webFit: BoxFit.fill,
              webWidth: double.infinity,
              webHeight: double.infinity,
            ) :*/ AppImageAsset(
              image: BhajanAssets.splashImage,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        );
      },
    );
  }
}
