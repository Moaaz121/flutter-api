part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  SendMessage();
}

class ResetState extends ChatEvent {}
