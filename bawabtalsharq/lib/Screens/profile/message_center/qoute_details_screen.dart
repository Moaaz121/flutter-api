import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: appBarBuilder(
        title: Languages.of(context).quoteDetails,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 22, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        infoCartSupplier('varius sollicitudin', '3 YRS',
                            'Egypt', 'Food & Bevereges'),
                        buildSizedBox(height: 22),
                        Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image(
                              image: AssetImage(dominikMarti1),
                              width: 49,
                              height: 43,
                            ),
                          ),
                          buildSizedBox(width: 10),
                          buildText(
                            (Languages.of(context).productDetails),
                            12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000),
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: buildRow(
                            (Languages.of(context).minOrder),
                            '3000.000 Pieces gvgkhcf ifttftiyftyftfctyi ',
                            Colors.white,
                          ),
                        ),
                        buildSizedBox(height: 11),
                        buildRow(
                          (Languages.of(context).unitPrice),
                          '10.000.00',
                          Colors.white,
                        ),
                        buildSizedBox(height: 22),
                        buildRow(
                          (Languages.of(context).shippingTerm),
                          'FOB',
                          Colors.transparent,
                        ),
                        buildSizedBox(height: 11),
                        buildRow(
                          (Languages.of(context).paymentTerm),
                          'T/T',
                          Colors.transparent,
                        ),
                        buildSizedBox(height: 11),
                        buildRow(
                          (Languages.of(context).port),
                          'GUANGZHOU',
                          Colors.transparent,
                        ),
                        buildSizedBox(height: 22),
                        buildText(
                          (Languages.of(context).productDetails),
                          12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff646464),
                        ),
                        buildSizedBox(height: 5),
                        buildText(
                          'Product Details Product Details Product Details Product Details Product Details Product Details Product Details Product Details Product Details Product Details Product Details Product Details ',
                          12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                        buildSizedBox(height: 33),
                        productListView(context),
                      ])),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: signInFlatButton(context, MediaQuery.of(context).size.height,
                Languages.of(context).backToChat, () {}),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Row buildRow(
    String text,
    String subtext,
    Color color,
  ) {
    return Row(children: [
      buildText(
        text,
        12,
        fontWeight: FontWeight.w600,
        color: Color(0xff646464),
      ),
      buildSizedBox(width: 11),
      Flexible(
        child: Container(
            padding: EdgeInsets.only(
              left: 2,
              top: 5,
            ),
            decoration: new BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: buildText(subtext, 10,
                fontWeight: FontWeight.w600, color: Colors.black)),
      ),
    ]);
  }

  SizedBox buildSizedBox({double height, Widget child, double width}) {
    return SizedBox(
      height: height,
      child: child,
      width: width,
    );
  }

  Widget productListView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(
          (Languages.of(context).productDetails),
          14,
          fontWeight: FontWeight.w600,
          color: Color(0xff646464),
        ),
        SizedBox(
          height: 11,
        ),
        Container(
          height: 59,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 11,
            itemBuilder: (context, position) {
              return Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: AssetImage(dominikMarti1),
                    fit: BoxFit.fill,
                    width: 56,
                    height: 69,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
