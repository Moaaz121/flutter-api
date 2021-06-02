abstract class ForgetPasswordEvent {}

class DoForgetPasswordEvent extends ForgetPasswordEvent {
  String email;
  DoForgetPasswordEvent(this.email);
}

class ResetState extends ForgetPasswordEvent {}
