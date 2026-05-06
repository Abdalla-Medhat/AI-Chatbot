import "package:http/http.dart";
import "dart:convert";

class APIChatService {
  //attention: don't forget to change the base url before uploading the file to github.
  String baseUrl = "http://example.com";

  ///Sending message function
  Future<String> sendMessage(String message) async {
    Uri url = Uri.parse("$baseUrl/chat");
    Response response = await post(
      url,
      body: jsonEncode({"message": message}),
      headers: {"Content-Type": "application/json"},
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data["response"];
    } else {
      throw Exception(data["error"]);
    }
  }
}
