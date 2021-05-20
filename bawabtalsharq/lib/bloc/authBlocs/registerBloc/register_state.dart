import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:flutter/material.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class VerifyingPhoneLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  UserModel userResponse;
  RegisterLoadedState({this.userResponse});
}

class EnterSMSCodeState extends RegisterState {
  String verId;
  Map data;

  EnterSMSCodeState({@required this.verId, @required this.data});
}

class VerifyinCode extends RegisterState {
  Map data;

  VerifyinCode({@required this.data});
}

class ResumeRegisterState extends RegisterState {}

class FirebaseExceptionState extends RegisterState {
  String msg;

  FirebaseExceptionState({@required this.msg});
}
