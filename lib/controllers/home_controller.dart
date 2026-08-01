import 'package:ai_chatbot_colab/services/db_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ai_chatbot_colab/services/api_chat_service.dart';
import 'dart:convert';

class HomeController extends GetxController {
  SQLData sqlData = SQLData();
  List userData = [];
  bool startChat = false;
  bool isLoadingMessages = true;
  int bottomIndex = 0;
  List previousChatsSessions = [];
  int? chatId;
  late TextEditingController chatController;
  final List<Map<String, String>> currentSession = [];
  void changeBottomIndex(int index) {
    bottomIndex = index;
    update();
  }

  /// Loading the user chats
  Future loadingMessages() async {
    List<Map> allSessions = await sqlData.readData(
      "SELECT MESSAGE FROM Chats WHERE USER_ID = ?",
      [userData[0]["ID"]],
    );

    if (allSessions.isEmpty) {
      return;
    }
    previousChatsSessions.clear();
    for (var session in allSessions) {
      previousChatsSessions.add(jsonDecode(session["MESSAGE"]));
    }

    print("loadingMessages finished");
  }

  Future logout() async {
    await sqlData.updateData(
      "UPDATE USERS SET IS_LOGGED_IN = 0 WHERE IS_LOGGED_IN = 1",
      [],
    );
  }

  /// Chatting function that sends the user message to the API and updates the chat with the bot's response.
  Future<void> chating(String email) async {
    if (chatController.text.trim().isEmpty) return;
    String userMessage = chatController.text.trim();

    currentSession.add({"Sender": email, "Message": userMessage});
    update();
    chatController.clear();
    try {
      String botResponse = await APIChatService().sendMessage(userMessage);
      currentSession.add({"Sender": "Bot", "Message": botResponse});
      update();
    } catch (e) {
      String errorMessage = e.toString().replaceFirst("Exception", "Error");
      currentSession.add({"Sender": "System", "Message": errorMessage});
      update();
      print("Error occurred: ===>>>$e");
    }

    // Store the chat in the database
    if (currentSession.isEmpty) return;
    String convertedSessions = jsonEncode(currentSession);
    if (chatId == null) {
      chatId = await sqlData.insertData(
        "INSERT INTO Chats (MESSAGE, USER_ID) VALUES(?, ?)",
        [convertedSessions, userData[0]["ID"]],
      );
    } else {
      await sqlData.updateData("UPDATE Chats SET MESSAGE = ? WHERE ID = ?", [
        convertedSessions,
        chatId,
      ]);
    }
    // Reloading the messages
    await loadingMessages();
    update();
  }

  Future readUserData() async {
    print("------> Start Reading User Data function");
    userData = await sqlData.readData(
      "SELECT * FROM USERS WHERE IS_LOGGED_IN = 1",
      [],
    );
    print("User Data------> $userData");
    await loadingMessages();
    isLoadingMessages = false;
    update();
    print("update called");
  }

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    readUserData();
  }

  @override
  void onClose() {
    chatController.dispose();
    super.onClose();
  }
}
