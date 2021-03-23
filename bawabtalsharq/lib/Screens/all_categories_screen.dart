import 'package:bawabtalsharq/Model/categories_model.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/material.dart';

import '../Utils/images.dart';
import '../Utils/strings.dart';
import '../widgets/widgets.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories>
    with TickerProviderStateMixin {
  AnimationController _sliderController;
  Animation<Offset> _sliderAnimation;
  ScrollController _mainScrollController = ScrollController();
  ScrollController _subScrollController = ScrollController();

  List<Positioned> _stackWidgets = List<Positioned>();
  bool _isPressed = false;
  String _appBarTitle = Strings().allCategories();

  @override
  void initState() {
    _stackWidgets.add(getMainCategoriesList(context));
    super.initState();
  }

  @override
  void dispose() {
    categoriesArr.forEach((element) {
      element.isSelected = false;
    }); // to do remove after add api
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarBuilder(
        actions: [Container()],
        title: _appBarTitle,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
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
      body: SafeArea(
        child: Stack(
          children: _stackWidgets,
        ),
      ),
    );
  }

  Positioned getMainCategoriesList(BuildContext context) {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: ListView.builder(
          controller: _mainScrollController,
          itemCount: categoriesArr.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  categoriesArr.forEach((element) {
                    element.isSelected = false;
                  });
                  _stackWidgets = [
                    getMainCategoriesList(context),
                    getSubCategoriesList(
                        context,
                        index,
                        categoriesArr[index].subCategory,
                        Color(categoriesArr[index].color).withOpacity(0.15))
                  ];
                  _appBarTitle = categoriesArr[index].name;
                  _isPressed = true;
                  categoriesArr[index].isSelected = true;
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15, left: 8, right: 8),
                child: Row(
                  children: [
                    Container(
                      padding: categoriesArr[index].isSelected
                          ? EdgeInsets.all(3)
                          : EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: categoriesArr[index].isSelected
                            ? Border.all(
                                color: defaultOrangeColor.withOpacity(0.8),
                                width: 3)
                            : Border.all(color: Colors.transparent),
                        color: Colors.white,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(categoriesArr[index].color)
                              .withOpacity(0.15),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Image.asset(
                          cold_drinks,
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: buildText(categoriesArr[index].name, 15.0,
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
    );
  }

  Positioned getSubCategoriesList(BuildContext context, int categoryIndex,
      List<SubCategory> subCategoryArr, Color color) {
    setupAnimation();
    return Positioned(
      left: 75,
      top: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width - 75,
      child: Dismissible(
        key: ValueKey('dismiss'),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            setState(() {
              _appBarTitle = Strings().allCategories();
              _isPressed = false;
              categoriesArr[categoryIndex].isSelected = false;
              _stackWidgets = [getMainCategoriesList(context)];
            });
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
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
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
                      print('sub pressed');
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Image.asset(
                                cold_drinks,
                                height: 37,
                                width: 37,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: buildText(subCategoryArr[index].name, 15.0,
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
      begin: const Offset(1, 0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _sliderController,
      curve: Curves.easeIn,
    ));
  }
}
