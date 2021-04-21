abstract class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  String phone;
  String email;
  String password;
  String name;
  DoRegisterEvent(this.phone, this.email, this.name, this.password);
}

class ResetState extends RegisterEvent {}
