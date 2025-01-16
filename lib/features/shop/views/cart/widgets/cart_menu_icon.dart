import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/views/cart/cart_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({super.key, required this.onPressed, this.iconColor});

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor ?? (dark ? TColors.light : TColors.dark),)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: TColors.dark, borderRadius: BorderRadius.circular(100)),
            child: Obx(() => Center(
              child: Text(ProductsController.instance.cartItemsModel.value.data?.length.toString() ?? "0" , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: .8)),
            )),
          ),
        ),
      ],
    );
  }
}