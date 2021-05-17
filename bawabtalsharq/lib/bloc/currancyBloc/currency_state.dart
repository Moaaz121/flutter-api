import 'package:bawabtalsharq/Model/currency_model.dart';

abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoadingState extends CurrencyState {}

class CurrencyLoadedState extends CurrencyState {
  CurrencyModel currencyResponse;
  CurrencyLoadedState({this.currencyResponse});
}
