// import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
// import 'package:bawabtalsharq/Utils/apis.dart';
// import 'package:rocket_chat_connector_flutter/models/channel.dart';
// import 'package:rocket_chat_connector_flutter/models/room.dart';
// import 'package:rocket_chat_connector_flutter/models/user.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'chat_repo.dart';

class SocketChat {
  WebSocketChannel webSocketChannel;
  WebSocketService webSocketService = WebSocketService();

  void connectToSocket() {
    webSocketChannel =
        webSocketService.connectToWebSocket(APIS.socketURL, rocketUser);
    webSocketService.streamNotifyUserSubscribe(
        webSocketChannel, rocketUser.data.me);
    webSocketService.sendMessageOnRoom(
        'hi', webSocketChannel, Room(id: 'general'));
  }
}
