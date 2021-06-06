part of 'quotation_bloc.dart';

@immutable
abstract class QuotationState {}

class QuotationInitialState extends QuotationState {}

class PostingReqQuotationState extends QuotationState {}

class PostedQuotationResponseState extends QuotationState {
  String msg;

  PostedQuotationResponseState({this.msg});
}

class NoInternetState extends QuotationState {}

class ReqQuotationErrorState extends QuotationState {
  String msg;

  ReqQuotationErrorState({this.msg});
}

class LoadingListsState extends QuotationState {}

class ShowLoadedDataState extends QuotationState {}

class LoadedDataState extends QuotationState {
  DataRQF dataLists;
  LoadedDataState({@required this.dataLists});
}

class LoadedListsState extends QuotationState {
  // List<CategoryRQF> categories;
  List<CertificationRQF> certification;
  List<DestinationRQF> destination;
  List<ShippingRQF> shipping;
  List<PieceRQF> pieces;

  List<SourcingPurposeRQF> sourcingPurpose;
  List<TradeTermRQF> tradeTerms;

  LoadedListsState(
      {
      // @required this.categories,
      @required this.certification,
      @required this.destination,
      @required this.shipping,
      @required this.pieces,
      @required this.sourcingPurpose,
      @required this.tradeTerms});
}
