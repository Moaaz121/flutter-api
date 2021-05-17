abstract class IndividualProductEvent {}

class DoIndividualProductEvent extends IndividualProductEvent {
  String id;
  DoIndividualProductEvent(this.id);
}

class ResetState extends IndividualProductEvent {}
