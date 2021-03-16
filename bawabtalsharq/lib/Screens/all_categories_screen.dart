import 'package:bawabtalsharq/Model/categories_model.dart';
import 'package:flutter/material.dart';

import '../Utils/images.dart';
import '../Utils/strings.dart';
import '../widgets/widgets.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (_isPressed) {
                    _stackWidgets.removeLast();
                  }
                  _stackWidgets.add(getSubCategoriesList(
                      context,
                      categoriesArr[index].subCategory,
                      Color(categoriesArr[index].color)));
                  _appBarTitle = categoriesArr[index].name;
                  _isPressed = true;
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15, left: 8, right: 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(categoriesArr[index].color)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
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
                      child: Text(categoriesArr[index].name),
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

  Positioned getSubCategoriesList(
      BuildContext context, List<SubCategory> subCategoryArr, Color color) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width * 0.83,
      // child: GestureDetector(
      //   onHorizontalDragEnd: (update) {
      //     setState(() {
      //       _appBarTitle = Strings().allCategories();
      //       _isPressed = false;
      //       _stackWidgets.removeLast();
      //     });
      //   },
      child: Container(
        margin: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: color,
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
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white),
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
                      child: Text(subCategoryArr[index].name),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      //   ),
    );
  }
}
