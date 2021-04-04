import 'package:bawabtalsharq/Model/categories_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchCategories extends StatefulWidget {
  @override
  _SearchCategoriesState createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  bool _isSearchPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearchPressed
          ? appBarSearch(
              hint: Languages.of(context).search,
              onCancelPressed: () {
                setState(() {
                  _isSearchPressed = false;
                });
              },
              context: context)
          : appBarBuilder(
              title: Languages.of(context).categories,
              onBackPressed: () {
                Navigator.pop(context);
              },
              actions: [
                appBarSearchButton(() {
                  setState(() {
                    _isSearchPressed = true;
                  });
                }),
                SizedBox(
                  width: 10,
                )
              ],
            ),
      body: ListView.builder(
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
                margin: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
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
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [makeShadow()],
                      ),
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Image.asset(
                        searchCategoriesArr[position].icon,
                        height: 58,
                        width: 58,
                      ),
                    ),
                    SizedBox(
                      width: 10,
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
          }),
    );
  }
}
