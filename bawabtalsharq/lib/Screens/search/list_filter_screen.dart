import 'package:bawabtalsharq/Model/categories_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListFilterScreen extends StatefulWidget {
  @override
  _ListFilterScreenState createState() => _ListFilterScreenState();
}

class _ListFilterScreenState extends State<ListFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).filter,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: buildListViewFilter(),
    );
  }

  ListView buildListViewFilter() {
    return ListView.builder(
        itemCount: searchCategoriesArr.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              setState(() {
                searchCategoriesArr[position].isSelected =
                    !searchCategoriesArr[position].isSelected;
              });
            },
            child: Container(
              margin: EdgeInsetsDirectional.fromSTEB(5, 30, 10, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: searchCategoriesArr[position].isSelected,
                    onChanged: (bool newValue) {
                      setState(() {
                        searchCategoriesArr[position].isSelected =
                            !searchCategoriesArr[position].isSelected;
                      });
                    },
                    activeColor: defaultOrangeColor,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: buildText(
                      searchCategoriesArr[position].name,
                      16,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
