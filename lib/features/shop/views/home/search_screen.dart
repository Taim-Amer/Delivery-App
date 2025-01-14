import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/features/shop/repositories/store/store_repo_impl.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_card.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  final bool isStore;

  @override
  Widget build(BuildContext context) {
    Get.put<StoreController>(StoreController());
    Get.put<ProductsController>(ProductsController());
    Get.put<StoreRepoImpl>(StoreRepoImpl());
    Get.put<ProductsRepoImpl>(ProductsRepoImpl());

    var productList = ProductsController.instance.searchProductModel.value.l0;
    var storesList = StoreController.instance.searchStoreModel.value.l0;

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: TextFormField(
        controller: StoreController.instance.searchStoreController,
        onChanged: (value) => isStore ? StoreController.instance.searchStore() : ProductsController.instance.searchProduct(),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search for products or stores ...",
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSizes.spaceBtwSections.verticalSpace,
            isStore ? ListView.separated(
              itemBuilder: (context, index) => StoreCard(
                name: storesList?[index].name ?? "",
                location: storesList?[index].location ?? "",
                image: storesList?[index].imageStore ?? "",
                represents: storesList?[index].represents ?? "",
                storeID: storesList?[index].id ?? 0,
              ),
              separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems),
              itemCount: storesList?.length ?? 0,
            ) : TGridLayout(
              itemCount: productList?.length ?? 0,
              physics: const AlwaysScrollableScrollPhysics() ,
              itemBuilder: (_, index) => ProductCard(
                name: productList?[index].name ?? "",
                price: productList?[index].price ?? 0,
                image: productList?[index].imageProduct ?? "",
                productID: productList?[index].id ?? 0,
                availableQuantity: productList?[index].availableQuantity ?? 0,
                productionDate: productList?[index].productionDate ?? "",
                expiryDate: productList?[index].expiryDate ?? "",
                favourite: false,
              ),
              mainAxisExtent: 288,
            )
          ],
        ),
      ),
    );
  }
}
