import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/validators/validation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: SignupController.instance.signupFormState,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  // controller: SignupController.instance.carNumberController,
                  validator: (value) => TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputField,),
              Expanded(
                child: TextFormField(
                  // controller: SignupController.instance.typeController,
                  validator: (value) => TValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputField,),
          TextFormField(
            // controller: SignupController.instance.phoneNumberController,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          TextFormField(
            // controller: SignupController.instance.passwordController,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: true,
            decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Iconsax.password_check),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: (){},
              child: const Text("Create Account"),
            ),
          ),
        ],
      ),
    );
  }
}