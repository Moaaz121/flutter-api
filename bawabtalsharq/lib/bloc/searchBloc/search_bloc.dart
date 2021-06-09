import 'dart:async';

import 'package:bawabtalsharq/Model/search_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
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
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        yield SearchLoadingState();
        var response = await SearchRepo().getSearch(event.searchQueryModel);

        yield SearchLoadedState(searchResponse: response);
      } else {
        yield SearchNoInternetState();
      }
    } else if (event is ResetState) {
      yield SearchInitial();
    }
  }

  @override
  SearchState get initialState => SearchInitial();
}
