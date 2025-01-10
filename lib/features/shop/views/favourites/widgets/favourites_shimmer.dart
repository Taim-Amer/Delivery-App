import 'package:delivery_app/common/styles/spacing_styles.dart';
import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/common/widgets/loaders/shimmer_loader.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesShimmer extends StatelessWidget {
  const FavouritesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(actions: [CartCounterIcon(onPressed: (){})]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: TGridLayout(
          itemCount: 6,
          itemBuilder: (context, index) => Expanded(child: ShimmerLoader(width: 180, height: 300.h)),
        ),
      ),
    );
  }
}
