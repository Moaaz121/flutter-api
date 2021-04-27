import 'dart:async';

import 'package:bawabtalsharq/bloc/homeBloc/home_event.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_state.dart';
import 'package:bawabtalsharq/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetHomeData) {
      yield HomeLoadingState();
      var response = await HomeRepo().getHome();

      yield HomeLoadedState(homeResponse: response);
    } else if (event is ResetState) {
      yield HomeInitial();
    }
  }

  @override
  // TODO: implement initialState
  HomeState get initialState => HomeInitial();
}
