import 'package:bawabtalsharq/Model/user_model.dart';
import 'dart:io';

abstract class UpdateAccountEvent {}

class UpdateEvent extends UpdateAccountEvent {
  UserLocal currentUser;
  File image;

  UpdateEvent(this.currentUser, {this.image});
}

class ResetState extends UpdateAccountEvent {}
