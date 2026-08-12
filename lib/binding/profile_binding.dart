import 'package:ai_chatbot_colab/controllers/profile_controlle.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
