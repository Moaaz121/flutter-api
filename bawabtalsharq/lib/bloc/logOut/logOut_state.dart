import 'package:bawabtalsharq/Model/LogOut_model.dart';

abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogOutLoadingState extends LogOutState {}

class LogOutLoadedState extends LogOutState {
  LogOutModel logOutResponse;
  LogOutLoadedState({this.logOutResponse});
}
