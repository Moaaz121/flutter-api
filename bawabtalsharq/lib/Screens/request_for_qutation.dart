import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:line_icons/line_icons.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white54.withOpacity(0.92),
        appBar: appBarBuilder(
            title: Strings().requestForQ(),
            onBackPressed: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildColumnText(
                context,
                text: 'Product name',
                inputText: 'please enter product name...',
              ),

              buildColumnDrop(context,
                  text: 'Category name',
                  dropText: 'Select Category',
                  dropList: ['ahmed', 'moaaz']),

              buildColumnDrop(context,
                  text: 'Sourcing Purpose',
                  dropText: 'please enter product name...',
                  dropList: ['ahmed', 'moaaz']),

              buildColumnText(
                context,
                text: 'Quantity',
                inputText: '000000000',
                margin: 60,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
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
                      padding: const EdgeInsets.all(8.0),
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
                          "Pieces",
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
                  text: 'Trade Terms',
                  dropText: 'FCA',
                  dropList: ['ahmed', 'moaaz']),

              // <----start Details---->
              buildColumnText(
                context,
                text: 'Details',
                inputText: 'Please Enter At least 20 Character',
                height: 0.3,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
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
                          "Upload Sourcing Document",
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
                padding: const EdgeInsets.all(20),
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
                        'Advanced',
                        style: TextStyle(
                            fontSize: 17,
                            color: orangeColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
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
                        padding: const EdgeInsets.only(
                            left: 20, top: 5, bottom: 5, right: 20),
                        child: Text(
                          'Supplier Capability',
                          style: TextStyle(
                            fontFamily: 'assets/fonts/Roboto-Light.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 20, left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    buildColumnDrop(context,
                        text: 'Certifications',
                        dropText: 'Select Certificate',
                        dropList: ['ahmed', 'moaaz']),
                    buildColumnText(
                      context,
                      text: 'Details',
                      inputText: 'Please Enter At least 20 Character',
                      height: 0.3,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 5, bottom: 5, right: 20),
                        child: Text(
                          'Shipping & Payment',
                          style: TextStyle(
                              fontFamily: 'assets/fonts/Roboto-Light.ttf',
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 20, left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    buildColumnDrop(context,
                        text: 'Shipping Method',
                        dropText: 'Select Shipping',
                        dropList: ['ahmed', 'moaaz']),
                    buildColumnDrop(context,
                        text: 'Destination',
                        dropText: 'Select Destination',
                        dropList: ['ahmed', 'moaaz']),
                    buildColumnText(
                      context,
                      text: 'Port',
                      inputText: 'enter port',
                    ),
                    buildColumnText(context,
                        text: 'Lead Time Ship in',
                        inputText: '000000000',
                        margin: 60),
                    buildColumnText(
                      context,
                      text: 'Payment Term',
                      inputText: 'Mone Gram',
                    ),
                    buildCheckbox(1,
                        text:
                            'I agree to share my Business Card with quoted suppliers'),
                    buildCheckbox(2,
                        text:
                            'I have read, Understood and agree to payed, by the Buying Request Posting Rules'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RaisedButton(
                              disabledColor: Colors.transparent,
                              child: Text(
                                'Submit',
                                style: TextStyle(color: orangeColor),
                              ),
                              onPressed: null,
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
      padding: const EdgeInsets.all(18),
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
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
      padding: const EdgeInsets.all(18),
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
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10, left: margin, right: margin),
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
