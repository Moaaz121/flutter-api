part of 'quotation_bloc.dart';

@immutable
abstract class QuotationEvent {}

class PostReqQuotation extends QuotationEvent {
  Map<String, dynamic> data;
  PostReqQuotation({@required this.data});
}

class GetCatergoryList extends QuotationEvent {}

class ShowLoadedData extends QuotationEvent {}
