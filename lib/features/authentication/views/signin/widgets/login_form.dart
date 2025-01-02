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
    return Center(
      child: Form(
        // key: SigninController.instance.signInFormState,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                // controller: SigninController.instance.emailController,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  hintText: "Phone Number",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                // controller: SigninController.instance.passwordController,
                validator: (value) => TValidator.validatePassword(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  hintText: "Password",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Get.offAll(const SignupScreen(), transition: Transition.rightToLeft),
                      child: const Text("Create Account"),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
