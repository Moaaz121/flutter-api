import 'dart:async';

import 'package:bawabtalsharq/bloc/authBlocs/forgetPasswordBloc/forget_password_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/forgetPasswordBloc/forget_password_state.dart';
import 'package:bawabtalsharq/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  @override
  Stream<ForgetPasswordState> mapEventToState(
    ForgetPasswordEvent event,
  ) async* {
    if (event is DoForgetPasswordEvent) {
      yield ForgetPasswordLoadingState();
      var response = await AuthRepo().forgetPassword(event.email);

      yield ForgetPasswordLoadedState(baseModel: response);
    } else if (event is ResetState) {
      yield ForgetPasswordInitial();
    }
  }

  @override
  ForgetPasswordState get initialState => ForgetPasswordInitial();
}
