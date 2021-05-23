import 'package:bawabtalsharq/Model/plan_model.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_bloc.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_event.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_state.dart';

import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  @override
  // TODO: implement initialState
  PlanState get initialState => PlanInitial();

  @override
  Stream<PlanState> mapEventToState(PlanEvent event) async* {
    if (event is GetPlanEvent) {
      yield PlanLoadingState();
      try {
        PlanModel data = await ProfileRepo.getPlans();
        yield PlanLoadedState(planResponse: data);
      } catch (e) {
        yield PlanErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield PlanInitial();
    }
  }
}
