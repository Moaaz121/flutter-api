import 'package:bawabtalsharq/Model/plan_model.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_bloc.dart';

import 'package:bawabtalsharq/bloc/planByIdBloc/plan_by_id_state.dart';
import 'package:bawabtalsharq/bloc/planByIdBloc/plan_by_id_event.dart';

import 'package:bawabtalsharq/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanByIdBloc extends Bloc<PlanByIdEvent, PlanByIdState> {
  @override
  // TODO: implement initialState
  PlanByIdState get initialState => PlanByIdInitial();

  @override
  Stream<PlanByIdState> mapEventToState(PlanByIdEvent event) async* {
    if (event is GetPlanByIdEvent) {
      yield PlanByIdLoadingState();
      try {
        PlanModel data = await ProfileRepo.getPlanById(event.planId);
        yield PlanByIdLoadedState(planResponse: data);
      } catch (e) {
        yield PlanByIdErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield PlanByIdInitial();
    }
  }
}
