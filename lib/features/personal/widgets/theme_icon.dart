import 'package:delivery_app/common/widgets/icons/circular_icon.dart';
import 'package:delivery_app/features/personal/controllers/settings_controller.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularIcon(
      icon: dark ? Icons.sunny : Icons.nightlight_outlined,
      size: TSizes.iconMd,
      color: dark ? TColors.yellowColor : const Color(0xFF353535),
      backgroundColor: Colors.transparent,
      // width: 34.w,
      // height: 34.h,
      // radius: 14.r,
      onPressed: () => SettingsController.instance.updateThemeMode(dark ? ThemeMode.light : ThemeMode.dark),
    );
  }
}
