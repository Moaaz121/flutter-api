import 'dart:async';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_state.dart';
import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is GetHistoryEvent) {
      yield HistoryLoadingState();
      var response = await ProfileRepo().getHistory(event.userId, event.apiKey);

      yield HistoryLoadedState(response: response);
    } else if (event is ResetState) {
      yield HistoryInitial();
    }
  }

  @override
  HistoryState get initialState => HistoryInitial();
}
