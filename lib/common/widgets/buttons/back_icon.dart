import 'package:delivery_app/common/widgets/icons/circular_icon.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.function});

  final Function()? function;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularIcon(
      icon: Icons.arrow_back_ios_new_outlined,
      size: TSizes.iconSm,
      backgroundColor: Colors.transparent,
      color: dark ? TColors.lightGrey : const Color(0xFF383838),
      onPressed: function ?? () => Get.back(),
    );
  }
}