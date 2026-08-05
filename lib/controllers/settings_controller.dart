import 'package:ai_chatbot_colab/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  SQLData sqlData = SQLData();
  String userEmail = "alex.design@example.com";
  Future loadUserEmail() async {
    List<Map> data = await sqlData.readData(
      "SELECT EMAIL FROM USERS WHERE IS_LOGGED_IN = 1",
      [],
    );
    if (data.isNotEmpty) {
      userEmail = data[0]['EMAIL'];
      update();
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUserEmail();
  }

  bool isDarkMode = Get.isDarkMode;
  toggleDarkMode(bool value) {
    isDarkMode = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    // Get.changeTheme(value ? AppThemes.darkTheme : AppThemes.lightTheme);
    update();

    // Get.forceAppUpdate();
  }
}
