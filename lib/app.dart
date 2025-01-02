import 'package:delivery_app/features/orders/views/order/order_screen.dart';
import 'package:delivery_app/localization/translations.dart';
import 'package:delivery_app/utils/router/app_router.dart';
import 'package:delivery_app/dependencies/signin_binding.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClientApp extends StatelessWidget {
  const ClientApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        // initialRoute: AppRoutes.signin,
        // getPages: AppRoutes.routes,
        // translations: TAppTranslations(),
        // locale: const Locale('en'),
        // fallbackLocale: const Locale('en'),
        // initialBinding: SigninBinding(),
        home: const OrderScreen(),
      ),
    );
  }
}