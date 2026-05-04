import 'package:ai_chatbot_colab/repository/data.dart';
import 'package:get_x/get.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  // Instance of the SQLData class to begin interacting with the database
  SQLData sqlData = SQLData();

  // Key for the Form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // TextEditingControllers for the TextFields
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  // FocusNodes for the TextFields
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPassFocusNode;

  bool isEmailFocused = false;
  bool isPassFocused = false;
  bool isConfirmPassFocused = false;
  bool isPasswordVisible = false;
  bool isConfirmPassVisible = false;

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

  /// Confirm Password Visibility
  void confirmPassIconVisibility() {
    isConfirmPassVisible = !isConfirmPassVisible;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPassFocusNode = FocusNode();

    // Listen to the focus changes To change the elevation in the TextField
    setupfocus(emailFocusNode, (val) => isEmailFocused = val);
    setupfocus(passwordFocusNode, (val) => isPassFocused = val);
    setupfocus(confirmPassFocusNode, (val) => isConfirmPassFocused = val);
  }

  @override
  void onClose() {
    super.onClose();
    // Clear the memory.
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPassFocusNode.dispose();
  }

  ///Checking Email function to check if the email is already exists in the database or not
  Future<String?> checkEmail(String email) async {
    List data = await sqlData.readData(
      "SELECT EMAIL from Users WHERE EMAIL='$email'",
    );

    if (data.isNotEmpty) {
      return "This Email is already exists.";
    }

    return null;
  }

  /// Adding User to the database
  Future addingUser(String email, String password) async {
    int response = await sqlData.insertData(
      "INSERT INTO `USERS` (EMAIL,PASSWORD) VALUES ('$email','$password')",
    );
    return response;
  }
}
