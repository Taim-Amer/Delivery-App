import 'package:delivery_app/common/widgets/alerts/snackbar.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo_impl.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/services/image_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController get instance => Get.find();

  final loginPasswordController = TextEditingController();
  final loginPhoneController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerFirstNameController = TextEditingController();
  final registerLastNameController = TextEditingController();

  Rx<RequestState> signinApiStatus = RequestState.begin.obs;
  Rx<RequestState> signupApiStatus = RequestState.begin.obs;

  Rx<dynamic> selectedImage = Rx<dynamic>(null);

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void updateSelectedImage(dynamic image){
    selectedImage.value = image;
  }

  Future<void> signin() async{
    THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.loading);
    if(!signinFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.begin);
      return;
    }

    await AuthRepositoryImpl.instance.signin(
      phoneNumber: loginPhoneController.text.toString().trim(),
      password: loginPasswordController.text.toString(),
    ).then((response){
      THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.success);
      showSnackBar(response.message!, AlertState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

  Future<void> signup() async{
    THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.loading);
    if(!signinFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.begin);
      return;
    }

    dynamic selectedImage = TImageServices.selectedImages.value.isNotEmpty
        ? TImageServices.selectedImages.value.first
        : null;

    await AuthRepositoryImpl.instance.signup(
      firstName: registerFirstNameController.text.toString(),
      lastName: registerLastNameController.text.toString(),
      phoneNumber: registerPhoneController.text.toString().trim(),
      password: registerPasswordController.text.toString(),
      location: 'taim',
      image: selectedImage).then((response){
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.success);
      showSnackBar(response.message!, AlertState.success);
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.error);
      showSnackBar("An error occurred, please try again", AlertState.error);
    });
  }

}