import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    //start Asmaa

    //end Asmaa

    //start karem

    //end karem
  }

  @override
  // TODO: implement initialState
  ChatState get initialState => ChatInitial();
}
