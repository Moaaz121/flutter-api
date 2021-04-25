import 'package:bawabtalsharq/Model/user_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  UserModel userResponse;
  RegisterLoadedState({this.userResponse});
}
