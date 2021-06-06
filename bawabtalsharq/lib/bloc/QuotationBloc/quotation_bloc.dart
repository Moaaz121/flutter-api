import 'dart:async';

import 'package:bawabtalsharq/repo/requestQutaion_repo.dart';
import 'package:bawabtalsharq/repo/fillQuotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bawabtalsharq/Model/fillQuotationModel.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';

part 'quotation_event.dart';
part 'quotation_state.dart';

class QuotationBloc extends Bloc<QuotationEvent, QuotationState> {
  List<CategoryRQF> categories = [];
  List<CertificationRQF> certification = [];
  List<DestinationRQF> destination = [];
  List<ShippingRQF> shipping = [];
  List<PieceRQF> pieces = [];
  List<SourcingPurposeRQF> sourcingPurpose = [];
  List<TradeTermRQF> tradeTerms = [];
  @override
  Stream<QuotationState> mapEventToState(
    QuotationEvent event,
  ) async* {
    if (event is GetCatergoryList) {
      yield LoadingListsState();

      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        DataRQF data = await FillQuotationRepo().fillQuotation();
        yield LoadedDataState(dataLists: data);
      } else {
        yield QuotationNetworkErrorState();
      }
    } else if (event is PostReqQuotation) {
      bool isConnected = await InternetConnection.isConnected2();
      if (isConnected) {
        ///////////////
        String msg = await RequestQuotationsRepo()
            .postReqQuotation(event.data, event.dataIdentifier);
        yield PostedQuotationResponseState(msg: msg);

        ///////////////

      } else {
        yield QuotationNetworkErrorState();
      }
    }
  }

  @override
  // TODO: implement initialState
  QuotationState get initialState => QuotationInitialState();
}
