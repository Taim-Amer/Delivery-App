import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
import 'package:delivery_app/features/shop/models/add_to_cart_model.dart';
import 'package:delivery_app/features/shop/models/get_cart_items_model.dart';
import 'package:delivery_app/features/shop/models/product_details_model.dart';
import 'package:delivery_app/features/shop/models/product_model.dart';
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

  final productsModel = ProductModel().obs;
  final productDetailsModel = ProductDetailsModel().obs;
  final addToCartModel = AddToCartModel().obs;
  final cartItemsModel = GetCartItemsModel().obs;

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


//   Future<ApplyModel> apply();
//   Future<UpdateCartModel> update({required int productID});
//   Future<DeleteCartModel> delete({required int productID});
}