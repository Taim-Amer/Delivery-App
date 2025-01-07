import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:delivery_app/features/authentication/models/signin_model.dart';
import 'package:delivery_app/features/authentication/models/signup_model.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo.dart';
import 'package:delivery_app/utils/api/dio_helper.dart';
import 'package:delivery_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

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
    final uri = Uri.parse("${TApiConstants.baseUrl}/${TApiConstants.register}");
    var request = http.MultipartRequest('POST', uri);

    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['phone_number'] = phoneNumber;
    request.fields['location'] = location;
    request.fields['password'] = password;

    var imageFile = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(imageFile);
    await request.send();
  }

}
