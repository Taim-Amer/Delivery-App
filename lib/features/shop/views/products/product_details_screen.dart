import 'package:delivery_app/common/widgets/texts/product_price_text.dart';
import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/views/products/widgets/add_cart_bottom_sheet.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/rating_share_widget.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_image.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productID, required this.name, required this.price, required this.availableQuantity, required this.imageProduct, required this.productionDate, required this.expiryDate});

  final int productID;
  final String name;
  final int price;
  final int availableQuantity;
  final String imageProduct;
  final String productionDate;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
      color: TColors.primary,
      backgroundColor: dark ? TColors.dark : TColors.light,
      onRefresh: () async{
        await ProductsController.instance.getProductsDetails(productID: productID);
      },
      child: Scaffold(
        bottomNavigationBar: const AddCartBottomSheet(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductImageSlider(image: imageProduct),
              Padding(
                padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    const RatingAndShare(),
                    const SizedBox(height: TSizes.spaceBtwSections,),
                    SectionHeading(title: name, showActionButton: false,),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SectionHeading(title: availableQuantity.toString(), showActionButton: true, buttonTitle: "Available Quantity",),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SectionHeading(title: productionDate, showActionButton: true, buttonTitle: "Production Date"),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SectionHeading(title: expiryDate, showActionButton: true, buttonTitle: "Expiry Date"),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TProductPriceText(price: price.toString()),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}