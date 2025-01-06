import 'package:delivery_app/features/authentication/views/signin/login_screen.dart';
import 'package:delivery_app/features/authentication/views/signup/widgets/register_image_picker.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/validators/validation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RegisterImagePicker(),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: TColors.primary,
                      validator: (value) => TValidator.validateEmptyText("First Name", value),
                      expands: false,
                      decoration: const InputDecoration(hintText: "First Name", prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputField,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) => TValidator.validateEmptyText("Last Name", value),
                      expands: false,
                      decoration: const InputDecoration(hintText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                validator: (value) => TValidator.validatePhoneNumber(value),
                expands: false,
                decoration: const InputDecoration(hintText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                obscureText: true,
                decoration: const InputDecoration(hintText: "Password", prefixIcon: Icon(Iconsax.password_check)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create Account"),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Get.offAll(const SigninScreen(), transition: Transition.rightToLeft),
                  child: const Text("Already have an account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
