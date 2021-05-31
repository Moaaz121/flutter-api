import 'package:bawabtalsharq/Model/supplier_model.dart';
import 'package:bawabtalsharq/bloc/supplierProfileBloc/supplierProfile_event.dart';
import 'package:bawabtalsharq/bloc/supplierProfileBloc/supplierProfile_state.dart';
import 'package:bawabtalsharq/repo/supplierProfile_repo.dart';
import 'package:bloc/bloc.dart';

class SupplierProfileBloc
    extends Bloc<SupplierProfileEvent, SupplierProfileState> {
  @override
  Stream<SupplierProfileState> mapEventToState(
      SupplierProfileEvent event) async* {
    if (event is DoSupplierProfileEvent) {
      yield SupplierProfileLoadingState();
      try {
        SupplierProfileModel data =
            await SupplierProfileRepo.getSupplierProfile(event.id);
        yield SupplierProfileLoadedState(supplierProfileResponse: data);
      } catch (e) {
        yield SupplierProfileErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield SupplierProfileInitial();
    }
  }

  @override
  // TODO: implement initialState
  SupplierProfileState get initialState => SupplierProfileInitial();
}
