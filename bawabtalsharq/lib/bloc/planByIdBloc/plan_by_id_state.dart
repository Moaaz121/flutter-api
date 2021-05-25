import 'package:bawabtalsharq/Model/plan_model.dart';

abstract class PlanByIdState {}

class PlanByIdInitial extends PlanByIdState {}

class PlanByIdLoadingState extends PlanByIdState {}

class PlanByIdLoadedState extends PlanByIdState {
  PlanModel planResponse;
  PlanByIdLoadedState({this.planResponse});
}

class PlanByIdErrorState extends PlanByIdState {
  String message;
  PlanByIdErrorState({this.message});
}
