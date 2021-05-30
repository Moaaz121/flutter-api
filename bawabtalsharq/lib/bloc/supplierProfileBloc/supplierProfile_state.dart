import 'package:bawabtalsharq/Model/supplier_model.dart';

abstract class SupplierProfileState {}

class SupplierProfileInitial extends SupplierProfileState {}

class SupplierProfileLoadingState extends SupplierProfileState {}

class SupplierProfileLoadedState extends SupplierProfileState {
  SupplierProfileModel supplierProfileResponse;
  SupplierProfileLoadedState({this.supplierProfileResponse});
}

class SupplierProfileErrorState extends SupplierProfileState {
  String message;
  SupplierProfileErrorState({this.message});
}
