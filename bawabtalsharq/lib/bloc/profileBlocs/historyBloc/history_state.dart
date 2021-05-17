import 'package:bawabtalsharq/Model/history_model.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  HistoryModel response;
  HistoryLoadedState({this.response});
}

class HistoryErrorState extends HistoryState {
  String message;
  HistoryErrorState({this.message});
}
