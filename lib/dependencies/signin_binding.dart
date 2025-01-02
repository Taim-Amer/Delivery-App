import 'package:delivery_app/features/authentication/controllers/signin_controller.dart';
import 'package:delivery_app/features/authentication/repositories/signin/signin_repo_impl.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
    Get.put<SigninRepoImpl>(SigninRepoImpl());
  }
}