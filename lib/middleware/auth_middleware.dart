import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:ai_chatbot_colab/main.dart";

class AuthMidillware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (data.isNotEmpty) {
      return const RouteSettings(name: "/home");
    }
    return null;
  }
}
