import 'package:bawabtalsharq/Model/user_model.dart';

abstract class UpdateAccountEvent {}

class UpdateEvent extends UpdateAccountEvent {
  UserLocal currentUser;
  UpdateEvent(this.currentUser);
}

class ResetState extends UpdateAccountEvent {}
