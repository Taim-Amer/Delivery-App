import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:delivery_app/features/authentication/models/signin_model.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormState = GlobalKey<FormState>();

  final signinModel = SigninModel().obs;

  var signinApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signinApiStatus.value = value;
  }

}
