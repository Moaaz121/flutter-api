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
  ScrollController _scrollController = ScrollController();
  List<Positioned> stackWidgets = List<Positioned>();
  var appBarTitle = Strings().allCategories();
  @override
  void initState() {
    stackWidgets.add(getMainCategoriesList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        actions: [Container()],
        title: appBarTitle,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: buildFloatingActionBtn(
        icon: Icons.arrow_upward_rounded,
        onPressed: () {
          _scrollController.animateTo(0.0,
              duration: Duration(seconds: 1), curve: Curves.easeOut);
        },
      ),
      body: SafeArea(
        child: Stack(
          children: stackWidgets,
        ),
      ),
    );
  }

  Positioned getMainCategoriesList(BuildContext context) {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 200,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  appBarTitle = 'SubCategory';
                  stackWidgets.add(getSubCategoriesList(context));
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
                      child: Text('Category Name'),
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

  Positioned getSubCategoriesList(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width * 0.83,
      child: Container(
        margin: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
          ),
        ),
        child: ListView.builder(
          itemCount: 30,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
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
                    child: Text('Sub Category Name'),
                  ),
                  Icon(Icons.navigate_next),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
