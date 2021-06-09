import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:flutter/material.dart';

abstract class VerifyphoneState {}

class VerifyphoneInitial extends VerifyphoneState {}

//Countries List
class LoadingCountriesState extends VerifyphoneState {}

class LoadedCountriesState extends VerifyphoneState {
  List<CountryData> countries;
  LoadedCountriesState({@required this.countries});
}

class ShowLoadedCountriesState extends VerifyphoneState {}

//Verify Phone
class VerifyingPhoneLoadingState extends VerifyphoneState {}

class EnterSMSCodeState extends VerifyphoneState {
  String verId;
  Map data;

  EnterSMSCodeState({@required this.verId, @required this.data});
}

class FirebaseExceptionState extends VerifyphoneState {
  String msg;

  FirebaseExceptionState({@required this.msg});
}

class VerifyphoneNetworkErrorState extends VerifyphoneState {}
 