part of 'quotation_bloc.dart';

@immutable
abstract class QuotationEvent {}

class PostReqQuotation extends QuotationEvent {
  Map<String, dynamic> data;
  Map<String, dynamic> dataIdentifier;

  PostReqQuotation({@required this.data, @required this.dataIdentifier});
}

class GetCatergoryList extends QuotationEvent {}

class ShowLoadedData extends QuotationEvent {}
