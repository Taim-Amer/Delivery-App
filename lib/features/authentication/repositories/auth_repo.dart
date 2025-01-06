import 'dart:io';

import 'package:delivery_app/features/authentication/models/signin_model.dart';
import 'package:delivery_app/features/authentication/models/signup_model.dart';

abstract class AuthRepository {
  Future<SigninModel> signin({required String phoneNumber, required String password});
  Future<SignupModel> signup({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
    required String location,
    required File image,
  });
}
