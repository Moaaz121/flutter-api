import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:line_icons/line_icons.dart';

class Requestforqutation extends StatefulWidget {
  // final ValueChanged<String> onChanged;
  // const product_name({Key key, this.onChanged}) : super(key: key);
  @override
  _RequestforqutationState createState() => _RequestforqutationState();
}

class _RequestforqutationState extends State<Requestforqutation> {
  bool _isPressed = false;
  bool _checked = false;
  bool _check = false;

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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // <----start input product name---->
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Product name',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          // onChanged: onChanged,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'enter product name...',
                            hintStyle: TextStyle(
                              color: backTabColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // <----end input product name---->

                // <----start input category name---->

                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      'Category name',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
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
                          "Select Category",
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

                // <----end input category name---->

                // <----start input sourcing purpose name---->
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      'Sourcing Purpose',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
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
                          "Select Category",
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

                // <----end input sourcing purpose name---->

                // <----start input Quantity---->

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          // onChanged: onChanged,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '000000000',
                            hintStyle: TextStyle(
                              color: backTabColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
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

                // <----end input Quantity---->

                // <----start sourcing purpose---->
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      'Sourcing Purpose',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
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
                          "Select Category",
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

                // <----end sourcing purpose---->

                // <----start trade terms---->

                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      'Trade Terms',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
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
                          "Select Category",
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

                // <----end trade terms---->

                // <----start Details---->

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Details',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          // onChanged: onChanged,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Please enter At least 20 Characters... ',
                            hintStyle: TextStyle(
                              color: backTabColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // <----end Details---->

                // <----start upload sourcing document---->

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

                // <----end upload sourcing document---->

                // <----Start Advanced---->

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
                          style: TextStyle(fontSize: 16, color: orangeColor),
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

                // <----end Advanced---->

                // <----start Supplier Capability---->

                Visibility(
                  visible: _isPressed,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Text(
                            'Supplier Capability',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/Roboto-Light.ttf',
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 2,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),

                      // <----end Supplier Capability---->

                      // <----Start Certification---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            'Certifications',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
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
                                "Select Certificate",
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

                      // <----end Certification---->

                      // <----start other requirments---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Other Requirments',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                minLines: 1,
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                // onChanged: onChanged,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      'Please enter At least 20 Characters... ',
                                  hintStyle: TextStyle(
                                    color: backTabColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // <----end other requirments---->

                      // <----start shipping & payment---->

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            'Shipping & Payment',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/Roboto-Light.ttf',
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 2,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),

                      // <----end shipping & payment---->

                      // <----start Shipping Method---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            'Shipping Method',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
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
                                "Select shipping",
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

                      // <----end Shipping Method---->

                      // <----start Destination---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 10),
                          child: Text(
                            'Destination',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
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
                                "Select Destination",
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

                      // <----end Destination---->

                      // <----start Port---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Port',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // onChanged: onChanged,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Port...',
                                  hintStyle: TextStyle(
                                    color: backTabColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // <----End Port---->

                      // <----start lead time ship in---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            'Lead Time Ship in',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // onChanged: onChanged,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '000000000',
                                  hintStyle: TextStyle(
                                    color: backTabColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // <----end lead time ship in---->

                      // <----start payment term---->

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Payment Term',
                            style: TextStyle(
                                fontFamily: 'assets/fonts/Roboto-Light.ttf',
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 20),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // onChanged: onChanged,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Money Gram...',
                                  hintStyle: TextStyle(
                                    color: backTabColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // <----end payment term---->

                      // <----start First Check box ---->
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: Text(
                              "I agree to share my Business Card with quoted suppliers"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _checked,
                          onChanged: (bool value) {
                            setState(() {
                              _checked = value;
                            });
                          },
                          activeColor: orangeColor,
                          checkColor: Colors.white,
                        ),
                      ),
                      // <----end First Check box---->

                      // <----start second Check box---->

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: Text(
                              "I have read, Understood and agree to payed, by the Buying Request Posting Rules"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _check,
                          onChanged: (bool value) {
                            setState(() {
                              _check = value;
                            });
                          },
                          activeColor: orangeColor,
                          checkColor: Colors.white,
                        ),
                      ),
                      // <----end second Check box---->

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15, bottom: 20),
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
      ),
    );
  }
}
