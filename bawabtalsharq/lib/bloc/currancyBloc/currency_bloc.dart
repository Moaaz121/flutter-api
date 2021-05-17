import 'package:bawabtalsharq/repo/currency_repo.dart';
import 'package:bloc/bloc.dart';

import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  @override
  Stream<CurrencyState> mapEventToState(
    CurrencyEvent event,
  ) async* {
    if (event is GetCurrencyData) {
      yield CurrencyLoadedState();
      var response = await CurrencyRepo().getCurrency();
      yield CurrencyLoadedState(currencyResponse: response);
    } else if (event is ResetState) {
      yield CurrencyInitial();
    }
  }

  @override
  // TODO: implement initialState
  CurrencyState get initialState => CurrencyInitial();
}
