import 'package:bawabtalsharq/Model/faq_model.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoadingState extends FaqState {}

class FaqLoadedState extends FaqState {
  List<FaqData> faqResponse;
  FaqLoadedState({this.faqResponse});
}

class FaqErrorState extends FaqState {
  String message;
  FaqErrorState({this.message});
}
