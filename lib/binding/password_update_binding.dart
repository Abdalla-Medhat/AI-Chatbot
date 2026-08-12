import 'package:ai_chatbot_colab/controllers/authentication_controller/password_update_controller.dart';
import 'package:get/get.dart';

class PasswordUpdateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PasswordUpdateController());
  }
}
