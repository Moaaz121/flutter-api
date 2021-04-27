import 'dart:async';
import 'package:bawabtalsharq/bloc/authBlocs/loginBloc/login_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/loginBloc/login_state.dart';
import 'package:bawabtalsharq/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLoginEvent) {
      yield LoginLoadingState();
      var response = await AuthRepo().doLogin(event.userName, event.password);

      yield LoginLoadedState(userResponse: response);
    } else if (event is ResetState) {
      yield LoginInitial();
    }
  }

  @override
  LoginState get initialState => LoginInitial();
}