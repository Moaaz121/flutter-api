import 'dart:math';

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
                  categoriesArr[index].isSelected = true;
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
                    Visibility(
                      visible: true,
                      child: Center(
                        child: Container(
                          child: Transform.rotate(
                            angle: pi / 2,
                            child: CustomPaint(
                              size: Size(12, 12),
                              painter: DrawTriangle(categoriesArr[index].color),
                            ),
                          ),
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
      left: 65,
      top: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Dismissible(
        key: ValueKey('dismiss'),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            setState(() {
              _appBarTitle = Strings().allCategories();
              _isPressed = false;
              _stackWidgets.removeLast();
            });
          }
        },
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
      ),
    );
  }
}

class DrawTriangle extends CustomPainter {
  Paint _paint;
  int color;
  DrawTriangle(this.color) {
    _paint = Paint()
      ..color = Color(color)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}
