import 'dart:async';

import 'package:bawabtalsharq/bloc/langBloc/lang_event.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_state.dart';
import 'package:bawabtalsharq/repo/lang_ropo.dart';
import 'package:bloc/bloc.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  @override
  Stream<LangState> mapEventToState(
    LangEvent event,
  ) async* {
    if (event is GetLangData) {
      yield LangLoadedState();
      print('dddew');
      var response = await LangRepo().getLang();
      print('ddddd');
      yield LangLoadedState(langResponse: response);
    } else if (event is ResetState) {
      yield LangInitial();
    }
  }

  @override
  // TODO: implement initialState
  LangState get initialState => LangInitial();
}
