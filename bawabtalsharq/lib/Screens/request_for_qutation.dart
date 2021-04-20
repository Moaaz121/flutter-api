import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class Requestforqutation extends StatefulWidget {
  @override
  _RequestforqutationState createState() => _RequestforqutationState();
}

class _RequestforqutationState extends State<Requestforqutation> {
  bool _isPressed = false;
  bool _checked1 = false;
  bool _checked2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white54.withOpacity(0.92),
        appBar: appBarBuilder(
            title: Languages.of(context).requestForQuotation,
            onBackPressed: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildColumnText(
                context,
                text: Languages.of(context).productName,
                inputText: Languages.of(context).inputProduct,
              ),

              buildColumnDrop(context,
                  text: Languages.of(context).categoryName,
                  dropText: Languages.of(context).dropCategory,
                  dropList: ['ahmed', 'moaaz']),

              buildColumnDrop(context,
                  text: Languages.of(context).sourcingPurpose,
                  dropText: Languages.of(context).dropSourcing,
                  dropList: ['ahmed', 'moaaz']),

              buildColumnText(
                context,
                text: Languages.of(context).quantity,
                inputText: '000000000',
                margin: 60,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.055,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: DropDown<String>(
                        showUnderline: false,
                        isExpanded: true,
                        items: <String>[
                          "Apparel",
                          "Electronics",
                          "Other",
                          "sony",
                        ],
                        hint: Text(
                          Languages.of(context).dropQuantity,
                          style: TextStyle(
                            color: backTabColor.withOpacity(0.8),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        // onChanged: print,
                      ),
                    ),
                  ),
                ),
              ),

              buildColumnDrop(context,
                  text: Languages.of(context).tradeTerms,
                  dropText: Languages.of(context).dropTrade,
                  dropList: ['ahmed', 'moaaz']),

              // <----start Details---->
              buildColumnText(
                context,
                text: Languages.of(context).details,
                inputText: Languages.of(context).inputDetails,
                height: 0.3,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: defaultPrimaryBackgroundColor.withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.backup_rounded,
                          color: Colors.deepOrangeAccent.withOpacity(0.5),
                          size: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Text(
                          Languages.of(context).uploadDocument,
                          style: TextStyle(
                              color: Color(0xFF5E5E5E),
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Languages.of(context).advanced,
                        style: TextStyle(
                            fontSize: 17,
                            color: orangeColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsetsDirectional.only(start: 10, end: 10),
                          height: 2,
                          color: orangeColor.withOpacity(0.3),
                        ),
                      ),
                      _isPressed
                          ? Icon(Icons.keyboard_arrow_up_rounded,
                              color: orangeColor)
                          : Icon(Icons.keyboard_arrow_down_rounded,
                              color: orangeColor),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: _isPressed,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20, top: 5, bottom: 5, end: 20),
                        child: Text(
                          Languages.of(context).supplierCapability,
                          style: TextStyle(
                            fontFamily: 'assets/fonts/Roboto-Light.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 20, end: 20, start: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    buildColumnDrop(context,
                        text: Languages.of(context).certifications,
                        dropText: Languages.of(context).dropCertificate,
                        dropList: ['ahmed', 'moaaz']),
                    buildColumnText(
                      context,
                      text: Languages.of(context).requirements,
                      inputText: Languages.of(context).inputRequire,
                      height: 0.3,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            end: 20, top: 5, bottom: 5, start: 20),
                        child: Text(
                          Languages.of(context).shipping,
                          style: TextStyle(
                              fontFamily: 'assets/fonts/Roboto-Light.ttf',
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 20, end: 20, start: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    buildColumnDrop(context,
                        text: Languages.of(context).shippingMethod,
                        dropText: Languages.of(context).dropShipping,
                        dropList: ['ahmed', 'moaaz']),
                    buildColumnDrop(context,
                        text: Languages.of(context).destination,
                        dropText: Languages.of(context).dropDestination,
                        dropList: ['ahmed', 'moaaz']),
                    buildColumnText(
                      context,
                      text: Languages.of(context).port,
                      inputText: Languages.of(context).port,
                    ),
                    buildColumnText(context,
                        text: Languages.of(context).leadTime,
                        inputText: '000000000',
                        margin: 60),
                    buildColumnText(
                      context,
                      text: Languages.of(context).paymentTerm,
                      inputText: Languages.of(context).paymentTerm,
                    ),
                    buildCheckbox(1, text: Languages.of(context).check1),
                    buildCheckbox(2, text: Languages.of(context).check2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 15, bottom: 20, end: 40),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RaisedButton(
                              splashColor: orangeColor.withOpacity(0.5),
                              highlightColor: orangeColor.withOpacity(0.2),
                              disabledColor: Colors.transparent,
                              child: Text(
                                Languages.of(context).submit,
                                style: TextStyle(
                                  color: orangeColor,
                                ),
                              ),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: new BorderSide(
                                  color: orangeColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CheckboxListTile buildCheckbox(int pos, {String text = ''}) {
    return CheckboxListTile(
      title: Text(text),
      controlAffinity: ListTileControlAffinity.leading,
      value: pos == 1 ? _checked1 : _checked2,
      onChanged: (bool value) {
        setState(() {
          pos == 1 ? _checked1 = value : _checked2 = value;
        });
      },
      activeColor: orangeColor,
      checkColor: Colors.white,
    );
  }

  Padding buildColumnDrop(
    BuildContext context, {
    String text,
    String dropText,
    List<String> dropList,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'assets/fonts/Roboto-Light.ttf', fontSize: 16),
          ),
          Center(
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 10),
              margin: EdgeInsetsDirectional.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: DropDown<String>(
                  showUnderline: false,
                  isExpanded: true,
                  items: dropList,
                  hint: Text(
                    dropText,
                    style: TextStyle(
                      color: backTabColor.withOpacity(0.8),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  // onChanged: print,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildColumnText(BuildContext context,
      {String text,
      String inputText,
      double margin = 0,
      double height = 0.055}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'assets/fonts/Roboto-Light.ttf', fontSize: 16),
          ),
          Center(
            child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              margin: EdgeInsetsDirectional.only(
                  top: 10, end: margin, start: margin),
              height: MediaQuery.of(context).size.height * height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: inputText,
                  hintStyle: TextStyle(
                    color: backTabColor.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
