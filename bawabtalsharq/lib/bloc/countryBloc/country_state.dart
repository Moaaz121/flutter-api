import 'package:bawabtalsharq/Model/country_model.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoadingState extends CountryState {}

class CountryLoadedState extends CountryState {
  CountryModel countryResponse;
  CountryLoadedState({this.countryResponse});
}
