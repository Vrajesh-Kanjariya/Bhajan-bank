import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../routes/app_navigation.dart';
import '../../services/connectivity_service.dart';
import '../../utils/shared_preference.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BhajanColorConstant.white,
        bottomNavigationBar: GestureDetector(
          onTap: () async {
            bool isConnect = await ConnectivityService.instance.isConnectNetworkWithMessage();
            if (isConnect) {
              if (await getPrefBoolValue(isUserLoginKey)) {
                goToHome(0);
              } else {
                gotoSignIn();
              }
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: 45.px,
                width: 175.px,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.px)),
                  color: BhajanColorConstant.primary,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 28.px,
                    fontFamily: AppTheme.poppins,
                    fontWeight: FontWeight.w700,
                  ),
                  child: AppText(
                    text: AppStringConstants.refresh.tr.toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.px),
              AppImageAsset(
                image: BhajanAssets.network,
                height: 200.px,
                width: 200.px,
              ),
              DefaultTextStyle(
                  style: const TextStyle(),
                  child: AppText(
                    text: AppStringConstants.noInternet,
                    fontColor: BhajanColorConstant.black,
                    fontSize: 20.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppTheme.poppins,
                  )),
              SizedBox(height: 10.px),
              DefaultTextStyle(
                style: const TextStyle(),
                child: AppText(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  text: AppStringConstants.noInternetMsg,
                  fontColor: const Color(0xff787878),
                  fontSize: 15.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.poppins,
                ),
              ),
              SizedBox(height: 15.px),
              Divider(
                endIndent: 40.px,
                thickness: 1.px,
                indent: 40.px,
                color: const Color(0xffCBCBCB),
              ),
              SizedBox(height: 18.px),
              DefaultTextStyle(
                style: const TextStyle(),
                child: AppText(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  text: AppStringConstants.noInternetGu,
                  fontColor: BhajanColorConstant.black,
                  fontSize: 20.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.baloobhai2,
                ),
              ),
              SizedBox(height: 5.px),
              DefaultTextStyle(
                style: const TextStyle(),
                child: AppText(
                  textAlign: TextAlign.center,
                  text: AppStringConstants.noInternetMsgGu,
                  fontColor: const Color(0xff787878),
                  fontSize: 15.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.baloobhai2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
