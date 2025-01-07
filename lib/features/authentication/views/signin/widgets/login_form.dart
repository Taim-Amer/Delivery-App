import 'package:delivery_app/features/authentication/controllers/auth_controller.dart';
import 'package:delivery_app/features/authentication/repositories/auth_repo_impl.dart';
import 'package:delivery_app/features/authentication/views/signin/widgets/login_footer.dart';
import 'package:delivery_app/features/authentication/views/signup/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<AuthController>(AuthController());
    Get.put<AuthRepositoryImpl>(AuthRepositoryImpl());
    return Center(
      child: Form(
        key: AuthController.instance.signinFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: AuthController.instance.loginPhoneController,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  hintText: "Phone Number",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                controller: AuthController.instance.loginPasswordController,
                // validator: (value) => TValidator.validatePassword(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  hintText: "Password",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              const LoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
