import 'package:ai_chatbot_colab/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:ai_chatbot_colab/view/home.dart';
import 'package:ai_chatbot_colab/view/login.dart';
import 'package:ai_chatbot_colab/view/themes.dart';
import 'package:get_x/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      title: "Chat Bot",
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Login()),
        GetPage(name: "/home", page: () => const Home()),
        GetPage(name: "/sign_up", page: () => SignUp()),
      ],
    );
  }
}
