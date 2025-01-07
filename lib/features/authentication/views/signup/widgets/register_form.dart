import 'package:delivery_app/features/authentication/controllers/auth_controller.dart';
import 'package:delivery_app/features/authentication/views/signin/login_screen.dart';
import 'package:delivery_app/features/authentication/views/signup/widgets/register_footer.dart';
import 'package:delivery_app/features/authentication/views/signup/widgets/register_image_picker.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/validators/validation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: AuthController.instance.signupFormKey,
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
                      controller: AuthController.instance.registerFirstNameController,
                      cursorColor: TColors.primary,
                      validator: (value) => TValidator.validateEmptyText("name", value),
                      expands: false,
                      decoration: const InputDecoration(hintText: "First Name", prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputField,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: AuthController.instance.registerLastNameController,
                      validator: (value) => TValidator.validateEmptyText("name", value),
                      expands: false,
                      decoration: const InputDecoration(hintText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                controller: AuthController.instance.registerPhoneController,
                validator: (value) => TValidator.validatePhoneNumber(value),
                expands: false,
                decoration: const InputDecoration(hintText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                controller: AuthController.instance.registerPasswordController,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: true,
                decoration: const InputDecoration(hintText: "Password", prefixIcon: Icon(Iconsax.password_check)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              const RegisterFooter()
            ],
          ),
        ),
      ),
    );
  }
}
