part of 'quotation_bloc.dart';

@immutable
abstract class QuotationEvent {}

class PostReqQuotation extends QuotationEvent {
  Map<String, String> data;
  PostReqQuotation({@required this.data});
}

class GetCatergoryList extends QuotationEvent {}

class ShowLoadedData extends QuotationEvent {}
