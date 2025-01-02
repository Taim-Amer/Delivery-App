import 'package:delivery_app/features/authentication/controllers/forget_password_controller.dart';
import 'package:delivery_app/features/authentication/repositories/forget_password/forget_password_repo_impl.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ForgetPasswordController>(ForgetPasswordController());
    Get.put<ForgetPasswordRepoImpl>(ForgetPasswordRepoImpl());
  }
}