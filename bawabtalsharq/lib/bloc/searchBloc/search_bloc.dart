import 'dart:async';

import 'package:bawabtalsharq/Model/search_model.dart';
import 'package:bawabtalsharq/repo/search_repo.dart';
import 'package:bloc/bloc.dart';

import 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is DoSearchEvent) {
      yield SearchLoadingState();
      var response = await SearchRepo()
          .getSearch(event.q, categories: event.categories, page: event.page);

      yield SearchLoadedState(searchResponse: response);
    } else if (event is ResetState) {
      yield SearchInitial();
    }
  }

  @override
  SearchState get initialState => SearchInitial();
}
