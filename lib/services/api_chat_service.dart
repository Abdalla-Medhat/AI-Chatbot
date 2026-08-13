import "package:http/http.dart";
import "dart:convert";
import "dart:io";

class APIChatService {
  //attention: don't forget to change the base url before uploading the file to github.
  String baseUrl =
      "https://ai-chatbot-kappa-lovat.vercel.app"; // Replace with your server URL

  ///Sending message function
  Future<String> sendMessage(String message) async {
    Uri url = Uri.parse("$baseUrl/chat");
    try {
      Response response = await post(
        url,
        body: jsonEncode({"message": message}),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["response"];
      } else {
        throw Exception("Unable to connect to server");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on FormatException {
      throw Exception("Bad response format");
    } catch (e) {
      throw Exception("Unexpected error: =======>>>$e");
    }
  }
}
