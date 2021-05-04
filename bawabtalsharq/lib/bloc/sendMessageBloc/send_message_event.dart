part of 'send_message_bloc.dart';

abstract class SendMessageEvent {}

class SendEvent extends SendMessageEvent {
  String email;
  String subject;
  String message;

  SendEvent(this.email, this.subject, this.message);
}
