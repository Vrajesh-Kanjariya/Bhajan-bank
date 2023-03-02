import 'package:bank/app/widgets/app_image_asset.dart';
import 'package:bank/constant/bhajan_assets.dart';
import 'package:bank/constant/color_constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? iconColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final bool isPartial;

  const CustomDropdownButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.isPartial = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: AppText(
            text: hint,
            fontColor: BhajanColorConstant.appBlack.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        value: value,
        items: List.generate(
          dropdownItems.length,
              (index) => DropdownMenuItem<String>(
            value: dropdownItems[index],
            child: Container(
              alignment: valueAlignment,
              child: AppText(
                text: dropdownItems[index],
                fontSize: 14,
                fontColor: BhajanColorConstant.appBlack,
              ),
            ),
          ),
        ),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ??
            AppImageAsset(
              image: BhajanAssets.dropIcon,
              color: iconColor ?? BhajanColorConstant.appBlack,
            ),
        iconSize: iconSize ?? 15,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? double.infinity,
        buttonPadding: buttonPadding ?? const EdgeInsets.only(left: 20, right: 8),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: isPartial ? Colors.transparent : BhajanColorConstant.gray),
            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 10),
        dropdownMaxHeight: dropdownHeight ?? 220,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              color: BhajanColorConstant.white,
              borderRadius: BorderRadius.circular(8),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        offset: offset,
        dropdownOverButton: false,
      ),
    );
  }
}
