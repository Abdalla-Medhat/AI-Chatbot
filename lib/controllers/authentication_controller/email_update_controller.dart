import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_chatbot_colab/services/db_service.dart';

class EmailUpdateController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController currentEmail;
  late TextEditingController newEmail;
  late TextEditingController confirmEmail;
  late FocusNode currentEmailFocusNode;
  late FocusNode newEmailFocusNode;
  late FocusNode confirmEmailFocusNode;

  // Focus state detection variables
  bool isCurrentEmailFocused = false;
  bool isNewEmailFocused = false;
  bool isConfirmEmailFocused = false;

  /// Dealing with focus
  void setupfocus(FocusNode focusNode, Function(bool) onChange) {
    focusNode.addListener(() {
      onChange(focusNode.hasFocus);
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    currentEmail = TextEditingController();
    newEmail = TextEditingController();
    confirmEmail = TextEditingController();
    currentEmailFocusNode = FocusNode();
    newEmailFocusNode = FocusNode();
    confirmEmailFocusNode = FocusNode();
    setupfocus(currentEmailFocusNode, (val) => isCurrentEmailFocused = val);
    setupfocus(newEmailFocusNode, (val) => isNewEmailFocused = val);
    setupfocus(confirmEmailFocusNode, (val) => isConfirmEmailFocused = val);
  }

  String? existingErrorText;
  String? sameEmailErrorText;

  SQLData sqlData = SQLData();

  ///Checking if the email exists in the database
  Future<bool> checkEmailExists(String email) async {
    List<Map> data = await sqlData.readData(
      "SELECT * FROM USERS WHERE EMAIL=?",
      [email],
    );
    if (data.isNotEmpty) {
      return true; // Email exists
    } else {
      return false; // Email does not exist
    }
  }

  /// Email Validation using RegExp
  bool emailRegExp(String email) {
    return RegExp(
      r'^[a-z0-9]([a-z0-9_%+\-]|\.(?!\.))*[a-z0-9]@[a-z0-9][a-z0-9\-]*(\.[a-z0-9\-]+)*\.[a-z]{2,}$',
      caseSensitive: false,
    ).hasMatch(email);
  }

  /// Email Validation function
  String? isEmailValid(String email) {
    if (email.isEmpty) {
      return 'Please enter some text';
    } else if (email.split("@").first.length > 64) {
      return "Before <@> the string is too long";
    } else if (email.length > 254) {
      return "The Email is too long";
    } else if (emailRegExp(email) == false) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  Future updateEmail(String email) async {
    int response = await sqlData.updateData(
      "UPDATE USERS SET EMAIL = ? WHERE IS_LOGGED_IN = 1",
      [email],
    );
    return response;
  }

  @override
  void onClose() {
    currentEmail.dispose();
    newEmail.dispose();
    confirmEmail.dispose();
    currentEmailFocusNode.dispose();
    newEmailFocusNode.dispose();
    confirmEmailFocusNode.dispose();
    super.onClose();
  }
}
