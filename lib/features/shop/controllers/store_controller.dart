import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
import 'package:delivery_app/features/shop/models/store_details_model.dart';
import 'package:delivery_app/features/shop/models/store_model.dart';
import 'package:delivery_app/features/shop/models/store_products_model.dart';
import 'package:delivery_app/features/shop/repositories/store/store_repo_impl.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{
  static StoreController get instance => Get.find();

  Rx<RequestState> getStoresApiStatus = RequestState.begin.obs;
  Rx<RequestState> getStoreDetailsApiStatus = RequestState.begin.obs;
  Rx<RequestState> getStoreProductsApiStatus = RequestState.begin.obs;

  final allStoresModel = StoreModel().obs;
  final storeDetailsModel = StoreDetailsModel().obs;
  final storeProductsModel = StoreProductsModel().obs;

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
    THelperFunctions.updateApiStatus(target: getStoreDetailsApiStatus, value: RequestState.loading);
    await StoreRepoImpl.instance.getStoreDetails(storeID: storeID).then((response){
      storeDetailsModel.value = response;
      THelperFunctions.updateApiStatus(target: getStoreDetailsApiStatus, value: RequestState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getStoreDetailsApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }
}