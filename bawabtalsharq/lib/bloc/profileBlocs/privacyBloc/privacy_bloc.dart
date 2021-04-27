import 'package:bawabtalsharq/Model/privacy_model.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/privacyBloc/privacy_state.dart';
import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  @override
  Stream<PrivacyState> mapEventToState(PrivacyEvent event) async* {
    if (event is GetPrivacyEvent) {
      yield PrivacyLoadingState();
      try {
        List<PrivacyData> data = await ProfileRepo.getPrivacy();
        //print(data);
        yield PrivacyLoadedState(privacyResponse: data);
      } catch (e) {
        yield PrivacyErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield PrivacyInitial();
    }
  }

  @override
  // TODO: implement initialState
  PrivacyState get initialState => PrivacyInitial();
}
