import 'package:bawabtalsharq/Model/mainCategoryModel.dart';
import 'package:bawabtalsharq/bloc/categoryBloc/category_event.dart';
import 'package:bawabtalsharq/bloc/categoryBloc/category_state.dart';
import 'package:bawabtalsharq/repo/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is DoCategoryEvent) {
      yield CategoryLoadingState();
      try {
        List<CategoryModel> data = await CategoryRepo.getCategory();
        yield CategoryLoadedState(cateResponse: data);
      } catch (e) {
        yield CategoryErrorState(message: e.toString());
      }
    } else if (event is ResetState) {
      yield CategoryInitial();
    } else if (event is CategoryPressEvent) {
      yield CategoryPressState(event.index);
    } else if (event is SubCategoryDismissEvent) {
      yield SubCategoryDismissState(event.index);
    }
  }

  @override
  // TODO: implement initialState
  CategoryState get initialState => CategoryInitial();
}
