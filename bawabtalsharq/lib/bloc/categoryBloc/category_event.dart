abstract class CategoryEvent {}

class DoCategoryEvent extends CategoryEvent {}

class ResetState extends CategoryEvent {}

class CategoryPressEvent extends CategoryEvent {
  int index;
  CategoryPressEvent(this.index);
}

class SubCategoryDismissEvent extends CategoryEvent {
  int index;
  SubCategoryDismissEvent(this.index);
}
