import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionBtn(
          icon: Icons.arrow_upward_rounded,
          onPressed: () {
            _scrollController.animateTo(0.0,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }),
      appBar: appBarBuilder(
          title: Languages.of(context).history,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: Column(children: [
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: 30,
            controller: _scrollController,
            shrinkWrap: true,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ScreenRoutes.individualProduct);
                },
                child: productItemLandscape(context),
              );
            },
          ),
        ),
      ]),
    );
  }
}
