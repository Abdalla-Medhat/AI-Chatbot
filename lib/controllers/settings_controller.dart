import 'package:ai_chatbot_colab/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool deletedData = false;
  SQLData sqlData = SQLData();
  String userEmail = "alex.design@example.com";
  int? userId;
  Future loadUserEmail() async {
    List<Map> data = await sqlData.readData(
      "SELECT * FROM USERS WHERE IS_LOGGED_IN = 1",
      [],
    );
    if (data.isNotEmpty) {
      userEmail = data[0]['EMAIL'];
      userId = data[0]['ID'];
      print("userEmail ====> $userEmail");
      print("userId ====> $userId");
      update();
    } else {
      return null;
    }
  }

  Future<int> clearUserChating() async {
    int response = await sqlData.deleteData(
      "DELETE FROM Chats WHERE USER_ID = ?",
      [userId],
    );
    print("response = $response");
    return response;
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
    update();

    // Get.forceAppUpdate();
  }
}
