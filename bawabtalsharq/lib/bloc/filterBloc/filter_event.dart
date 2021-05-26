part of 'filter_bloc.dart';

abstract class FilterEvent {}

class DoFilterEvent extends FilterEvent {}

class ResetState extends FilterEvent {}

class FilterPressEvent extends FilterEvent {
  FilterPressEvent();
}
