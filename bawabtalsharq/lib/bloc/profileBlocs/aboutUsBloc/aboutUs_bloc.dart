import 'package:bawabtalsharq/Model/aboutUs_model.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/aboutUsBloc/aboutUs_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/aboutUsBloc/aboutUs_state.dart';
import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  @override
  // TODO: implement initialState
  AboutUsState get initialState => AboutUsInitial();

  @override
  Stream<AboutUsState> mapEventToState(AboutUsEvent event) async* {
    if (event is GetAboutUsEvent) {
      yield AboutUsLoadingState();
      try {
        List<AboutData> data = await ProfileRepo.getAbout();
        yield AboutUsLoadedState(aboutUsResponse: data);
      } catch (e) {
        yield AboutUsErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield AboutUsInitial();
    }
  }
}
