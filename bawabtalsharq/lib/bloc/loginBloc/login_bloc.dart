import 'dart:async';
import 'package:bawabtalsharq/bloc/loginBloc/login_event.dart';
import 'package:bawabtalsharq/bloc/loginBloc/login_state.dart';
import 'package:bawabtalsharq/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLoginEvent) {
      yield LoginLoadingState();
      var response = await LoginRepo().doLogin(event.userName, event.password);

      yield LoginLoadedState(userResponse: response);
    } else if (event is ResetState) {
      yield LoginInitial();
    }
  }

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();
}
