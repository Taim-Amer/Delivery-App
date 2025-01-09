import 'package:flutter/material.dart';
import 'package:delivery_app/common/styles/spacing_styles.dart';
import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/authentication/views/signin/widgets/login_form.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: const LoginForm(),
        ),
      ),
    );
  }
}
