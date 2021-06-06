import 'package:flutter/foundation.dart';

abstract class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  String phone;
  String email;
  String password;
  String firstname;
  String lastname;
  String userType;
  String country;
  String company;
  DoRegisterEvent(
      {@required this.phone,
      @required this.email,
      @required this.firstname,
      @required this.lastname,
      @required this.password,
      @required this.userType,
      @required this.country,
      @required this.company});
}

class ResetState extends RegisterEvent {}

class SignWithOTP extends RegisterEvent {
  String verId, smsCode;

  SignWithOTP({@required this.verId, @required this.smsCode});
}

class ReRegister extends RegisterEvent {}
