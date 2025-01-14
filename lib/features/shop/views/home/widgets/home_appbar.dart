import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/personal/widgets/theme_icon.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/features/shop/views/home/search_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TAppBar(
      actions: [
        Row(
          children: [
            IconButton(onPressed: () => Get.to(() => const SearchScreen()), icon: Icon(Icons.search, color: dark ? TColors.light : TColors.dark,)),
            const ThemeIcon(),
            CartCounterIcon(onPressed: (){}, iconColor: TColors.white,),
          ],
        ),
      ],
    );
  }
}