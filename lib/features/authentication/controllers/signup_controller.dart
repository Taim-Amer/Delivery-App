import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:delivery_app/features/authentication/models/signup_model.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo_impl.dart';
import 'package:delivery_app/utils/constants/enums.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final carNumberController = TextEditingController();
  final typeController = TextEditingController();

  final GlobalKey<FormState> signupFormState = GlobalKey<FormState>();

  final signupModel = SignupModel().obs;

  var signupApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signupApiStatus.value = value;
  }

  Future<void> signup() async {
    if (signupFormState.currentState!.validate()) {
      updateStatus(value: RequestState.loading);
      try {
        // signupModel.value = await AuthRepositoryImpl.instance.signup(
        //   name: nameController.text,
        //   password: passwordController.text,
        //   phoneNumber: phoneNumberController.text,
        //   carNumber: carNumberController.text,
        //   type: typeController.text,
        // );

        if (signupModel.value.status == true) {
          updateStatus(value: RequestState.success);
          showSnackBar(signupModel.value.message ?? "", AlertState.success);
        } else {
          showSnackBar(signupModel.value.message ?? "", AlertState.error);
        }
      } catch (error) {
        updateStatus(value: RequestState.error);
        showSnackBar("TranslationKey.kErrorMessage", AlertState.success);
      }
    }
  }
}