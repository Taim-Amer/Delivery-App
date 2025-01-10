import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/views/products/widgets/add_cart_bottom_sheet.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/rating_share_widget.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_image.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AddCartBottomSheet(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImageSlider(image: "image"),
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const RatingAndShare(),
                  // const TProductMetaData(),
                  // const SizedBox(height: TSizes.spaceBtwSections,),
                  // const TProductAttributes(),
                  // const SizedBox(height: TSizes.spaceBtwSections),

                  // SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                  // const SizedBox(height: TSizes.spaceBtwSections),

                  const SectionHeading(title: "Description", showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // const ReadMoreText(
                  //   "This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but I am just practicing and nothing else.This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but I am just practicing and nothing else.",
                  //   trimMode: TrimMode.Line,
                  //   trimLines: 3,
                  //   trimCollapsedText: 'Show more',
                  //   trimExpandedText: 'Show less',
                  //   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  //   lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  // ),

                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}