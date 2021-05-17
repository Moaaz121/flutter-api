abstract class SearchEvent {}

class DoSearchEvent extends SearchEvent {
  String q;
  String page;
  List<String> categories;

  DoSearchEvent(this.q, {this.page, this.categories});
}

class ResetState extends SearchEvent {}
