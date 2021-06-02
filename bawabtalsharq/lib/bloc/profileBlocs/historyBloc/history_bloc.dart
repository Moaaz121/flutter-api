import 'dart:async';

import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/historyBloc/history_state.dart';
import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  InternetConnection internetConnection = InternetConnection();

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    bool connected = await internetConnection.isConnected();
    print('Connection' + '  ' + connected.toString());
    if (event is GetHistoryEvent) {
      yield HistoryLoadingState();
      try {
        if (connected) {
          var response =
              await ProfileRepo().getHistory(event.userId, event.apiKey);
          yield HistoryLoadedState(response: response);
        } else {
          yield HistoryNoInternetState();
        }
      } catch (e) {
        yield HistoryErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield HistoryInitial();
    }
  }

  @override
  HistoryState get initialState => HistoryInitial();
}
