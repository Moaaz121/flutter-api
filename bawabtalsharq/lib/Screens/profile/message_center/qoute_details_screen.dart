import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuoteDetailsScreen extends StatefulWidget {
  @override
  _QuoteDetailsScreenState createState() => _QuoteDetailsScreenState();
}

class _QuoteDetailsScreenState extends State<QuoteDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).quoteDetails,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(children: [
        infoCartSupplier(
            'Mohamed Mosadik Hassanien', '3 YRS', 'Egypt', 'Food & Bevereges'),
      ]),
    );
  }
}
