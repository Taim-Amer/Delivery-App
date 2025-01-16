import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/common/widgets/icons/circular_icon.dart';
import 'package:delivery_app/common/widgets/images/rounded_image.dart';
import 'package:delivery_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:delivery_app/common/widgets/texts/product_title_text.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/update_cart_dialog.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.name, required this.price, required this.image, required this.productID, required this.availableQuantity, required this.productionDate, required this.expiryDate});

  final String name;
  final int price;
  final String image;
  final int productID;
  final int availableQuantity;
  final String productionDate;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: THelperFunctions.screenWidth(context) - 60,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.dark : TColors.softGrey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(TSizes.md.w),
            child: TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: SizedBox(height: 120, width: 120, child: TRoundedImage(imageUrl: image, applyImageRadius: true, isNetworkImage: true, backgroundColor: dark ? TColors.black : TColors.light)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 172,
                  child: TProductTitleText(title: name, smallSize: false),
                ),
                TBrandTitleWithVerifiedIcon(title: expiryDate),
              ],
            ),
          ),
          TCircularIcon(icon: Iconsax.trash, color: TColors.redColor, size: 20, onPressed: () => ProductsController.instance.deleteCart(productID: productID), backgroundColor: Colors.transparent,),
          TCircularIcon(icon: Iconsax.edit, color: TColors.yellowColor, size: 20, onPressed: () => showUpdateCartDialog(context, productID: productID), backgroundColor: Colors.transparent),
        ],
      ),
    );
  }
}
