import 'package:bawabtalsharq/Model/base_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordLoadedState extends ForgetPasswordState {
  BaseModel baseModel;
  ForgetPasswordLoadedState({this.baseModel});
}
