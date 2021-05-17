abstract class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {
  String userId;
  String apiKey;
  GetHistoryEvent(this.userId, this.apiKey);
}

class ResetState extends HistoryEvent {}
