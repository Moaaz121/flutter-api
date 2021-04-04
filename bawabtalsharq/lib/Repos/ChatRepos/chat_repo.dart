import 'dart:async';

import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';
import 'package:rocket_chat_connector_flutter/models/new/message_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/response/message_new_response.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/models/room_messages.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart'
    as rocket_http_service;
import 'package:rocket_chat_connector_flutter/services/message_service.dart';
import 'package:rocket_chat_connector_flutter/services/room_service.dart';

Authentication rocketUser;

final rocketHeaders = {
  "X-Auth-Token": "${rocketUser.data.authToken}",
  "X-User-Id": "${rocketUser.data.userId}",
};

class RocketChatApi {
  final rocket_http_service.HttpService _rocketHttpService =
      rocket_http_service.HttpService(APIS.chatBaseURL);

  Future<Authentication> loginRocket(String username, String password) async {
    AuthenticationService authenticationService =
        AuthenticationService(_rocketHttpService);
    return await authenticationService.login(username, password);
  }

  Future<dynamic> sendMessage(String room, String text) async {
    MessageNew message = MessageNew(text: text, roomId: room);
    MessageService messageService = MessageService(_rocketHttpService);
    MessageNewResponse result =
        await messageService.postMessage(message, rocketUser);
    print(result.success);
  }

  Future<dynamic> createChannel(String channelName) async {
    ChannelService channelService = ChannelService(_rocketHttpService);
    ChannelNew newChannel = ChannelNew(name: channelName);
    ChannelNewResponse channelNewResponse =
        await channelService.create(newChannel, rocketUser);
    print(channelNewResponse.success);
  }

  Future<RoomMessages> getChannelMessages() async {
    RoomService roomService = RoomService(_rocketHttpService);
    RoomMessages roomMessages =
        await roomService.messages(Room(id: 'general'), rocketUser);
    print(roomMessages.messages);
    return roomMessages;
  }

//start Asmaa

//end Asmaa

//start karem
  Future<dynamic> sendFile(String room, String filePath) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('http://digitalxmax.com:3000/api/v1/rooms.upload/' + room));
    request.files.add(await http.MultipartFile.fromPath('file', filePath,
        filename: 'Kareem File Name', contentType: MediaType('image', 'jpg')));
    request.headers.addAll(rocketHeaders);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
//end karem
}
