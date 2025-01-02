import 'package:get/get.dart';
import 'package:delivery_app/features/authentication/models/session_key_model.dart';
import 'package:delivery_app/features/authentication/models/signin_model.dart';
import 'package:delivery_app/features/authentication/models/signup_model.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo.dart';
import 'package:delivery_app/utils/api/dio_helper.dart';
import 'package:delivery_app/utils/constants/api_constants.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  static AuthRepositoryImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');

}
