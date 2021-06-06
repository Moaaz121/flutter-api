import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Model/individualProduct_model.dart';

abstract class IndividualProductState {}

class IndividualProductInitial extends IndividualProductState {}

class IndividualProductLoadingState extends IndividualProductState {}

class IndividualProductLoadedState extends IndividualProductState {
  IndividualProductModel individualProductResponse;
  IndividualProductLoadedState({this.individualProductResponse});
}

class IndividualProductErrorState extends IndividualProductState {
  String message;
  IndividualProductErrorState({this.message});
}

class HistoryInitial extends IndividualProductState {}

class HistoryLoadingState extends IndividualProductState {}

class HistoryLoadedState extends IndividualProductState {
  BaseModel historyResponse;
  HistoryLoadedState({this.historyResponse});
}

class HistoryErrorState extends IndividualProductState {
  String message;
  HistoryErrorState({this.message});
}

class IndividualProductNetworkErrorState extends IndividualProductState {}
