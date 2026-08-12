import 'package:ai_chatbot_colab/controllers/authentication_controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
