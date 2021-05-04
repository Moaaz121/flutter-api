import 'package:bawabtalsharq/Model/base_model.dart';

abstract class ChangePasswordState {}

class PasswordChangeInitial extends ChangePasswordState {}

class PasswordChangeLoadingState extends ChangePasswordState {}

class PasswordChangeLoadedState extends ChangePasswordState {
  BaseModel response;
  PasswordChangeLoadedState({this.response});
}

class ChangePasswordErrorState extends ChangePasswordState {
  String message;
  ChangePasswordErrorState({this.message});
}
