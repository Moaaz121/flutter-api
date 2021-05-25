import 'package:bawabtalsharq/Model/search_quary.dart';

abstract class SearchEvent {}

class DoSearchEvent extends SearchEvent {
  SearchQueryModel searchQueryModel;

  DoSearchEvent(this.searchQueryModel);
}

class ResetState extends SearchEvent {}
