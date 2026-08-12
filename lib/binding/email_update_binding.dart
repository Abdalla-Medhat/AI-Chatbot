import 'package:ai_chatbot_colab/controllers/authentication_controller/email_update_controller.dart';
import 'package:get/get.dart';

class EmailUpdateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EmailUpdateController());
  }
}
