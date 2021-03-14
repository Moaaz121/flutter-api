import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/images.dart';

class SubCategories extends StatefulWidget {
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
              ),
              color: Colors.green[200],
            ),
            margin: EdgeInsets.only(top: 80, left: 85),
            child: ListView.builder(
              itemCount: 30,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset(
                            cold_drinks,
                            height: 35,
                            width: 35,
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
        ),
      ),
    );
  }
}
