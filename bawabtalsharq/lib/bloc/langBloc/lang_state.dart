import 'package:bawabtalsharq/Model/lang_model.dart';

abstract class LangState {}

class LangInitial extends LangState {}

class LangLoadingState extends LangState {}

class LangLoadedState extends LangState {
  LangModel langResponse;
  LangLoadedState({this.langResponse});
}
