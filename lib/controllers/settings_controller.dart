import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool isDarkMode = Get.isDarkMode;
  toggleDarkMode(bool value) {
    isDarkMode = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    // Get.changeTheme(value ? AppThemes.darkTheme : AppThemes.lightTheme);
    update();

    // Get.forceAppUpdate();
  }
}
