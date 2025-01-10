import 'package:delivery_app/features/authentication/views/signin/login_screen.dart';
import 'package:delivery_app/features/authentication/views/signup/register_screen.dart';
import 'package:delivery_app/features/personal/controllers/settings_controller.dart';
import 'package:delivery_app/navigation_menu.dart';
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
    Get.put<SettingsController>(SettingsController());
    print(TCacheHelper.getData(key: 'token'));
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: SettingsController.instance.themeMode.value,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: const NavigationMenu(),
      )),
    );
  }
}