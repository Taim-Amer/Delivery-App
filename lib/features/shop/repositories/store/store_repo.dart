import 'package:delivery_app/features/shop/models/store_details_model.dart';
import 'package:delivery_app/features/shop/models/store_model.dart';
import 'package:delivery_app/features/shop/models/store_products_model.dart';

abstract class StoreRepo{
  Future<StoreModel> getAllStores();
  Future<StoreDetailsModel> getStoreDetails({required int storeID});
  Future<StoreProductsModel> getStoreProducts({required int storeID});
}