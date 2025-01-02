import 'package:flutter/material.dart';
import 'package:delivery_app/features/authentication/views/signup/widgets/register_form.dart';
import 'package:delivery_app/utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: RegisterForm(),
        ),
      ),
    );
  }
}