import 'package:ai_chatbot_colab/binding/email_update_binding.dart';
import 'package:ai_chatbot_colab/binding/home_binding.dart';
import 'package:ai_chatbot_colab/binding/login_binding.dart';
import 'package:ai_chatbot_colab/binding/password_update_binding.dart';
import 'package:ai_chatbot_colab/binding/profile_binding.dart';
import 'package:ai_chatbot_colab/binding/settings_binding.dart';
import 'package:ai_chatbot_colab/binding/signup_binding.dart';
import 'package:flutter/material.dart';
import 'package:ai_chatbot_colab/middleware/auth_middleware.dart';
import 'package:ai_chatbot_colab/view/auth/signup.dart';
import 'package:ai_chatbot_colab/theme/themes.dart';
import 'package:ai_chatbot_colab/view/auth/login.dart';
import 'package:ai_chatbot_colab/view/home.dart';
import 'package:ai_chatbot_colab/view/profile.dart';
import 'package:ai_chatbot_colab/view/privacy_policy.dart';
import 'package:ai_chatbot_colab/view/settings.dart';
import 'package:ai_chatbot_colab/view/update_auth/email_update.dart';
import 'package:ai_chatbot_colab/view/update_auth/password_update.dart';
import 'package:get/get.dart';
import 'package:ai_chatbot_colab/services/db_service.dart';

SQLData sqlData = SQLData();
late List<Map> data;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    data = await sqlData.readData(
      "SELECT IS_LOGGED_IN FROM USERS WHERE IS_LOGGED_IN = 1",
      [],
    );
    print("==========================================");
    print("READ DATA RESULT: $data");
    print("DATA IS EMPTY? ${data.isEmpty}");
    print("==========================================");
  } catch (e) {
    print("==========================================");
    print("EXPECTED ERROR (Table/DB clean): $e");
    print("==========================================");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The root of the application.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      title: "Chat Bot",
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => Login(),
          binding: LoginBinding(),
          middlewares: [AuthMidillware()],
        ),
        GetPage(name: "/home", page: () => Home(), binding: HomeBinding()),
        GetPage(
          name: "/sign_up",
          page: () => SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/settings",
          page: () => Settings(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: "/email_update",
          page: () => EmailUpdate(),
          binding: EmailUpdateBinding(),
        ),
        GetPage(
          name: "/password_update",
          page: () => PasswordUpdate(),
          binding: PasswordUpdateBinding(),
        ),
        GetPage(name: "/privacy_policy", page: () => PrivacyPolicy()),
        GetPage(
          name: "/profile",
          page: () => Profile(),
          binding: ProfileBinding(),
        ),
      ],
    );
  }
}
