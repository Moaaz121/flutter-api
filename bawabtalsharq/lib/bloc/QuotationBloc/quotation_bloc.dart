import 'dart:async';

import 'package:bawabtalsharq/repo/requestQutaion_repo.dart';
import 'package:bawabtalsharq/repo/category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bawabtalsharq/Model/mainCategoryModel.dart';
import 'package:bawabtalsharq/Model/base_model.dart';

part 'quotation_event.dart';
part 'quotation_state.dart';

class QuotationBloc extends Bloc<QuotationEvent, QuotationState> {
  List<String> categoryNameList = [];
  List<String> categoryIdList = [];
  @override
  Stream<QuotationState> mapEventToState(
    QuotationEvent event,
  ) async* {
    if (event is GetCatergoryList) {
      yield LoadingCategoryListState();
      List<CategoryModel> categoryList = await CategoryRepo.getCategory();
      List.generate(categoryList.length, (i) {
        categoryNameList.add(categoryList[i].category);
        categoryIdList.add(categoryList[i].categoryId);
      });
      yield LoadedCategoryListState(
          categoryNameList: categoryNameList, categoryIdList: categoryIdList);
    } else if (event is GetReqQuotation) {
      BaseModel data =
          await RequestQuotationsRepo().postReqQuotation(event.data);

      if (data != null) {
        yield PostedQuotationResponseState(msg: data.msg);
      }
    }
  }

  @override
  // TODO: implement initialState
  QuotationState get initialState => QuotationInitialState();

  // QuotationBloc() : super(QuotationInitialState());
}
