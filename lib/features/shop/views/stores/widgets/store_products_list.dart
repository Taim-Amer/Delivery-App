import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/views/products/widgets/product_card.dart';
import 'package:flutter/material.dart';

class StoreProductsGrid extends StatelessWidget {
  const StoreProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var productList = StoreController.instance.storeProductsModel.value.data;
    return TGridLayout(
      itemCount: productList?.length ?? 0,
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
    );
  }
}
