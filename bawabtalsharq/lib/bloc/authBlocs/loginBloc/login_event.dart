abstract class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  String userName;
  String password;
  DoLoginEvent(this.userName, this.password);
}

class ResetState extends LoginEvent {}
