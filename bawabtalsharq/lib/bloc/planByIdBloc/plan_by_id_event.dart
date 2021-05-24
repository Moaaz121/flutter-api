abstract class PlanByIdEvent {}

class GetPlanByIdEvent extends PlanByIdEvent {
  String planId;
  GetPlanByIdEvent(this.planId);
}

class ResetState extends PlanByIdEvent {}
