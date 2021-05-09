abstract class UpdateAccountEvent {}

class UpdateEvent extends UpdateAccountEvent {
  String userId;
  String apiKey;
  String firstName;
  String lastName;
  UpdateEvent(this.userId, this.apiKey, this.firstName, this.lastName);
}

class ResetState extends UpdateAccountEvent {}
