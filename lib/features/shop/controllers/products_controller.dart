import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
import 'package:delivery_app/features/shop/models/add_favourite_model.dart';
import 'package:delivery_app/features/shop/models/add_to_cart_model.dart';
import 'package:delivery_app/features/shop/models/apply_model.dart';
import 'package:delivery_app/features/shop/models/delete_cart_model.dart';
import 'package:delivery_app/features/shop/models/delete_favourite_model.dart';
import 'package:delivery_app/features/shop/models/favourite_model.dart';
import 'package:delivery_app/features/shop/models/get_cart_items_model.dart';
import 'package:delivery_app/features/shop/models/product_details_model.dart';
import 'package:delivery_app/features/shop/models/product_model.dart';
import 'package:delivery_app/features/shop/models/update_cart_model.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo_impl.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
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

  Rx<int> quantity = 0.obs;

  @override
  void onReady() {
    getAllProducts();
    getAllFavourites();
    getCartItems();
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

  Future<void> addToCart({required int productID, required int quantity}) async{
    THelperFunctions.updateApiStatus(target: addToCartApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.addToCart(productID: productID, quantity: quantity).then((response) {
      addToCartModel.value = response;
      THelperFunctions.updateApiStatus(target: addToCartApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: addToCartApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
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
      THelperFunctions.updateApiStatus(target: applyApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: applyApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> updateCart({required int productID}) async{
    THelperFunctions.updateApiStatus(target: updateApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.update(productID: productID).then((response) {
      updateModel.value = response;
      THelperFunctions.updateApiStatus(target: updateApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: updateApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> deleteCart({required int productID}) async{
    THelperFunctions.updateApiStatus(target: deleteApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.delete(productID: productID).then((response) {
      deleteModel.value = response;
      THelperFunctions.updateApiStatus(target: deleteApiStatus, value: RequestState.success);
    }).catchError((error){
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

  Future<void> addFavourite({required int productID}) async{
    THelperFunctions.updateApiStatus(target: addFavouritesApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.addFavourite(productID: productID).then((response) {
      addFavouriteModel.value = response;
      THelperFunctions.updateApiStatus(target: addFavouritesApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: addFavouritesApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> deleteFavourite({required int productID}) async{
    THelperFunctions.updateApiStatus(target: deleteFavouritesApiStatus, value: RequestState.loading);
    await ProductsRepoImpl.instance.deleteFavourite(productID: productID).then((response) {
      deleteFavouriteModel.value = response;
      THelperFunctions.updateApiStatus(target: deleteFavouritesApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: deleteFavouritesApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

}