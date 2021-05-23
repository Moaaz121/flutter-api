import 'package:bawabtalsharq/bloc/countryBloc/country_event.dart';
import 'package:bawabtalsharq/repo/country_repo.dart';
import 'package:bloc/bloc.dart';

import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is GetCountryData) {
      yield CountryLoadedState();
      var response = await CountryRepo().getCountry();
      yield CountryLoadedState(countryResponse: response);
    } else if (event is ResetState) {
      yield CountryInitial();
    }
  }

  @override
  // TODO: implement initialState
  CountryState get initialState => CountryInitial();
}
