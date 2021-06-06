import 'dart:async';

import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:bawabtalsharq/repo/auth_repo.dart';
import 'package:bawabtalsharq/repo/getCountrie_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/verifyPhone/verifyphone_state.dart';
import 'package:bawabtalsharq/bloc/authBlocs/verifyPhone/verifyphone_event.dart';

class VerifyphoneBloc extends Bloc<VerifyphoneEvent, VerifyphoneState> {
  @override
  Stream<VerifyphoneState> mapEventToState(
    VerifyphoneEvent event,
  ) async* {
    if (event is GetCountries) {
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        yield LoadingCountriesState();
        List<CountryData> countries = await CountriesRepo().getCountries();
        yield LoadedCountriesState(countries: countries);
      } else
        yield VerifyphoneNetworkErrorState();
    } 
    // else if (event is GetLoadedCountries) {
    //   yield ShowLoadedCountriesState();
    // }
     else if (event is VerifyPhone) {
      yield VerifyingPhoneLoadingState();
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        var verId = await AuthRepo().verifyPhone(event.data['phone']);

        if (verId['e'] != null) {
          yield FirebaseExceptionState(msg: verId['e']);
        } else {
          yield EnterSMSCodeState(verId: verId['verId'], data: event.data);
        }
      } else {
        yield VerifyingPhoneLoadingState();
      }
    }
  }

  @override
  // TODO: implement initialState
  VerifyphoneState get initialState => VerifyphoneInitial();
}
