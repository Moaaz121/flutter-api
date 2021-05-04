abstract class ChangePasswordEvent {}

class PasswordChangeEvent extends ChangePasswordEvent {
  String userId;
  String apiKey;
  String newPassword;
  String oldPassword;
  PasswordChangeEvent(
      this.userId, this.apiKey, this.oldPassword, this.newPassword);
}

class ResetState extends ChangePasswordEvent {}
