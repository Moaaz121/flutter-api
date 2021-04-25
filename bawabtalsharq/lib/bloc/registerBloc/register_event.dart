abstract class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  String phone;
  String email;
  String password;
  String name;
  String userType;
  DoRegisterEvent(
      this.phone, this.email, this.name, this.password, this.userType);
}

class ResetState extends RegisterEvent {}
