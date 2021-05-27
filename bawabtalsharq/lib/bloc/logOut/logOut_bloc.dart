import 'package:bawabtalsharq/bloc/logOut/logOut_event.dart';
import 'package:bawabtalsharq/bloc/logOut/logOut_state.dart';
import 'package:bawabtalsharq/repo/log_out_repo.dart';
import 'package:bloc/bloc.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  @override
  LogOutState get initialState => LogOutInitial();

  @override
  Stream<LogOutState> mapEventToState(
    LogOutEvent event,
  ) async* {
    if (event is GetLogOutData) {
      yield LogOutLoadingState();
      print('loaded');
      var response = await LogOutRepo().logOutApi(event.userId, event.apiKey);

      yield LogOutLoadedState(logOutResponse: response);
    } else if (event is ResetState) {
      yield LogOutInitial();
    }
  }
}
