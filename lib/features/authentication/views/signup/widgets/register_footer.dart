import 'package:delivery_app/common/widgets/loaders/loading_widget.dart';
import 'package:delivery_app/features/authentication/controllers/auth_controller.dart';
import 'package:delivery_app/features/authentication/views/signin/login_screen.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => AuthController.instance.signupApiStatus.value == RequestState.loading ? const LoadingWidget() : SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () => AuthController.instance.signup(),
            child: const Text("Create Account"),
          ),
        )),
        const SizedBox(height: TSizes.spaceBtwInputField),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => Get.offAll(const SigninScreen(), transition: Transition.rightToLeft),
            child: const Text("Already have an account"),
          ),
        ),
      ],
    );
  }
}
