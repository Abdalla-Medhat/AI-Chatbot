import 'package:flutter/widgets.dart';
import 'package:get_x/get.dart';
import 'package:ai_chatbot_colab/services/api_chat_service.dart';

class HomeController extends GetxController {
  bool startChat = false;
  int bottomIndex = 0;
  late TextEditingController chatController;
  final List<Map<String, String>> messages = [];
  void changeBottomIndex(int index) {
    bottomIndex = index;
    update();
  }

  ///Chatting function that sends the user message to the API and updates the chat with the bot's response.
  Future<void> chating(String email) async {
    if (chatController.text.trim().isEmpty) return;
    String userMessage = chatController.text.trim();
    messages.add({"sender": email, "message": userMessage});
    update();
    chatController.clear();
    String botResponse = await APIChatService().sendMessage(userMessage);
    messages.add({"sender": "Bot", "message": botResponse});
    update();
  }

  @override
  void onInit() {
    chatController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    chatController.dispose();
    super.onClose();
  }
}
