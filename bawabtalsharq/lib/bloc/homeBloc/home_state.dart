import 'package:bawabtalsharq/Model/home_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  HomeModel homeResponse;
  HomeLoadedState({this.homeResponse});
}

class HomeNoInternetState extends HomeState {}
