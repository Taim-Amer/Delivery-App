import 'package:delivery_app/features/authentication/controllers/signup_controller.dart';
import 'package:delivery_app/features/authentication/repositories/signup/signup_repo_impl.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
    Get.put<SignupRepoImpl>(SignupRepoImpl());
  }
}