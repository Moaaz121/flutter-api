import 'package:bawabtalsharq/Model/golden_suppliers_model.dart';

abstract class GoldenState {}

class GoldenInitial extends GoldenState {}

class GoldenLoadingState extends GoldenState {}

class GoldenLoadedState extends GoldenState {
  List<Suppliers> suppliers;
  GoldenLoadedState({this.suppliers});
}

class GoldenErrorState extends GoldenState {
  String message;
  GoldenErrorState({this.message});
}
