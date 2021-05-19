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
      print(event.email);
      print(event.name);
      print(event.password);
      print(event.phone);
      print(event.userType);
      var response = await AuthRepo().doRegister(
          event.phone, event.email, event.password, event.name, event.userType);
      yield RegisterLoadedState(userResponse: response);
    } else if (event is VerifyPhone) {
      yield VerifyingPhoneLoadingState();

      var verId = await AuthRepo().verifyPhone(event.data['phone']);

      if (verId['e'] != null) {
        yield FirebaseExceptionState(msg: verId['e']);
        print(verId['e']);
      } else {
        print('Ver Id is Sent : ${verId['verId']}');
        yield EnterSMSCodeState(verId: verId['verId'], data: event.data);
      }
    } else if (event is SignWithOTP) {
      String signInState = AuthRepo().signInWithOTP(event.smsCode, event.verId);
      if (signInState == 'Verified Succefully') {
        yield ResumeRegisterState();
      } else {
        yield FirebaseExceptionState(msg: signInState);
      }
    } else if (event is ResetState) {
      yield RegisterInitial();
    }
  }

  @override
  // TODO: implement initialState
  RegisterState get initialState => RegisterInitial();
}
