import 'dart:async';

import 'package:bawabtalsharq/Model/filter_model.dart';
import 'package:bawabtalsharq/repo/filter_rebo.dart';
import 'package:bloc/bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is DoFilterEvent) {
      yield FilterLoadingState();
      try {
        FilterModel data = await FilterRepo().getFilter();
        yield FilterLoadedState(filterResponse: data);
      } catch (e) {
        yield FilterErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield FilterInitial();
    }
  }

  @override
  // TODO: implement initialState
  FilterState get initialState => FilterInitial();
}
