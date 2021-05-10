part of 'quotation_bloc.dart';

@immutable
abstract class QuotationEvent {}

class GetReqQuotation extends QuotationEvent {
  Map<String, dynamic> data;
  GetReqQuotation({@required this.data});
}
