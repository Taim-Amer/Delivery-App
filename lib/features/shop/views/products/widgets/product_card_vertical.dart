import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/views/products/product_details_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:delivery_app/common/styles/shadows.dart';
import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/common/widgets/icons/circular_icon.dart';
import 'package:delivery_app/common/widgets/images/rounded_image.dart';
import 'package:delivery_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:delivery_app/common/widgets/texts/product_price_text.dart';
import 'package:delivery_app/common/widgets/texts/product_title_text.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.name, required this.price, required this.image, required this.productID, required this.availableQuantity, required this.productionDate, required this.expiryDate});

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
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.dark : TColors.white
      ),
      child: Column(
        children: [
          TRoundedContainer(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                TRoundedImage(imageUrl: image, applyImageRadius: true, isNetworkImage: true, onPressed: () => Get.to(() => ProductDetailsScreen(productID: productID, name: name, price: price, availableQuantity: availableQuantity, imageProduct: image, productionDate: productionDate, expiryDate: expiryDate))),
                Positioned(
                  bottom: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Obx(() => TCircularIcon(
                    icon: ProductsController.instance.isFavourite.value
                        ? Iconsax.heart5
                        : Iconsax.heart,
                    color: ProductsController.instance.isFavourite.value
                        ? Colors.red
                        : Colors.grey,
                    width: 40,
                    height: 40,
                    backgroundColor: dark ? TColors.darkerGrey : TColors.light,
                    onPressed: () {
                      if (ProductsController.instance.isFavourite.value) {
                        ProductsController.instance.deleteFavourite(productID: productID);
                      } else {
                        ProductsController.instance.addFavourite(productID: productID);
                      }
                    },
                  )),
                ),

              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: name, smallSize: false),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: expiryDate,),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: TProductPriceText(price: price.toString()),
              ),
              GestureDetector(
                onTap: () => ProductsController.instance.addToCart(productID: productID),
                child: Container(
                  decoration: BoxDecoration(
                      color: dark ? TColors.darkerGrey : TColors.dark,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight: Radius.circular(TSizes.productImageRadius)
                      )
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add, color: TColors.white,))),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

