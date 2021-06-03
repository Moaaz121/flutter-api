import 'package:bawabtalsharq/Model/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  UserModel userResponse;
  LoginLoadedState({this.userResponse});
}

class LoginNetworkErrorState extends LoginState {}
