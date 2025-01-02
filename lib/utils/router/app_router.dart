import 'package:delivery_app/dependencies/forget_password_binding.dart';
import 'package:delivery_app/dependencies/order_binding.dart';
import 'package:delivery_app/dependencies/otp_binding.dart';
import 'package:delivery_app/dependencies/signin_binding.dart';
import 'package:delivery_app/dependencies/signup_binding.dart';
import 'package:delivery_app/features/authentication/views/forget_password/new_password_screen.dart';
import 'package:delivery_app/features/authentication/views/forget_password/password_confirmed_screen.dart';
import 'package:delivery_app/features/authentication/views/forget_password/phone_verify_screen.dart';
import 'package:delivery_app/features/authentication/views/forget_password/verify_code_screen.dart';
import 'package:delivery_app/features/authentication/views/signup/otp_screen.dart';
import 'package:delivery_app/features/authentication/views/signin/signin_screen.dart';
import 'package:delivery_app/features/authentication/views/signup/signup_screen.dart';
import 'package:delivery_app/features/orders/views/order/order_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const signin = '/signin';
  static const otp = '/otp';
  static const signup = '/signup';
  static const phoneVerify = '/phoneVerify';
  static const verifyCode = '/verifyCode';
  static const setPassword = '/setPassword';
  static const order = '/order';
  static const passwordConfirm = '/passwordConfirm';

  static List<GetPage> routes = [

    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      transition: Transition.fade
    ),

    GetPage(
      name: otp,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
      transition: Transition.fade
    ),

    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
      transition: Transition.fade
    ),

    GetPage(
        name: phoneVerify,
        page: () => const PhoneVerifyScreen(),
        binding: ForgetPasswordBinding(),
        transition: Transition.fade
    ),

    GetPage(
        name: verifyCode,
        page: () => const VerifyCodeScreen(),
        binding: ForgetPasswordBinding(),
        transition: Transition.fade
    ),

    GetPage(
        name: setPassword,
        page: () => const NewPasswordScreen(),
        binding: ForgetPasswordBinding(),
        transition: Transition.fade
    ),

    GetPage(
      name: order,
      page: () => const OrderScreen(),
      binding: OrderBinding(),
      transition: Transition.fade
    ),

    GetPage(
        name: passwordConfirm,
        page: () => const PasswordConfirmedScreen(),
        transition: Transition.fade
    ),
  ];
}