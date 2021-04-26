import 'package:bawabtalsharq/Model/aboutUs_model.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoadingState extends AboutUsState {}

class AboutUsLoadedState extends AboutUsState {
  List<AboutData> aboutUsResponse;
  AboutUsLoadedState({this.aboutUsResponse});
}

class AboutUsErrorState extends AboutUsState {
  String message;
  AboutUsErrorState({this.message});
}
