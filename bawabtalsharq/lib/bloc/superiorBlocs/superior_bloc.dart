import 'package:bawabtalsharq/Model/superior_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:bawabtalsharq/bloc/superiorBlocs/superior_event.dart';
import 'package:bawabtalsharq/bloc/superiorBlocs/superior_state.dart';
import 'package:bawabtalsharq/repo/superior_repo.dart';
import 'package:bloc/bloc.dart';

class SuperiorBloc extends Bloc<SuperiorEvent, SuperiorState> {
  @override
  Stream<SuperiorState> mapEventToState(SuperiorEvent event) async* {
    bool isConnected = await InternetConnection.isConnected2();
    if (isConnected) {
      if (event is DoSuperiorEvent) {
        yield SuperiorLoadingState();
        try {
          List<SuperiorData> data = await SuperiorRepo.getSuperior();
          yield SuperiorLoadedState(superiorResponse: data);
        } catch (e) {
          yield SuperiorErrorState(message: e.toString());
        }
      } else if (event is ResetState) {
        yield SuperiorInitial();
      }
    } else
      yield SuperiorNetworkErrorState();
  }

  @override
  // TODO: implement initialState
  SuperiorState get initialState => SuperiorInitial();
}
