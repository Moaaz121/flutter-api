import 'dart:async';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is DoRegisterEvent) {
      yield RegisterLoadingState();
      var response = await AuthRepo().doRegister(
          event.phone, event.email, event.password, event.name, event.userType);
      var phoneAuth = await AuthRepo().verifyPhone(event.phone);
      yield RegisterLoadedState(userResponse: response);
    } else if (event is ResetState) {
      yield RegisterInitial();
    }
  }

  @override
  // TODO: implement initialState
  RegisterState get initialState => RegisterInitial();
}
