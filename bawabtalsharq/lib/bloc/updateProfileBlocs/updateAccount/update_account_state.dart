import 'package:bawabtalsharq/Model/user_model.dart';

abstract class UpdateAccountState {}

class UpdateAccountInitial extends UpdateAccountState {}

class UpdateAccountLoadingState extends UpdateAccountState {}

class UpdateAccountLoadedState extends UpdateAccountState {
  UserModel response;
  UpdateAccountLoadedState({this.response});
}

class UpdateAccountErrorState extends UpdateAccountState {
  String message;
  UpdateAccountErrorState({this.message});
}
