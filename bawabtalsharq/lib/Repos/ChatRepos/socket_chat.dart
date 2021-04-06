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

  void connectToSocket(String roomID) {
    webSocketChannel =
        webSocketService.connectToWebSocket(APIS.socketURL, rocketUser);
  }

  void notifyUser() {
    webSocketService.streamNotifyUserSubscribe(
        webSocketChannel, rocketUser.data.me);
  }

  void subscribeToRoom(String roomID) {
    webSocketService.streamRoomMessagesSubscribe(
        webSocketChannel, Room(id: roomID));
  }

  void unsubscribeToRoom(String roomID) {
    webSocketService.streamRoomMessagesUnsubscribe(
        webSocketChannel, Room(id: roomID));
  }

  void sendMessage(String room, String message) {
    webSocketService.sendMessageOnRoom(
        message, webSocketChannel, Room(id: room));
  }

  void closeSocket(String roomID) {
    unsubscribeToRoom(roomID);
    webSocketChannel.sink.close();
  }
}
