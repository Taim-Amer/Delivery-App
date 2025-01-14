import 'package:delivery_app/features/shop/models/add_favourite_model.dart';
import 'package:delivery_app/features/shop/models/add_to_cart_model.dart';
import 'package:delivery_app/features/shop/models/apply_model.dart';
import 'package:delivery_app/features/shop/models/delete_cart_model.dart';
import 'package:delivery_app/features/shop/models/delete_favourite_model.dart';
import 'package:delivery_app/features/shop/models/favourite_model.dart';
import 'package:delivery_app/features/shop/models/get_cart_items_model.dart';
import 'package:delivery_app/features/shop/models/orders_model.dart';
import 'package:delivery_app/features/shop/models/product_details_model.dart';
import 'package:delivery_app/features/shop/models/product_model.dart';
import 'package:delivery_app/features/shop/models/product_search_model.dart';
import 'package:delivery_app/features/shop/models/update_cart_model.dart';

abstract class ProductsRepo{
  Future<ProductModel> getAllProducts();
  Future<ProductDetailsModel> getProductsDetails({required int productID});

  Future<AddToCartModel> addToCart({required int productID, required int quantity});
  Future<GetCartItemsModel> getCartItems();
  Future<ApplyModel> apply();
  Future<UpdateCartModel> update({required int productID, required int quantity});
  Future<DeleteCartModel> delete({required int productID});

  Future<FavouriteModel> getAllFavourites();
  Future<AddFavouriteModel> addFavourite({required int productID});
  Future<DeleteFavouriteModel> deleteFavourite({required int productID});
  //
  Future<OrdersModel> getAllOrder();
  Future<void> updateOrder({required int orderID, required int quantity});
  Future<void> deleteOrder({required int orderID});

  Future<ProductSearchModel> searchProduct({required int storeID, required String productName});

}