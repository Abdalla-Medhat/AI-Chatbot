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

  void setupfocus(FocusNode focusNode, Function(bool) onChange) {
    focusNode.addListener(() {
      onChange(focusNode.hasFocus);
      update();
    });
  }

  void passIconVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

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
