part of 'quotation_bloc.dart';

@immutable
abstract class QuotationState {}

class QuotationInitialState extends QuotationState {}

class PostingReqQuotationState extends QuotationState {}

class PostedQuotationResponseState extends QuotationState {
  String msg;

  PostedQuotationResponseState({this.msg});
}

class LoadingCategoryListState extends QuotationState {}

class LoadedCategoryListState extends QuotationState {
  List<String> categoryNameList;
  List<String> categoryIdList;

  LoadedCategoryListState({this.categoryNameList, this.categoryIdList});
}
