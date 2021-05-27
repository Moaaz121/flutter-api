abstract class LogOutEvent {}

class GetLogOutData extends LogOutEvent {
  String userId;
  String apiKey;
  GetLogOutData(this.userId, this.apiKey);
}

class ResetState extends LogOutEvent {}
