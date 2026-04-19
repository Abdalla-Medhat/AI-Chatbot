import 'package:get_x/get.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

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
    ).hasMatch(email);
  }

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
}
