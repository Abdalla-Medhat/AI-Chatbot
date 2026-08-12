import 'package:ai_chatbot_colab/controllers/authentication_controller/signup_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
