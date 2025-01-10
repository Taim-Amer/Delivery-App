import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/personal/widgets/theme_icon.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      actions: [
        Row(
          children: [
            const ThemeIcon(),
            CartCounterIcon(onPressed: (){}, iconColor: TColors.white,),
          ],
        ),
      ],
    );
  }
}