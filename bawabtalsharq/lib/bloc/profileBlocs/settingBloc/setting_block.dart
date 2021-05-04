import 'package:bawabtalsharq/Model/contactUs_model.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/settingBloc/setting_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/settingBloc/setting_state.dart';
import 'package:bawabtalsharq/repo/setting_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  @override
  Stream<SettingState> mapEventToState(SettingEvent event) async* {
    if (event is GetSettingEvent) {
      yield SettingLoadingState();
      try {
        Contact data = await SettingRepo.getLocation();
        //print(data);
        yield SettingLoadedState(SettingResponse: data);
      } catch (e) {
        yield SettingErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield SettingInitial();
    }
  }

  @override
  // TODO: implement initialState
  SettingState get initialState => SettingInitial();
}
