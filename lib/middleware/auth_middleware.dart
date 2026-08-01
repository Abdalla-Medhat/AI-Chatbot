import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:ai_chatbot_colab/main.dart";

class AuthMidillware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print("===>redirect called");
    print(route);

    if (data.isNotEmpty) {
      print("===>redirect to home");
      return const RouteSettings(name: "/home");
    }

    print("===>continue login");
    return null;
  }
}
