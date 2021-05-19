import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:flutter/material.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  UserModel userResponse;
  RegisterLoadedState({this.userResponse});
}

class EnterSMSCodeState extends RegisterState {
  String verId;

  EnterSMSCodeState({@required this.verId});
}

class ResumeRegisterState extends RegisterState {}
