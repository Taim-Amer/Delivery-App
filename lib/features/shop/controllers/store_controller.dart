import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
import 'package:delivery_app/features/shop/models/store_details_model.dart';
import 'package:delivery_app/features/shop/models/store_model.dart';
import 'package:delivery_app/features/shop/models/store_products_model.dart';
import 'package:delivery_app/features/shop/models/store_search_model.dart';
import 'package:delivery_app/features/shop/repositories/store/store_repo_impl.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/logging/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{
  static StoreController get instance => Get.find();

  Rx<RequestState> getStoresApiStatus = RequestState.begin.obs;
  Rx<RequestState> getStoreDetailsApiStatus = RequestState.begin.obs;
  Rx<RequestState> getStoreProductsApiStatus = RequestState.begin.obs;
  Rx<RequestState> storeSearchApiStatus = RequestState.begin.obs;

  final allStoresModel = StoreModel().obs;
  final storeDetailsModel = StoreDetailsModel().obs;
  final storeProductsModel = StoreProductsModel().obs;
  final searchStoreModel = StoreSearchModel().obs;

  final searchStoreController = TextEditingController();

  @override
  void onReady() {
    getAllStores();
    super.onReady();
  }

  Future<void> getAllStores() async{
    THelperFunctions.updateApiStatus(target: getStoresApiStatus, value: RequestState.loading);
    await StoreRepoImpl.instance.getAllStores().then((response){
      allStoresModel.value = response;
      THelperFunctions.updateApiStatus(target: getStoresApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getStoresApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> getStoreDetails({required int storeID}) async{
    THelperFunctions.updateApiStatus(target: getStoreProductsApiStatus, value: RequestState.loading);
    await StoreRepoImpl.instance.getStoreProducts(storeID: storeID).then((response){
      storeProductsModel.value = response;
      THelperFunctions.updateApiStatus(target: getStoreProductsApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getStoreProductsApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> getStoreProducts({required int storeID}) async{
    THelperFunctions.updateApiStatus(target: getStoreProductsApiStatus, value: RequestState.loading);
    await StoreRepoImpl.instance.getStoreProducts(storeID: storeID).then((response){
      storeProductsModel.value = response;
      THelperFunctions.updateApiStatus(target: getStoreProductsApiStatus, value: RequestState.success);
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: getStoreProductsApiStatus, value: RequestState.error);
      // showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> searchStore() async{
    THelperFunctions.updateApiStatus(target: storeSearchApiStatus, value: RequestState.loading);
    await StoreRepoImpl.instance.searchStore(
      storeName: searchStoreController.text.toString(),
    ).then((response){
      searchStoreModel.value = response;
      THelperFunctions.updateApiStatus(target: storeSearchApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: storeSearchApiStatus, value: RequestState.error);
      showSnackBar("An error occurred or store not found, please try again", AlertState.warning);
    });
  }
}