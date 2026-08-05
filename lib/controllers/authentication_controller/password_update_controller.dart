import 'package:ai_chatbot_colab/services/db_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

class PasswordUpdateController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isCurrentPassFocused = false;
  bool isNewPassFocused = false;
  bool isConfirmPassFocused = false;
  bool isPasswordVisible = false;

  // Error messages
  String? currentPassError;

  // Controllers for the TextFields
  late TextEditingController currentPassController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPassController;

  // FocusNodes for the TextFields
  late FocusNode currentPassFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmPassFocusNode;

  SQLData sqlData = SQLData();

  ///Checking if the password exists in the database
  Future<bool> checkPasswordExists(String password) async {
    List<Map> data = await sqlData.readData(
      "SELECT * FROM USERS WHERE PASSWORD=?",
      [password],
    );
    if (data.isNotEmpty) {
      return true; // Email exists
    } else {
      return false; // Email does not exist
    }
  }

  Future updatePassword(String password) async {
    int response = await sqlData.updateData(
      "UPDATE USERS SET PASSWORD = ? WHERE IS_LOGGED_IN = 1",
      [password],
    );
    print("====>$response");
    print("=====>updatePassword called");
    return response;
  }

  /// Email Validation using RegExp
  bool emailRegExp(String email) {
    return RegExp(
      r'^[a-z0-9]([a-z0-9_%+\-]|\.(?!\.))*[a-z0-9]@[a-z0-9][a-z0-9\-]*(\.[a-z0-9\-]+)*\.[a-z]{2,}$',
      caseSensitive: false,
    ).hasMatch(email);
  }

  /// Dealing with focus
  void setupfocus(FocusNode focusNode, Function(bool) onChange) {
    focusNode.addListener(() {
      onChange(focusNode.hasFocus);
      update();
    });
  }

  /// Password Visibility function
  void passIconVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    currentPassController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPassController = TextEditingController();

    currentPassFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPassFocusNode = FocusNode();

    // Listen to the focus changes To change the elevation in the TextField
    setupfocus(currentPassFocusNode, (val) => isCurrentPassFocused = val);
    setupfocus(newPasswordFocusNode, (val) => isNewPassFocused = val);
    setupfocus(confirmPassFocusNode, (val) => isConfirmPassFocused = val);
  }

  @override
  void onClose() {
    super.onClose();
    // Clear the memory.
    currentPassController.dispose();
    newPasswordController.dispose();
    confirmPassController.dispose();
    currentPassFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPassFocusNode.dispose();
  }
}
