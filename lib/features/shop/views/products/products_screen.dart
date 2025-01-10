import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card_vertical.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<ProductsController>(ProductsController());
    Get.put<ProductsRepoImpl>(ProductsRepoImpl());
    var productList = ProductsController.instance.productsModel.value.data;
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
        color: TColors.primary,
        backgroundColor: dark ? TColors.dark : TColors.light,
        onRefresh: () async{
          await ProductsController.instance.getAllProducts();
        },
        child: Scaffold(
          appBar: TAppBar(actions: [CartCounterIcon(onPressed: (){})],),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: TGridLayout(
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
              ),
              mainAxisExtent: 288,
            ),
          ),
        ));
  }
}
