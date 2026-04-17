import 'package:get_x/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool isEmailFocused = false;
  bool isPassFocused = false;
  bool isPasswordVisible = false;

  void passIconVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    // Listen to the focus changes To change the elevation in the TextField

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    emailFocusNode.addListener(() {
      isEmailFocused = emailFocusNode.hasFocus;
      update();
    });
    passwordFocusNode.addListener(() {
      isPassFocused = passwordFocusNode.hasFocus;
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    // Clear the memory.
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
