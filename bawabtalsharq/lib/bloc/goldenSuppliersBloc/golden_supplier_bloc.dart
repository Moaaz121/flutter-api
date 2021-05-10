import 'package:bawabtalsharq/Model/golden_suppliers_model.dart';
import 'package:bawabtalsharq/repo/golden_supplier_repo.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_event.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldenBloc extends Bloc<GoldenEvent, GoldenState> {
  @override
  // TODO: implement initialState
  GoldenState get initialState => GoldenInitial();

  @override
  Stream<GoldenState> mapEventToState(GoldenEvent event) async* {
    if (event is GetGoldenSuppliersEvent) {
      yield GoldenLoadingState();
      try {
        List<Suppliers> suppliers = await GoldenRepo.getGoldenSuppliers();
        yield GoldenLoadedState(suppliers: suppliers);
      } catch (e) {
        yield GoldenErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield GoldenInitial();
    }
  }
}
