import 'dart:convert';

import 'package:bawabtalsharq/Model/chat/chat_login.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

ChatLoginModel rocketUser;

final rocketHeaders = {
  "X-Auth-Token": "${rocketUser.data.authToken}",
  "X-User-Id": "${rocketUser.data.userId}",
  "Content-type": "application/json",
};

class RocketChatApi {
  Future<ChatLoginModel> loginRocket(
    String login,
    String password, {
    String resume = '',
  }) async {
    String url = '${APIS.chatBaseURL}${APIS.chatLoginURL}';
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
    String url = '${APIS.chatBaseURL}${APIS.chatSendMessageURL}';
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
