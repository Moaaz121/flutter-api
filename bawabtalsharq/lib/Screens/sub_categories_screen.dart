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
    return Container(
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
            margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
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
    );
  }
}
