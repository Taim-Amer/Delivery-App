import 'package:delivery_app/utils/api/http_client.dart';
import 'package:get/get.dart';
import 'package:delivery_app/features/authentication/models/signin_model.dart';
import 'package:delivery_app/features/authentication/models/signup_model.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo.dart';
import 'package:delivery_app/utils/api/dio_helper.dart';
import 'package:delivery_app/utils/constants/api_constants.dart';

class AuthRepositoryImpl implements AuthRepository {
  static AuthRepositoryImpl get instance => Get.find();

  @override
  Future<SigninModel> signin({required String phoneNumber, required String password}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.login, {
      'phone_number' : phoneNumber,
      'password' : password,
    }).then((response) => SigninModel.fromJson(response));
  }

  @override
  Future<SignupModel> signup({required String firstName, required String lastName, required String phoneNumber, required String password, required String location}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.register, {
      'first_name' : firstName,
      'last_name' : lastName,
      'phone_number' : phoneNumber,
      'location' : location,
      'password' : password,
    }).then((response) => SignupModel.fromJson(response));
  }
}
