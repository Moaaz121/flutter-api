import 'dart:async';

import 'package:bawabtalsharq/repo/requestQutaion_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quotation_event.dart';
part 'quotation_state.dart';

class QuotationBloc extends Bloc<QuotationEvent, QuotationState> {
  @override
  Stream<QuotationState> mapEventToState(
    QuotationEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetReqQuotation) {
      yield PostingReqQuotationState();
      print('in Bloc');
      String msg = await RequestQuotationsRepo().postReqQuotation(event.data);

      if (msg != null) {
        yield PostedQuotationResponseState(msg: msg);
      }
    }
  }

  @override
  // TODO: implement initialState
  QuotationState get initialState => QuotationInitialState();

  // QuotationBloc() : super(QuotationInitialState());
}
