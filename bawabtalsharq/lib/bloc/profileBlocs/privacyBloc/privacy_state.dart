import 'package:bawabtalsharq/Model/privacy_model.dart';

abstract class PrivacyState {}

class PrivacyInitial extends PrivacyState {}

class PrivacyLoadingState extends PrivacyState {}

class PrivacyLoadedState extends PrivacyState {
  List<PrivacyData> privacyResponse;
  PrivacyLoadedState({this.privacyResponse});
}

class PrivacyErrorState extends PrivacyState {
  String message;
  PrivacyErrorState({this.message});
}
