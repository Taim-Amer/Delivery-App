import 'package:delivery_app/features/shop/models/store_details_model.dart';
import 'package:delivery_app/features/shop/models/store_model.dart';
import 'package:delivery_app/features/shop/models/store_products_model.dart';
import 'package:delivery_app/features/shop/repositories/store/store_repo.dart';
import 'package:delivery_app/utils/api/dio_helper.dart';
import 'package:delivery_app/utils/constants/api_constants.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:get/get.dart';

class StoreRepoImpl implements StoreRepo{
  static StoreRepoImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');

  @override
  Future<StoreModel> getAllStores() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getStores, token: token).then((response) => StoreModel.fromJson(response));
  }

  @override
  Future<StoreDetailsModel> getStoreDetails({required int storeID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      "${TApiConstants.getStoreDetails}/$storeID",
      token: token,
    ).then((response) => StoreDetailsModel.fromJson(response));
  }

  @override
  Future<StoreProductsModel> getStoreProducts({required int storeID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      "${TApiConstants.getStoreProducts}/$storeID",
      token: token,
    ).then((response) => StoreProductsModel.fromJson(response));
  }
}