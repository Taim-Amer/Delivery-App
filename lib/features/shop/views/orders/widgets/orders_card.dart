import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/common/widgets/texts/product_price_text.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/views/orders/widgets/update_order_dialog.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({super.key, required this.price, required this.orderID});

  final int price;
  final int orderID;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: double.infinity,
      // height: 50.h,
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TProductPriceText(price: orderID.toString(), isLarge: false, currencySign: ''),
          TProductPriceText(price: price.toString(), isLarge: true,),
          const Icon(Iconsax.verify, size: 20, color: TColors.greenColor),
          IconButton(
            onPressed: () => ProductsController.instance.deleteOrder(orderID: orderID),
            icon: const Icon(Iconsax.trash, size: 20, color: TColors.redColor),
          ),
          IconButton(
            onPressed: () => showUpdateOrderDialog(context, orderID: orderID),
            icon: const Icon(Iconsax.edit, size: 20, color: TColors.yellowColor),
          ),
        ],
      ),
    );
  }
}
