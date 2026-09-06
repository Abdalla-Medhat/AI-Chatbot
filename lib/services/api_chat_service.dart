import "package:http/http.dart";
import "dart:convert";
import "dart:io";
import "dart:async";

class APIChatService {
  static const String baseUrl =
      "https://ai-chatbot-kappa-lovat.vercel.app"; // Replace with your server URL

  static const String apiKey = String.fromEnvironment("API_KEY");

  ///Sending message function
  Future<String> sendMessage(String message) async {
    final Uri url = Uri.parse("$baseUrl/chat");
    try {
      Response response = await post(
        url,
        body: jsonEncode({"message": message}),
        headers: {"Content-Type": "application/json", "X-API-Key": apiKey},
      ).timeout(Duration(seconds: 30));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["response"];
      } else {
        throw Exception("${response.statusCode}: ${response.reasonPhrase}");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request timed out");
    } catch (e) {
      throw Exception("Unexpected error: =======>>>$e");
    }
  }
}
