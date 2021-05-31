abstract class IndividualProductEvent {}

class DoIndividualProductEvent extends IndividualProductEvent {
  String id;
  DoIndividualProductEvent(this.id);
}

class DoHistoryEvent extends IndividualProductEvent {
  String userId;
  String apiKey;
  String productId;
  DoHistoryEvent(this.userId, this.apiKey, this.productId);
}

class ResetState extends IndividualProductEvent {}
