import 'package:bawabtalsharq/Model/faq_model.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/faqBloc/faq_event.dart';
import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  @override
  // TODO: implement initialState
  FaqState get initialState => FaqInitial();

  @override
  Stream<FaqState> mapEventToState(FaqEvent event) async* {
    if (event is GetFaqEvent) {
      yield FaqLoadingState();
      try {
        List<FaqData> data = await ProfileRepo.getFaq();
        yield FaqLoadedState(faqResponse: data);
      } catch (e) {
        yield FaqErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield FaqInitial();
    }
  }
}
