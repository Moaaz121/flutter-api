import 'dart:async';

import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  RocketChatApi chatApi = RocketChatApi();
  ChatBloc(ChatState initialState) : super(initialState);

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {}

  @override
  // TODO: implement initialState
  ChatState get initialState => ChatInitial();
}
