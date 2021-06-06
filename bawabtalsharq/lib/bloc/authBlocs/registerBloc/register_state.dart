import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:flutter/material.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  UserModel userResponse;
  RegisterLoadedState({this.userResponse});
}

class ResumeRegisterState extends RegisterState {}

class FirebaseExceptionState extends RegisterState {
  String msg;

  FirebaseExceptionState({@required this.msg});
}

class PhoneAlreadyRegisteredState extends RegisterState {
  String msg;
  PhoneAlreadyRegisteredState({@required this.msg});
}

class ReReisgterWithNewNumber extends RegisterState {}

class RegisterNetworkErrorState extends RegisterState {}
