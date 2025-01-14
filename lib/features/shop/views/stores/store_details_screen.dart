import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/views/favourites/widgets/favourites_shimmer.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/rating_share_widget.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_image.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_products_list.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key, required this.name, required this.location, required this.image, required this.represents, required this.storeID});

  final String name;
  final String location;
  final String image;
  final String represents;
  final int storeID;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
      backgroundColor: dark ? TColors.dark : TColors.light,
      color: TColors.primary,
      onRefresh: () async{
        ProductsController.instance.getAllFavourites();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductImageSlider(image: image),
              Padding(
                padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    const RatingAndShare(),
                    const SizedBox(height: TSizes.spaceBtwSections,),
                    SectionHeading(title: name, showActionButton: false,),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SectionHeading(title: location, showActionButton: false,),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SectionHeading(title: represents, showActionButton: false,),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    const SectionHeading(title: "Products", showActionButton: false,),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    Obx(() => StoreController.instance.getStoreProductsApiStatus.value == RequestState.loading ? const SizedBox(height: 600,child: FavouritesShimmer()) : const SizedBox(height: 600,child: StoreProductsGrid())),
                    const SizedBox(height: TSizes.spaceBtwItems,),
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
