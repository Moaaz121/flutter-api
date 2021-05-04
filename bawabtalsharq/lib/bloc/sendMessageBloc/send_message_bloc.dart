import 'dart:async';

import 'package:bawabtalsharq/bloc/sendMessageBloc/send_message_state.dart';
import 'package:bawabtalsharq/repo/contact_repo.dart';
import 'package:bloc/bloc.dart';

part 'send_message_event.dart';

class SendMessageBloc extends Bloc<SendEvent, SendMessageState> {
  @override
  Stream<SendMessageState> mapEventToState(
    SendEvent event,
  ) async* {
    if (event is SendMessageEvent) {
      yield LoadingState();
      var response = await ContactRepo()
          .contactMessage(event.email, event.subject, event.message);

      yield SentState(messageResponse: response);
    } else if (event is SendMessageInitial) {
      yield SendMessageInitial();
    }
  }

  @override
  SendMessageState get initialState => SendMessageInitial();
}