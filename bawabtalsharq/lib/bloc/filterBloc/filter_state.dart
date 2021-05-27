part of 'filter_bloc.dart';

abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoadingState extends FilterState {}

class FilterLoadedState extends FilterState {
  FilterModel filterResponse;
  FilterLoadedState({this.filterResponse});
}

class FilterErrorState extends FilterState {
  String message;
  FilterErrorState({this.message});
}
