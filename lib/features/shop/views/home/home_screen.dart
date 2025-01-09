import 'package:delivery_app/common/styles/spacing_styles.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card_horizontal.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card_vertical.dart';
import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_appbar.dart';
import 'package:delivery_app/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
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
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(title: "Popular Products", onPressed: () {}),
                  SizedBox(
                    height: 150.h,
                    child: ListView.separated(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                      separatorBuilder: (_, index) => const SizedBox(width: TSizes.spaceBtwItems),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
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
