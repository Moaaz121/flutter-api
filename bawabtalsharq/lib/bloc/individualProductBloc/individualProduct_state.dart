import 'package:bawabtalsharq/Model/individualProduct_model.dart';

abstract class IndividualProductState {}

class IndividualProductInitial extends IndividualProductState {}

class IndividualProductLoadingState extends IndividualProductState {}

class IndividualProductLoadedState extends IndividualProductState {
  ProductDetails individualProductResponse;
  IndividualProductLoadedState({this.individualProductResponse});
}

class IndividualProductErrorState extends IndividualProductState {
  String message;
  IndividualProductErrorState({this.message});
}
