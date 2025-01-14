import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/personal/widgets/theme_icon.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/features/shop/views/home/search_screen.dart';
import 'package:delivery_app/features/shop/views/orders/widgets/orders_card.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<ProductsController>(ProductsController());
    Get.put<ProductsRepoImpl>(ProductsRepoImpl());
    var ordersList = ProductsController.instance.ordersModel.value.data;
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
        color: TColors.primary,
        backgroundColor: dark ? TColors.dark : TColors.light,
        onRefresh: () async{
          await ProductsController.instance.getAllOrders();
        },
        child: Scaffold(
          appBar: TAppBar(leadingIcon: Iconsax.logout, leadingOnPressed: () => ProductsController.instance.logout()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: ListView.separated(
              itemBuilder: (context, index) => OrdersCard(price: ordersList?[index].totalCost ?? 0, orderID:  ordersList?[index].id ?? 0),
              separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems),
              itemCount: ordersList?.length ?? 0,
            ),
          ),
        ));
  }
}
