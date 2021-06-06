import 'package:flutter/material.dart';

@immutable
abstract class VerifyphoneEvent {}

class GetCountries extends VerifyphoneEvent {}

class VerifyPhone extends VerifyphoneEvent {
  Map data;

  VerifyPhone({@required this.data});
}
