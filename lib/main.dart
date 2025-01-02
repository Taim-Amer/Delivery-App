import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:delivery_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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