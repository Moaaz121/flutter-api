import 'package:flutter/material.dart';

import '../Utils/images.dart';
import '../Utils/strings.dart';
import '../widgets/widgets.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Strings().allCategories(),
        onBackPressed: () {
          print('Back Button Pressed');
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
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 200,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('cell Tapped');
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[200]),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
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
                        child: Text('BEVERAGES'),
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
