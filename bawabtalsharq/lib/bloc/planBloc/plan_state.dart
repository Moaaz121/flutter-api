import 'package:bawabtalsharq/Model/plan_model.dart';

abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanLoadingState extends PlanState {}

class PlanLoadedState extends PlanState {
  PlanModel planResponse;
  PlanLoadedState({this.planResponse});
}

class PlanErrorState extends PlanState {
  String message;
  PlanErrorState({this.message});
}
