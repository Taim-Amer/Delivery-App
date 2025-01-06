import 'dart:io';

import 'package:delivery_app/utils/api/multimedia_helper.dart';
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
  Future<SignupModel> signup({required String firstName, required String lastName, required String phoneNumber, required String password, required String location, required File image}) async{
    final dioHelper = TMultiMediaHelper();
    List<int> imageBytes = await image.readAsBytes();
    String imageName = image.path.split('/').last;

    return dioHelper.postWithImage(
      endPoint: TApiConstants.register,
      imageBytes: imageBytes,
      imageName: imageName,
      additionalData: {
        'first_name' : firstName,
        'last_name' : lastName,
        'phone_number' : phoneNumber,
        'location' : location,
        'password' : password,
      }
    ).then((response) => SignupModel.fromJson(response));
  }

}
