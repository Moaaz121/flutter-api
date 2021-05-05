abstract class SearchEvent {}

class DoSearchEvent extends SearchEvent {
  String q;
  String page;
  List<int> categories;

  DoSearchEvent(this.q, {this.page, this.categories});
}

class ResetState extends SearchEvent {}
