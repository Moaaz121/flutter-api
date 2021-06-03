import 'package:bawabtalsharq/Model/superior_model.dart';

abstract class SuperiorState {}

class SuperiorInitial extends SuperiorState {}

class SuperiorLoadingState extends SuperiorState {}

class SuperiorLoadedState extends SuperiorState {
  List<SuperiorData> superiorResponse;
  SuperiorLoadedState({this.superiorResponse});
}

class SuperiorErrorState extends SuperiorState {
  String message;
  SuperiorErrorState({this.message});
}

class SuperiorNetworkErrorState extends SuperiorState {}
