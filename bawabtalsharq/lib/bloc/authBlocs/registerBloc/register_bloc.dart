import 'dart:async';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/repo/auth_repo.dart';
import 'package:bawabtalsharq/repo/getCountrie_repo.dart';
import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is DoRegisterEvent) {
      yield RegisterLoadingState();

      var response = await AuthRepo().doRegister(
          event.phone,
          event.email,
          event.password,
          event.firstname,
          event.lastname,
          event.userType,
          event.country,
          event.company);
      yield RegisterLoadedState(userResponse: response);
    } else if (event is VerifyPhone) {
      yield VerifyingPhoneLoadingState();

      var verId = await AuthRepo().verifyPhone(event.data['phone']);

      if (verId['e'] != null) {
        yield FirebaseExceptionState(msg: verId['e']);
      } else {
        yield EnterSMSCodeState(verId: verId['verId'], data: event.data);
      }
    } else if (event is SignWithOTP) {
      String signInState =
          await AuthRepo().signInWithOTP(event.smsCode, event.verId);
      print('State: $signInState');
      if (signInState == 'Verified Succefully') {
        yield ResumeRegisterState();
      } else if (signInState == 'User already registered') {
        yield PhoneAlreadyRegisteredState(msg: signInState);
      } else {
        yield FirebaseExceptionState(msg: signInState);
      }
    } else if (event is GetCountries) {
      yield LoadingCountriesState();
      List<CountryData> countries = await CountriesRepo().getCountries();
      yield LoadedCountriesState(countries: countries);
    } else if (event is GetLoadedCountries) {
      yield ShowLoadedCountriesState();
    } else if (event is ResetState) {
      yield RegisterInitial();
    } else if (event is ReRegister) {
      yield ReReisgterWithNewNumber();
    }
  }

  @override
  // TODO: implement initialState
  RegisterState get initialState => RegisterInitial();
}
