// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_appbar.dart';
import 'package:delivery_app/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  // SizedBox(height: TSizes.spaceBtwSections,),
                  // // TSearchContainer(text: "Search in Store",),
                  SizedBox(height: TSizes.spaceBtwSections,),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: SectionHeading(title: "Popular Categories", showActionButton: false, textColor: TColors.white),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // TPromoSlider(
                  //   banners: [
                  //     TImages.promoBanner7,
                  //     TImages.promoBanner5,
                  //   ],
                  // ),
                  // SizedBox(height: TSizes.spaceBtwSections),

                  SectionHeading(title: "Popular Products", onPressed: () {}),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical(),
                    mainAxisExtent: 288,
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
