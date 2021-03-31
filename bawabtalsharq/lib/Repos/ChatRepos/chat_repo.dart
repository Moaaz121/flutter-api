import 'dart:convert';

import 'package:bawabtalsharq/Model/chat/chat_login.dart';
import 'package:http/http.dart' as http;

ChatLoginModel rocketUser;

final rocketHeaders = {
  "X-Auth-Token": "${rocketUser.data.authToken}",
  "X-User-Id": "${rocketUser.data.userId}",
  "Content-type": "application/json",
};

class RocketChatApi {
  String _baseURL = "https://bawabtal-sharq.rocket.chat";

  Future<ChatLoginModel> loginRocket(
    String login,
    String password, {
    String resume = '',
  }) async {
    String url = '$_baseURL/api/v1/login';

    Map data;

    resume == ''
        ? data = {
            "user": "$login",
            "password": "$password",
          }
        : data = {
            "resume": "$resume",
          };

    http.Response response = await http.post(
      url,
      body: data,
    );

    if (json.decode(response.body)["status"] == "error") {
      return null;
    } else {
      ChatLoginModel user = ChatLoginModel.fromJson(json.decode(response.body));
      rocketUser = user;
      print(user.data.me.username);
      return user;
    }
  }

  Future<dynamic> sendMessage(String room, String message) async {
    String url = '$_baseURL/api/v1/chat.postMessage';

    Map data = {
      "roomId": "$room",
      "text": "$message",
    };

    http.Response response = await http.post(
      url,
      body: json.encode(data),
      headers: rocketHeaders,
    );

    print(response.body);
    return json.decode(response.body);
  }

//start Asmaa

//end Asmaa

//start karem

//end karem
}
