import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_appbar.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card_horizontal.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(actions: [CartCounterIcon(onPressed: (){})],),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: ListView.separated(
          itemBuilder: (context, index) => const ProductCardHorizontal(),
          separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems),
          itemCount: 12,
        ),
      ),
    );
  }
}
