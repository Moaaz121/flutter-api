import 'package:bawabtalsharq/Model/individualProduct_model.dart';
import 'package:bawabtalsharq/repo/individualProduct_repo.dart';
import 'package:bloc/bloc.dart';

import 'individualProduct_event.dart';
import 'individualProduct_state.dart';

class IndividualProductBloc
    extends Bloc<IndividualProductEvent, IndividualProductState> {
  @override
  Stream<IndividualProductState> mapEventToState(
      IndividualProductEvent event) async* {
    if (event is DoIndividualProductEvent) {
      yield IndividualProductLoadingState();
      try {
        ProductDetails data =
            await IndividualProductRepo.getIndividualProduct();
        yield IndividualProductLoadedState(individualProductResponse: data);
      } catch (e) {
        yield IndividualProductErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield IndividualProductInitial();
    }
  }

  @override
  // TODO: implement initialState
  IndividualProductState get initialState => IndividualProductInitial();
}
