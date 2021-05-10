import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Model/golden_suppliers_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/main.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  ScrollController _scrollController = ScrollController();

  List<Products> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
          title: Languages.of(context).saved,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: products != null
          ? GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 30,
              controller: _scrollController,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, position) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.individualProduct);
                  },
                  child: productItem(context, fillSaved: true),
                );
              },
            )
          : Center(child: Text('No Saved Item')),
    );
  }
}
