import 'dart:convert';

import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart'
    as rocket_http_service;
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class chatTest extends StatefulWidget {
  @override
  _chatTestState createState() => _chatTestState();
}

class _chatTestState extends State<chatTest> {
  WebSocketChannel webSocketChannel;
  WebSocketService webSocketService = WebSocketService();
  User user;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Authentication>(
        future: getAuthentication(),
        builder: (context, AsyncSnapshot<Authentication> snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data.data.me;
            webSocketChannel = webSocketService.connectToWebSocket(
                APIS.socketURL, snapshot.data);
            webSocketService.streamNotifyUserSubscribe(webSocketChannel, user);
            return Scaffold(
              body: Center(
                  child: FlatButton(
                      child: Text('send message'),
                      onPressed: () {
                        webSocketService.sendMessageOnRoom(
                            'helloooo', webSocketChannel, Room(id: 'general'));

                        // webSocketService.sendMessageOnChannel('hello socket',
                        //     webSocketChannel, Channel(id: 'general'));
                      })),
            );
          } else {
            return Text('failed');
          }
        });
  }

  void sendMessageOnRoom(
      String message, WebSocketChannel webSocketChannel, Room room) {
    Map msg = {
      "msg": "method",
      "method": "sendMessage",
      "id": "42",
      "params": [
        {"rid": room.id, "msg": message}
      ]
    };

    webSocketChannel.sink.add(jsonEncode(msg));
  }

  Future<Authentication> getAuthentication() async {
    final rocket_http_service.HttpService rocketHttpService =
        rocket_http_service.HttpService(APIS.chatBaseURL);
    final AuthenticationService authenticationService =
        AuthenticationService(rocketHttpService);
    return await authenticationService.login(
        'asmaatarek93@gmail.com', '12345678');
  }
}
