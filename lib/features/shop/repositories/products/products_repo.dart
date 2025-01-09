import 'package:delivery_app/features/shop/models/add_to_cart_model.dart';
import 'package:delivery_app/features/shop/models/apply_model.dart';
import 'package:delivery_app/features/shop/models/delete_cart_model.dart';
import 'package:delivery_app/features/shop/models/get_cart_items_model.dart';
import 'package:delivery_app/features/shop/models/product_details_model.dart';
import 'package:delivery_app/features/shop/models/product_model.dart';
import 'package:delivery_app/features/shop/models/update_cart_model.dart';

abstract class ProductsRepo{
  Future<ProductModel> getAllProducts();
  Future<ProductDetailsModel> getProductsDetails({required int productID});
  Future<AddToCartModel> addToCart({required int productID, required int quantity});
  Future<GetCartItemsModel> getCartItems();
  Future<ApplyModel> apply();
  Future<UpdateCartModel> update({required int productID});
  Future<DeleteCartModel> delete({required int productID});
}