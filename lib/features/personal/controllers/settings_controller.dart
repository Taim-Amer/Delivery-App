import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  var themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    String? savedTheme = TCacheHelper.getData(key: "themeMode");
    if (savedTheme == "light") {
      themeMode.value = ThemeMode.light;
    } else if (savedTheme == "dark") {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.system;
    }
  }

  void updateThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    String themeString = mode == ThemeMode.light ? "light" : mode == ThemeMode.dark ? "dark" : "system";
    TCacheHelper.saveData(key: "themeMode", value: themeString);
  }
}