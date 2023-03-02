import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widgets/app_shimmer_class.dart';

class AppImageAsset extends StatelessWidget {
  final String? image;
  final String? errorImage;
  final bool isWebImage;
  final double? height;
  final double? webHeight;
  final double? width;
  final double? webWidth;
  final Color? color;
  final BoxFit? fit;
  final BoxFit? webFit;
  final EdgeInsetsGeometry? padding;
  final double? loaderSize;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final double? borderRadius;
  final bool isFileImage;
  final Color? webColor;

  const AppImageAsset({
    Key? key,
    @required this.image,
    this.errorImage,
    this.webFit,
    this.fit,
    this.height,
    this.webHeight,
    this.width,
    this.webWidth,
    this.color,
    this.isWebImage = false,
    this.padding,
    this.loaderSize,
    this.placeHolder,
    this.errorWidget,
    this.borderRadius,
    this.isFileImage = false,
    this.webColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isWebImage
        ? CachedNetworkImage(
            imageUrl: image!,
            height: webHeight,
            width: webWidth,
            color: webColor,
            fit: webFit ?? BoxFit.cover,
            placeholder: (context, url) =>
                placeHolder ??
                ShimmerEffectView(
                    width: webWidth ?? double.maxFinite,
                    height: webHeight ?? double.maxFinite,
                    borderRadius: borderRadius ?? 4.px),
            errorWidget: (context, url, error) =>
                errorWidget ??
                Padding(
                  padding: padding ??
                      EdgeInsets.only(left: 30.px, right: 30.px, top: 42.px, bottom: 42.px),
                  child: AppImageAsset(
                    image: errorImage,
                    fit: BoxFit.contain,
                  ),
                ),
          )
        : isFileImage
            ? Image.file(
                File(image!),
                fit: BoxFit.fitWidth,
                height: height,
                width: width,
                color: color,
              )
            : image!.split('.').last != 'svg'
                ? Image.asset(
                    image!,
                    fit: fit,
                    height: height,
                    width: width,
                    color: color,
                  )
                : SvgPicture.asset(
                    image!,
                    height: height,
                    width: width,
                    color: color,
                  );
  }
}
