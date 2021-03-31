part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  SendMessage();
}

//start Asmaa

//end Asmaa

//start karem

//end karem

class ResetState extends ChatEvent {}
