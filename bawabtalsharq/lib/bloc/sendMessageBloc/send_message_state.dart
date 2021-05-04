import 'package:bawabtalsharq/Model/base_model.dart';

abstract class SendMessageState {}

class SendMessageInitial extends SendMessageState {}

class LoadingState extends SendMessageState {}

class SentState extends SendMessageState {
  BaseModel messageResponse;
  SentState({this.messageResponse});
}
