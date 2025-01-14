import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/features/shop/repositories/store/store_repo_impl.dart';
import 'package:delivery_app/features/shop/views/home/search_screen.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_products_list.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_shimmer.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_stores_list.dart';
import 'package:delivery_app/common/widgets/texts/section_heading.dart';
import 'package:delivery_app/features/shop/views/home/widgets/home_appbar.dart';
import 'package:delivery_app/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:delivery_app/features/shop/views/products/products_screen.dart';
import 'package:delivery_app/features/shop/views/stores/store_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<StoreController>(StoreController());
    Get.put<ProductsController>(ProductsController());
    Get.put<StoreRepoImpl>(StoreRepoImpl());
    Get.put<ProductsRepoImpl>(ProductsRepoImpl());

    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
      backgroundColor: dark ? TColors.dark : TColors.light,
      color: TColors.primary,
      onRefresh: () async{
        await ProductsController.instance.getAllProducts();
        await StoreController.instance.getAllStores();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryHeaderContainer(
                child: Column(
                  children: [
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections,),
                    SizedBox(height: TSizes.spaceBtwSections,),
                    SizedBox(height: TSizes.spaceBtwSections,),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Obx(() => ProductsController.instance.getProductsApiStatus.value == RequestState.loading
                    || StoreController.instance.getStoresApiStatus.value == RequestState.loading
                    ? const HomeShimmer()
                    : Column(
                  children: [
                    SectionHeading(title: "Stores", onPressed: () => Get.to(const StoreScreen())),
                    const HomeStoresList(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SectionHeading(title: "Products", onPressed: () => Get.to(const ProductsScreen())),
                    const HomeProductsGrid()
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
