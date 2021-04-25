import 'package:bawabtalsharq/Model/mainCategoryModel.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  List<CategoryModel> cateResponse;
  CategoryLoadedState({this.cateResponse});
}

class CategoryErrorState extends CategoryState {
  String message;
  CategoryErrorState({this.message});
}

class CategoryPressState extends CategoryState {
  int index;
  CategoryPressState(this.index);
}

class SubCategoryDismissState extends CategoryState {
  int index;
  SubCategoryDismissState(this.index);
}
