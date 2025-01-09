import 'package:delivery_app/features/shop/models/product_details_model.dart';
import 'package:delivery_app/features/shop/models/product_model.dart';
import 'package:delivery_app/features/shop/repositories/products/products_repo.dart';
import 'package:delivery_app/utils/api/dio_helper.dart';
import 'package:delivery_app/utils/constants/api_constants.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
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

}