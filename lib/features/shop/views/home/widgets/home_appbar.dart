import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/shop/views/home/widgets/cart_menu_icon.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
          // Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white))
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: (){}, iconColor: TColors.white,),
      ],
    );
  }
}