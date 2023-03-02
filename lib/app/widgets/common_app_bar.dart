import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/widgets/app_image_asset.dart';
import '../../app/widgets/app_switch.dart';
import '../../app/widgets/app_text.dart';
import '../../app/widgets/app_theme.dart';
import '../../constant/bhajan_assets.dart';
import '../../constant/color_constant.dart';
import '../../routes/app_navigation.dart';

class CommonAppBar extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final bool? isShowSwitch;
  final bool? isShowIcon;
  final double? fontSize;
  final Function()? onTap;
  final bool? isShowAction;
  final bool? isShowLeading;
  final bool? isCoin;
  final bool? isInformation;
  final bool? isEditProfile;

  const CommonAppBar({
    Key? key,
    this.title,
    this.onPressed,
    this.isShowSwitch = false,
    this.fontSize,
    this.onTap,
    this.isShowAction = true,
    this.isShowLeading = true,
    this.isShowIcon = false,
    this.isCoin = false,
    this.isInformation = false,
    this.isEditProfile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: BhajanColorConstant.primary,
      centerTitle: true,
      leading: isShowLeading!
          ? InkWell(
              onTap: onTap ??
                  () {
                    gotoBack();
                  },
              child: Container(
                padding: const EdgeInsets.only(top: 18, right: 18, bottom: 18),
                child: const AppImageAsset(
                  image: BhajanAssets.backArrow,
                ),
              ),
            )
          : const SizedBox(),
      title: Container(
        padding: const EdgeInsets.only(right: 15, top: 5),
        child: AppText(
            fontFamily: AppTheme.poppins,
            text: title!,
            fontSize: fontSize ?? 22,
            fontWeight: FontWeight.w700),
      ),
      actions: (isShowAction!)
          ? [
              if (isShowSwitch!) flutterSwitch(),
              const SizedBox(
                width: 7,
              ),
              if (isCoin!)
                Container(
                  height: 25,
                  width: 80,
                  margin: const EdgeInsets.only(top: 17, bottom: 17),
                  decoration: BoxDecoration(
                      color: BhajanColorConstant.white, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        BhajanAssets.coin,
                        width: 18,
                        height: 18,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          textAlign: TextAlign.start,
                          '99,99999',
                          maxFontSize: 12,
                          style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: BhajanColorConstant.black),
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 1,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                width: 7,
              ),
              if (isInformation!)
                InkWell(
                  onTap: () => goToInformation(),
                  child: const AppImageAsset(
                    image: BhajanAssets.informationIcon,
                  ),
                ),
              const SizedBox(
                width: 7,
              ),
              if (isEditProfile!)
                const AppImageAsset(
                  image: BhajanAssets.editIcon,
                ),
              const SizedBox(
                width: 7,
              ),
            ]
          : [],
    );
  }
}
