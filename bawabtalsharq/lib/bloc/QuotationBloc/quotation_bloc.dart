import 'dart:async';

import 'package:bawabtalsharq/repo/requestQutaion_repo.dart';
import 'package:bawabtalsharq/repo/fillQuotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bawabtalsharq/Model/fillQuotationModel.dart';

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
      DataRQF data = await FillQuotationRepo().fillQuotation();

      // List.generate(data.categories.length, (i) {
      //   categories.add(data.categories[i]);
      // });
      List.generate(data.certifications.length, (i) {
        certification.add(data.certifications[i]);
      });
      List.generate(data.destination.length, (i) {
        destination.add(data.destination[i]);
      });
      List.generate(data.shipping.length, (i) {
        shipping.add(data.shipping[i]);
      });
      List.generate(data.pieces.length, (i) {
        pieces.add(data.pieces[i]);
      });
      List.generate(data.sourcingPurpose.length, (i) {
        sourcingPurpose.add(data.sourcingPurpose[i]);
      });
      List.generate(data.tradeTerms.length, (i) {
        tradeTerms.add(data.tradeTerms[i]);
      });
      yield LoadedListsState(
          // categories: categories,
          certification: certification,
          destination: destination,
          shipping: shipping,
          pieces: pieces,
          sourcingPurpose: sourcingPurpose,
          tradeTerms: tradeTerms);
      yield LoadedDataState(dataLists: data);
    }
    //  else if (event is ShowLoadedData) {
    //   yield ShowLoadedDataState();
    // }
    else if (event is PostReqQuotation) {
      String msg = await RequestQuotationsRepo()
          .postReqQuotation(event.data, event.dataIdentifier);
      if (msg != 'Mobile is not Connected' && msg != null) {
        yield PostedQuotationResponseState(msg: msg);
      } else if (msg == 'Mobile is not Connected') {
        yield NoInternetState();
      } else if (msg == null) {
        ReqQuotationErrorState(msg: 'Connection Error');
      }
    }
  }

  @override
  // TODO: implement initialState
  QuotationState get initialState => QuotationInitialState();
}
