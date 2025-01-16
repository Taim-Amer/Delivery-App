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
import 'package:delivery_app/features/shop/repositories/products/products_repo.dart';
import 'package:delivery_app/utils/api/dio_helper.dart';
import 'package:delivery_app/utils/constants/api_constants.dart';
import 'package:delivery_app/utils/logging/logger.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductsRepoImpl implements ProductsRepo{
  static ProductsRepoImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');
  
  @override
  Future<ProductModel> getAllProducts() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getProducts, token: token).then((response) => ProductModel.fromJson(response));
  }

  @override
  Future<ProductDetailsModel> getProductsDetails({required int productID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      "${TApiConstants.getProductDetails}/$productID",
      token: token,
    ).then((response) => ProductDetailsModel.fromJson(response));
  }

  @override
  Future<AddFavouriteModel> addFavourite({required int productID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.addFavourite,
      {
        'product_id' : productID
      },
      token: token,
    ).then((response) => AddFavouriteModel.fromJson(response));
  }

  @override
  Future<AddToCartModel> addToCart({required int productID, required int quantity}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.addCart,
      {
        'product_id' : productID,
        'quantity' : quantity
      },
      token: token,
    ).then((response) => AddToCartModel.fromJson(response));
  }

  @override
  Future<ApplyModel> apply() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.apply,
      token: token,
    ).then((response) => ApplyModel.fromJson(response));
  }

  @override
  Future<DeleteCartModel> delete({required int productID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.delete(
      "${TApiConstants.deleteCart}/$productID",
      token: token,
    ).then((response) => DeleteCartModel.fromJson(response));
  }

  @override
  Future<DeleteFavouriteModel> deleteFavourite({required int productID}) async {
    try {
      final dioHelper = TDioHelper();
      final response = await dioHelper.delete(
        "${TApiConstants.deleteFavourite}/$productID",
        token: token,
      );

      return DeleteFavouriteModel.fromJson(response);
    } on DioException catch (dioError) {
      TLoggerHelper.error("DioError occurred: ${dioError.response?.data}");
      throw Exception("Failed to delete favourite");
    }
  }



  @override
  Future<FavouriteModel> getAllFavourites() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.getFavourite,
      token: token,
    ).then((response) => FavouriteModel.fromJson(response));
  }

  @override
  Future<GetCartItemsModel> getCartItems() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.getCart,
      token: token,
    ).then((response) => GetCartItemsModel.fromJson(response));
  }

  @override
  Future<UpdateCartModel> update({required int productID, required int quantity}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.put(
      "${TApiConstants.updateCart}/$productID",
      {'quantity' : quantity},
      token: token,
    ).then((response) => UpdateCartModel.fromJson(response));
  }

  @override
  Future<void> deleteOrder({required int orderID}) async{
    final dioHelper = TDioHelper();
    await dioHelper.delete("${TApiConstants.deleteOrder}/$orderID", token: token);
  }

  @override
  Future<OrdersModel> getAllOrder() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getAllOrders, token: token).then((response) => OrdersModel.fromJson(response));
  }

  @override
  Future<void> updateOrder({required int orderID, required int quantity}) async{
    final dioHelper = TDioHelper();
    await dioHelper.put("${TApiConstants.updateOrder}/$orderID", token: token, {'quantity' : quantity});
  }

  @override
  Future<ProductSearchModel> searchProduct({required int storeID, required String productName}) async{
    if (productName.length >= 2) {
      final dioHelper = TDioHelper();
      return await dioHelper.get("${TApiConstants.searchProduct}/$storeID/$productName", token: token).then((response) => ProductSearchModel.fromJson(response));
    } else {
      return ProductSearchModel(
        l0: [],
        message: "Product name must have at least 2 characters",
      );
    }
  }

  @override
  Future<void> logout() {
    final dioHelper = TDioHelper();
    return dioHelper.get(TApiConstants.logout, token: token);
  }
}