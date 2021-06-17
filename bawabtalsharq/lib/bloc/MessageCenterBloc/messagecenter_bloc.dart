import 'dart:async';

import 'package:bloc/bloc.dart';
import 'messagecenter_event.dart';
import 'messagecenter_state.dart';

import 'package:bawabtalsharq/Model/MessageCenterModel.dart';
import 'package:bawabtalsharq/repo/message_center_repo.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';

class MessagecenterBloc extends Bloc<MessagecenterEvent, MessagecenterState> {
  @override
  Stream<MessagecenterState> mapEventToState(
    MessagecenterEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is GetMessagesData) {
      yield LoadingState();
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        List<MessageCenterData> messages =
            await MessageCenterRepo().messageCenter();

        yield LoadedMessagesState(msgList: messages);
      } else {
        yield MsgCenterNetworkErrorState();
      }
    }
  }

  @override
  // TODO: implement initialState
  MessagecenterState get initialState => MessagecenterInitial();
}
