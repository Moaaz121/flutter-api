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
      yield RegisterLoadedState(userResponse: response);
    } else if (event is VerifyPhone) {
      yield EnterSMSCodeState(verId: await AuthRepo().verifyPhone(event.phone));
    } else if (event is SignWithOTP) {
      // AuthRepo().signInWithOTP(event.smsCode, event.verId);
      yield ResumeRegisterState();
    } else if (event is ResetState) {
      yield RegisterInitial();
    }
  }

  @override
  // TODO: implement initialState
  RegisterState get initialState => RegisterInitial();
}
