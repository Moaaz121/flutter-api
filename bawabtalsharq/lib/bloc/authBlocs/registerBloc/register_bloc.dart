import 'dart:async';

import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/repo/auth_repo.dart';
import 'package:bawabtalsharq/repo/getCountrie_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is DoRegisterEvent) {
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        yield RegisterLoadingState();
        var response = await AuthRepo().doRegister(
            event.phone,
            event.email,
            event.firstname,
            event.lastname,
            event.password,
            event.userType,
            event.country,
            event.company);
        yield RegisterLoadedState(userResponse: response);
      } else
        yield RegisterNetworkErrorState();
    } else if (event is SignWithOTP) {
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
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
      } else {
        yield RegisterNetworkErrorState();
      }
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
