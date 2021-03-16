import 'package:flutter/material.dart';

import '../Utils/images.dart';
import '../Utils/strings.dart';
import '../widgets/widgets.dart';

List<String> categoriesArr = [
  'Cat 1',
  'Cat 2',
  'Cat 3',
  'Cat 4',
  'Cat 5',
  'Cat 6',
  'Cat 7',
  'Cat 8',
  'Cat 9',
  'Cat 10',
  'Cat 11',
  'Cat 12',
  'Cat 13',
  'Cat 14',
  'Cat 15',
  'Cat 16',
  'Cat 17',
  'Cat 18',
  'Cat 19',
  'Cat 20'
];

List<String> subCategoryArr = [
  'Sub 1',
  'Sub 2',
  'Sub 3',
  'Sub 4',
  'Sub 5',
  'Sub 6',
  'Sub 7',
  'Sub 8',
  'Sub 9',
  'Sub 10',
  'Sub 11',
  'Sub 12',
  'Sub 13',
  'Sub 14',
  'Sub 15',
  'Sub 16',
  'Sub 17',
  'Sub 18',
  'Sub 19',
  'Sub 20'
];

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
                  _appBarTitle = categoriesArr[index];
                  _isPressed = true;
                  _stackWidgets
                      .add(getSubCategoriesList(context, subCategoryArr));
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15, left: 8, right: 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[200]),
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
                      child: Text(categoriesArr[index]),
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
      BuildContext context, List<String> subCategoryArr) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width * 0.83,
      child: GestureDetector(
        onHorizontalDragEnd: (update) {
          setState(() {
            _appBarTitle = Strings().allCategories();
            _stackWidgets.removeLast();
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
            ),
          ),
          child: ListView.builder(
            controller: _subScrollController,
            itemCount: subCategoryArr.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
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
                      child: Text(subCategoryArr[index]),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
