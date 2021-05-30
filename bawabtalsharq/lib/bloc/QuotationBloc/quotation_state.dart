part of 'quotation_bloc.dart';

@immutable
abstract class QuotationState {}

class QuotationInitialState extends QuotationState {}

class PostingReqQuotationState extends QuotationState {}

class PostedQuotationResponseState extends QuotationState {
  String msg;

  PostedQuotationResponseState({this.msg});
}

class ReqQuotationErrorState extends QuotationState {
  String msg;

  ReqQuotationErrorState({this.msg});
}

class LoadingCategoryListState extends QuotationState {}

class LoadedCategoryListState extends QuotationState {
  List<CategoryRQF> categories;
  List<CertificationRQF> certification;
  List<DestinationRQF> destination;
  List<ShippingRQF> shipping;
  List<SourcingPurposeRQF> sourcingPurpose;
  List<TradeTermRQF> tradeTerms;

  LoadedCategoryListState(
      {@required this.categories,
      @required this.certification,
      @required this.destination,
      @required this.shipping,
      @required this.sourcingPurpose,
      @required this.tradeTerms});
}
