import 'package:delivery_app/common/styles/spacing_styles.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_products_list.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_stores_list.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card_horizontal.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card_vertical.dart';
import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_appbar.dart';
import 'package:delivery_app/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<StoreController>(StoreController());
    Get.put<ProductsController>(ProductsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
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
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(title: "Stores", onPressed: () {}),
                  const HomeStoresList(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SectionHeading(title: "Products", onPressed: () {}),
                  const HomeProductsGrid()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
