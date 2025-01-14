import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
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
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/navigation_menu.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/logging/logger.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  static ProductsController get instance => Get.find();

  Rx<RequestState> getProductsApiStatus = RequestState.begin.obs;
  Rx<RequestState> getProductDetailsApiStatus = RequestState.begin.obs;
  Rx<RequestState> addToCartApiStatus = RequestState.begin.obs;
  Rx<RequestState> getCartItemsApiStatus = RequestState.begin.obs;
  Rx<RequestState> applyApiStatus = RequestState.begin.obs;
  Rx<RequestState> updateApiStatus = RequestState.begin.obs;
  Rx<RequestState> deleteApiStatus = RequestState.begin.obs;
  Rx<RequestState> getFavouritesApiStatus = RequestState.begin.obs;
  Rx<RequestState> addFavouritesApiStatus = RequestState.begin.obs;
  Rx<RequestState> deleteFavouritesApiStatus = RequestState.begin.obs;
  Rx<RequestState> getOrdersApiStatus = RequestState.begin.obs;
  Rx<RequestState> productSearchApiStatus = RequestState.begin.obs;

  final productsModel = ProductModel().obs;
  final productDetailsModel = ProductDetailsModel().obs;
  final addToCartModel = AddToCartModel().obs;
  final cartItemsModel = GetCartItemsModel().obs;
  final applyModel = ApplyModel().obs;
  final updateModel = UpdateCartModel().obs;
  final deleteModel = DeleteCartModel().obs;
  final favouritesModel = FavouriteModel().obs;
  final addFavouriteModel = AddFavouriteModel().obs;
  final deleteFavouriteModel = DeleteFavouriteModel().obs;
  final ordersModel = OrdersModel().obs;
  final searchProductModel = ProductSearchModel().obs;

  final updateCartController = TextEditingController();
  final updateOrderController = TextEditingController();
  final searchProductController = TextEditingController();

  Rx<int> quantity = 0.obs;
  // RxBool isFavourite = false.obs;

  @override
  void onReady() {
    getAllProducts();
    getAllFavourites();
    getCartItems();
    getAllOrders();
    super.onReady();
  }

  void increaseQuantity() {
    quantity.value = quantity.value + 1;
  }

  void decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value = quantity.value - 1;
    }
  }


  Future<void> getAllProducts() async{
    THelperFunctions.updateApiStatus(target: getProductsApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.getAllProducts().then((response) {
      productsModel.value = response;
      THelperFunctions.updateApiStatus(target: getProductsApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getProductsApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> getProductsDetails({required int productID}) async{
    THelperFunctions.updateApiStatus(target: getProductDetailsApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.getProductsDetails(productID: productID).then((response) {
      productDetailsModel.value = response;
      THelperFunctions.updateApiStatus(target: getProductDetailsApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getProductDetailsApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> addToCart({required int productID}) async{
    THelperFunctions.updateApiStatus(target: addToCartApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.addToCart(productID: productID, quantity: quantity.value).then((response) {
      addToCartModel.value = response;
      showSnackBar(addToCartModel.value.message ?? '', AlertState.success);
      THelperFunctions.updateApiStatus(target: addToCartApiStatus, value: RequestState.success);
      getCartItems();
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: addToCartApiStatus, value: RequestState.error);
      showSnackBar("Product already exists, try to update it", AlertState.warning);
    });
  }


  Future<void> getCartItems() async{
    THelperFunctions.updateApiStatus(target: getCartItemsApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.getCartItems().then((response) {
      cartItemsModel.value = response;
      THelperFunctions.updateApiStatus(target: getCartItemsApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getCartItemsApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> apply() async{
    THelperFunctions.updateApiStatus(target: applyApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.apply().then((response) {
      applyModel.value = response;
      showSnackBar(applyModel.value.message ?? '', AlertState.success);
      THelperFunctions.updateApiStatus(target: applyApiStatus, value: RequestState.success);
      Get.offAll(() => const NavigationMenu());
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: applyApiStatus, value: RequestState.error);
      showSnackBar("You can't get this quantity of product 'impedit'", AlertState.warning);
    });
  }

  Future<void> updateCart({required int productID}) async{
    final int quantity = int.parse(updateCartController.text);
    THelperFunctions.updateApiStatus(target: updateApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.update(productID: productID, quantity: quantity).then((response) {
      updateModel.value = response;
      THelperFunctions.updateApiStatus(target: updateApiStatus, value: RequestState.success);
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: updateApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> deleteCart({required int productID}) async{
    THelperFunctions.updateApiStatus(target: deleteApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.delete(productID: productID).then((response) {
      deleteModel.value = response;
      THelperFunctions.updateApiStatus(target: deleteApiStatus, value: RequestState.success);
      showSnackBar(deleteModel.value.message ?? '', AlertState.success);
      Get.offAll(() => const NavigationMenu());
    }).catchError((error){
      TLoggerHelper.warning(error.toString());
      THelperFunctions.updateApiStatus(target: deleteApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> getAllFavourites() async{
    THelperFunctions.updateApiStatus(target: getFavouritesApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.getAllFavourites().then((response) {
      favouritesModel.value = response;
      THelperFunctions.updateApiStatus(target: getFavouritesApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getFavouritesApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> deleteOrder({required int orderID}) async{
    await ProductsRepoImpl.instance.deleteOrder(orderID: orderID).then((response) {
      showSnackBar("Order deleted successfully", AlertState.success);
      getAllOrders();
    }).catchError((error){
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> updateOrder({required int orderID}) async{
    final int quantity = int.parse(updateOrderController.text);
    await ProductsRepoImpl.instance.updateOrder(orderID: orderID, quantity: quantity).then((response) {
      showSnackBar("Order updated successfully", AlertState.success);
      getAllOrders();
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> getAllOrders() async{
    THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.getAllOrder().then((response) {
      ordersModel.value = response;
      THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> addFavourite({required int productID}) async {
    // isFavourite.value = true;

    THelperFunctions.updateApiStatus(target: addFavouritesApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.addFavourite(productID: productID).then((response) {
      addFavouriteModel.value = response;
      THelperFunctions.updateApiStatus(target: addFavouritesApiStatus, value: RequestState.success);
      // isFavourite.value = true;
      showSnackBar("Product added to favourites successfully", AlertState.success);
      getAllFavourites();
    }).catchError((error) {
      // isFavourite.value = false;
      TLoggerHelper.error(error.toString());
      TLoggerHelper.error(productID.toString());
      THelperFunctions.updateApiStatus(target: addFavouritesApiStatus, value: RequestState.error);
      showSnackBar("product already exists", AlertState.warning);
    });
  }

  Future<void> deleteFavourite({required int productID}) async {
    // isFavourite.value = false;

    THelperFunctions.updateApiStatus(target: deleteFavouritesApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.deleteFavourite(productID: productID).then((response) {
      deleteFavouriteModel.value = response;
      THelperFunctions.updateApiStatus(target: deleteFavouritesApiStatus, value: RequestState.success);
      // isFavourite.value = false;
      showSnackBar("Product removed from favourites successfully", AlertState.success);
      getAllFavourites();
    }).catchError((error) {
      // isFavourite.value = true;
      TLoggerHelper.error(error.toString());

      TLoggerHelper.error(productID.toString());
      THelperFunctions.updateApiStatus(target: deleteFavouritesApiStatus, value: RequestState.error);
      showSnackBar("An error occurred while removing from favourites", AlertState.error);
    });
  }
  
  Future<void> searchProduct() async{
    THelperFunctions.updateApiStatus(target: productSearchApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.searchProduct(
      storeID: TCacheHelper.getData(key: 'storeID'), 
      productName: searchProductController.text.toString(),
    ).then((response){
      searchProductModel.value = response;
      THelperFunctions.updateApiStatus(target: productSearchApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: productSearchApiStatus, value: RequestState.error);
      showSnackBar("An error occurred or product not found, please try again", AlertState.warning);
    });
  }
}