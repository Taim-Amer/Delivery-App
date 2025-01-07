import 'package:delivery_app/features/authentication/controllers/auth_controller.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/features/authentication/views/signup/widgets/register_form.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<AuthController>(AuthController());
    Get.put<AuthRepositoryImpl>(AuthRepositoryImpl());
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: RegisterForm(),
      ),
    );
  }
}