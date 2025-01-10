import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_card.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_card.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<ProductsController>(ProductsController());
    Get.put<ProductsRepoImpl>(ProductsRepoImpl());
    var cartList = ProductsController.instance.cartItemsModel.value.data;
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
        color: TColors.primary,
        backgroundColor: dark ? TColors.dark : TColors.light,
        onRefresh: () async{
          await ProductsController.instance.getCartItems();
        },
        child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          actions: [
            TextButton(
              onPressed: () => ProductsController.instance.apply(),
              child: const Text("Apply"),
            )],),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: ListView.separated(
              itemBuilder: (context, index) => CartCard(
              name: cartList?[index].name ?? '',
              price: cartList?[index].price ?? 0,
              image: cartList?[index].imageProduct ?? '',
              productID: cartList?[index].id ?? 0,
              availableQuantity: cartList?[index].availableQuantity ?? 0,
              productionDate: cartList?[index].productionDate ?? '',
              expiryDate: cartList?[index].expiryDate ?? '',
            ),
              separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems),
              itemCount: cartList?.length ?? 0,
            ),
          ),
        ),
    );
  }
}
