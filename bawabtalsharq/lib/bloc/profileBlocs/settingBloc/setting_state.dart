import 'package:bawabtalsharq/Model/contactUs_model.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingLoadingState extends SettingState {}

class SettingLoadedState extends SettingState {
  Contact SettingResponse;
  SettingLoadedState({this.SettingResponse});
}

class SettingErrorState extends SettingState {
  String message;
  SettingErrorState({this.message});
}
