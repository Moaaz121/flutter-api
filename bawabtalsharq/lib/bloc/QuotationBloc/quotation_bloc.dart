import 'dart:async';

import 'package:bawabtalsharq/repo/requestQutaion_repo.dart';
import 'package:bawabtalsharq/repo/fillQuotation.dart';
import 'package:bawabtalsharq/repo/category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bawabtalsharq/Model/fillQuotationModel.dart';
import 'package:bawabtalsharq/Model/base_model.dart';

part 'quotation_event.dart';
part 'quotation_state.dart';

class QuotationBloc extends Bloc<QuotationEvent, QuotationState> {
  List<CategoryRQF> categories = [];
  List<CertificationRQF> certification = [];
  List<DestinationRQF> destination = [];
  List<ShippingRQF> shipping = [];
  List<SourcingPurposeRQF> sourcingPurpose = [];
  List<TradeTermRQF> tradeTerms = [];
  @override
  Stream<QuotationState> mapEventToState(
    QuotationEvent event,
  ) async* {
    if (event is GetCatergoryList) {
      yield LoadingCategoryListState();
      DataRQF data = await FillQuotationRepo().fillQuotation();

      List.generate(data.categories.length, (i) {
        categories.add(data.categories[i]);
      });
      List.generate(data.certifications.length, (i) {
        certification.add(data.certifications[i]);
      });
      List.generate(data.destination.length, (i) {
        destination.add(data.destination[i]);
      });
      List.generate(data.shipping.length, (i) {
        shipping.add(data.shipping[i]);
      });
      List.generate(data.sourcingPurpose.length, (i) {
        sourcingPurpose.add(data.sourcingPurpose[i]);
      });
      List.generate(data.tradeTerms.length, (i) {
        tradeTerms.add(data.tradeTerms[i]);
      });

      yield LoadedCategoryListState(
          categories: categories,
          certification: certification,
          destination: destination,
          shipping: shipping,
          sourcingPurpose: sourcingPurpose,
          tradeTerms: tradeTerms);
    } else if (event is GetReqQuotation) {
      BaseModel data =
          await RequestQuotationsRepo().postReqQuotation(event.data);

      if (data != null) {
        yield PostedQuotationResponseState(msg: data.msg);
      } else {
        ReqQuotationErrorState(msg: 'Connection Error');
      }
    }
  }

  @override
  // TODO: implement initialState
  QuotationState get initialState => QuotationInitialState();

  // QuotationBloc() : super(QuotationInitialState());
}
