import 'package:bawabtalsharq/Model/checkPointFliter.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListFilter extends StatefulWidget {
  @override
  _ListFilterState createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  // @override
  // void initState() {
  //   super.initState();
  //   _isChecked = List<bool>.filled(filterArray.length, false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fliter'),
        toolbarHeight: 70,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            category(context, 'Category', Languages.of(context).seeAll),
            SizedBox(height: 100, child: listOfCate(cold_drinks)),
            titleText('Express shipping'),
            listOfCheckBox(),
            lineDivider(),
            titleText('Shipped from'),
            listTooOfCheckBox(),
            lineDivider(),
            titleText('Rating'),
            Rating(),
            lineDivider(),
            titleText('Seller Score'),
            list3OfCheckBox(),
            lineDivider(),
            category(context, 'Brand', Languages.of(context).more),
            SizedBox(height: 100, child: listOfCate(mosadaq_img)),
            titleText('Price (EGP)'),
            titleText('Discount'),
            list4OfCheckBox()
          ],
        ),
      ),
    );
  }

  Divider lineDivider() {
    return Divider(
      height: 1,
      thickness: 0.1,
      indent: 25,
      endIndent: 25,
      color: Colors.black45,
    );
  }

  CheckboxListTile checkboxBuilder(
      {@required String text,
      @required Function onChanged,
      @required bool value}) {
    return CheckboxListTile(
      title: Text(text),
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: onChanged,
      activeColor: orangeColor,
      checkColor: Colors.white,
    );
  }

  Widget list4OfCheckBox() {
    return Container(
      height: 250,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filterArray4.length,
        itemBuilder: (context, position) {
          return checkboxBuilder(
            text: filterArray4[position].name,
            onChanged: (bool value) {
              setState(() {
                filterArray4[position].isSelected = value;
                // How did value change to true at this point?
              });
            },
            value: filterArray4[position].isSelected,
          );
        },
      ),
    );
  }

  Widget list3OfCheckBox() {
    return Container(
      height: 250,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filterArray3.length,
        itemBuilder: (context, position) {
          return checkboxBuilder(
            text: filterArray3[position].name,
            onChanged: (bool value) {
              setState(() {
                filterArray3[position].isSelected = value;
                // How did value change to true at this point?
              });
            },
            value: filterArray3[position].isSelected,
          );
        },
      ),
    );
  }

  Widget listTooOfCheckBox() {
    return Container(
      height: 110,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filterArray2.length,
        itemBuilder: (context, position) {
          return checkboxBuilder(
            text: filterArray2[position].name,
            onChanged: (bool value) {
              setState(() {
                filterArray2[position].isSelected = value;
                // How did value change to true at this point?
              });
            },
            value: filterArray2[position].isSelected,
          );
        },
      ),
    );
  }

  Widget listOfCheckBox() {
    return Container(
      height: 180,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filterArray.length,
        itemBuilder: (context, position) {
          return checkboxBuilder(
            text: filterArray[position].name,
            onChanged: (bool value) {
              setState(() {
                filterArray[position].isSelected = value;
                // How did value change to true at this point?
              });
            },
            value: filterArray[position].isSelected,
          );
        },
      ),
    );
  }

  Widget listOfCate(String image) {
    return Column(
      children: [
        lineDivider(),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            reverse: false,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, position) {
              return Container(
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 1),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ],
                ),
                child: Image.asset(image),
              );
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        lineDivider(),
      ],
    );
  }

  Widget category(BuildContext context, String text, String more) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              GestureDetector(
// onTap: onPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      more,
                      style: moreStyle(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      LanguageHelper.isEnglish
                          ? Icons.arrow_forward_rounded
                          : Icons.arrow_back_rounded,
                      size: 15,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget titleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.18,
          )),
    );
  }

// Widget expressShipping(String text) {
//   bool _checkbox = false;
//
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         child: Text("Express shipping",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
//               fontStyle: FontStyle.normal,
//               letterSpacing: 0.18,
//             )),
//       ),
//       CheckboxListTile(
//         title: Text(text),
//         controlAffinity: ListTileControlAffinity.leading,
//         value: _checkbox,
//         onChanged: (value) {
//           setState(() {
//             _checkbox = !_checkbox;
//           });
//         },
//         activeColor: orangeColor,
//         checkColor: Colors.white,
//       )
//     ],
//   );
// }

  Widget shipped(String text) {
    return Container(
        child: Row(
      children: [
        CheckboxListTile(
          title: Text(text),
          controlAffinity: ListTileControlAffinity.leading,
          value: true,
          activeColor: orangeColor,
          checkColor: Colors.white,
        ),
        CheckboxListTile(
          title: Text(text),
          controlAffinity: ListTileControlAffinity.leading,
          value: true,
          activeColor: orangeColor,
          checkColor: Colors.white,
        ),
      ],
    ));
  }

  Widget Rating() {
    return Center(
      child: RatingBar.builder(
        itemSize: 35,
        initialRating: 3.5,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 1),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
