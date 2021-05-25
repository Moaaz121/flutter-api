import 'package:bawabtalsharq/Model/mainCategoryModel.dart';
import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Screens/search/search_result_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/categoryBloc/category_bloc.dart';
import 'package:bawabtalsharq/bloc/categoryBloc/category_event.dart';
import 'package:bawabtalsharq/bloc/categoryBloc/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories>
    with TickerProviderStateMixin {
  CategoryBloc _categoryBloc;
  bool isLoading = false;
  AnimationController _sliderController;
  Animation<Offset> _sliderAnimation;
  ScrollController _mainScrollController = ScrollController();
  ScrollController _subScrollController = ScrollController();
  List<CategoryModel> listOfCategory;

  List<Positioned> _stackWidgets = List<Positioned>();
  bool _isPressed = false;
  String _appBarTitle;

  @override
  void initState() {
    _categoryBloc = CategoryBloc();
    _categoryBloc.add(DoCategoryEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _mainScrollController.dispose();
    _subScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isPressed) {
      _appBarTitle = Languages.of(context).allCategories;
    }
    return BlocBuilder<CategoryBloc, CategoryState>(
        bloc: _categoryBloc,
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            showLoadingDialog(context);
          } else if (state is CategoryLoadedState) {
            listOfCategory = state.cateResponse;
            _stackWidgets.add(getMainCategoriesList(context));
            Navigator.pop(context);
          } else if (state is CategoryErrorState) {
            print('handle Error UI'); //TODO error
          } else if (state is CategoryPressState) {
            listOfCategory.forEach((element) {
              element.isSelected = false;
            });
            _stackWidgets = [
              getMainCategoriesList(context),
              getSubCategoriesList(
                  context,
                  state.index,
                  listOfCategory[state.index].subCatregory,
                  Color(int.parse(listOfCategory[state.index].color))
                      .withOpacity(0.15)) //TODO put subcategory arr
            ];
            _isPressed = true;
            _appBarTitle = listOfCategory[state.index].category;
            listOfCategory[state.index].isSelected = true;
          } else if (state is SubCategoryDismissState) {
            _appBarTitle = Languages.of(context).allCategories;
            _isPressed = false;
            listOfCategory[state.index].isSelected = false;
            _stackWidgets = [getMainCategoriesList(context)];
          }
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: appBarBuilderWithWidget(
                actions: [Container()],
                titleWidget: buildText(_appBarTitle, 18.0,
                    fontFamily: boldFontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: buildFloatingActionBtn(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  if (_isPressed) {
                    _subScrollController.animateTo(0.0,
                        duration: Duration(seconds: 1), curve: Curves.easeOut);
                  } else {
                    _mainScrollController.animateTo(0.0,
                        duration: Duration(seconds: 1), curve: Curves.easeOut);
                  }
                },
              ),
              body: Stack(children: _stackWidgets));
        });
  }

  Positioned getMainCategoriesList(BuildContext context) {
    return Positioned(
      child: Container(
          margin: EdgeInsetsDirectional.only(top: 25),
          child: ListView.builder(
            controller: _mainScrollController,
            itemCount: listOfCategory.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _categoryBloc.add(CategoryPressEvent(index));
                },
                child: Container(
                  margin:
                      EdgeInsetsDirectional.only(bottom: 15, start: 8, end: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: listOfCategory[index].isSelected
                            ? EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3)
                            : EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: listOfCategory[index].isSelected
                              ? Border.all(
                                  color: defaultOrangeColor.withOpacity(0.8),
                                  width: 3)
                              : Border.all(color: Colors.transparent),
                          color: Colors.white,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(int.parse(listOfCategory[index].color))
                                .withOpacity(0.15),
                          ),
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Image.network(
                            listOfCategory[index]
                                .image, //listOfCategory[index].icon network image
                            height: 45,
                            width: 45,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: buildText(listOfCategory[index].category, 15.0,
                            color: textColor,
                            fontFamily: semiBoldFontFamily,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }

  Positioned getSubCategoriesList(BuildContext context, int categoryIndex,
      List<SubCatregory> subCategoryArr, Color color) {
    //sub catetgory model
    setupAnimation();
    return Positioned.directional(
      textDirection: Directionality.of(context),
      start: 75,
      top: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width - 75,
      child: Dismissible(
        key: ValueKey('dismiss'),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            _categoryBloc.add(SubCategoryDismissEvent(categoryIndex));
          }
        },
        child: SlideTransition(
          position: _sliderAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
              ),
            ),
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 25),
              decoration: BoxDecoration(
                // color: color.withOpacity(0.15),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                ),
              ),
              child: ListView.builder(
                controller: _subScrollController,
                itemCount: subCategoryArr.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new SearchResult(
                              Categories: [subCategoryArr[index].categoryId],
                              searchQuery: new SearchQueryModel(''),
                            ),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                          start: 15, end: 15, top: 15, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 3, top: 3, end: 3, bottom: 3),
                              child: Image.network(
                                subCategoryArr[index].image,
                                // categoriesArr[index].icon network image
                                height: 37,
                                width: 37,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: buildText(
                                subCategoryArr[index].category, 15.0,
                                color: textColor,
                                fontFamily: semiBoldFontFamily,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setupAnimation() {
    _sliderController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _sliderAnimation = Tween<Offset>(
      begin: LanguageHelper.isEnglish ? Offset(1, 0) : Offset(-1, 0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _sliderController,
      curve: Curves.easeIn,
    ));
  }

  Widget errorUI(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
