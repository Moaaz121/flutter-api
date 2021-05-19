import 'package:flutter/foundation.dart';

abstract class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  String phone;
  String email;
  String password;
  String name;
  String userType;
  DoRegisterEvent(
      this.phone, this.email, this.name, this.password, this.userType);
}

class ResetState extends RegisterEvent {}

class VerifyPhone extends RegisterEvent {
  Map data;

  VerifyPhone({@required this.data});
}

class SignWithOTP extends RegisterEvent {
  String verId, smsCode;

  SignWithOTP({@required this.verId, @required this.smsCode});
}
