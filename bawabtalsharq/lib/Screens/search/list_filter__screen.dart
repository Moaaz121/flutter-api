import 'package:bawabtalsharq/Model/checkPointFliter.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListFliter extends StatefulWidget {
  @override
  _ListFliterState createState() => _ListFliterState();
}

class _ListFliterState extends State<ListFliter> {
  bool _checked1 = false;
  bool _checked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.of(context).filter),
        toolbarHeight: 70,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              Languages.of(context).done,
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
        padding: EdgeInsetsDirectional.only(bottom: 30),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle(context, Languages.of(context).category, () {}),
            listOfCate(cold_drinks),
            titleText(Languages.of(context).expressShipping),
            listOfCheckBox(),
            lineDivider(),
            titleText(Languages.of(context).shippedFrom),
            buildCheckbox(1, text: Languages.of(context).egypt),
            buildCheckbox(2, text: Languages.of(context).shippedFromAbroad),
            lineDivider(),
            titleText(Languages.of(context).rating),
            rating(),
            buildSizedBox(),
            lineDivider(),
            titleText(Languages.of(context).sellerScore),
            list3OfCheckBox(),
            lineDivider(),
            textTitle(context, Languages.of(context).brand, () {}),
            listOfCate(starBocks),
            titleText(Languages.of(context).price),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textFiledPrice(context, Languages.of(context).from),
                textFiledPrice(context, Languages.of(context).to),
              ],
            ),
            buildSizedBox(),
            titleText(Languages.of(context).discount),
            list4OfCheckBox(),
            lineDivider(),
            textTitle(context, Languages.of(context).sizes, () {}),
            buildSizedBox(),
            lineDivider(),
            textTitle(context, Languages.of(context).colors, () {}),
            buildSizedBox(),
            lineDivider(),
            textTitle(context, Languages.of(context).gender, () {}),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(height: 25);

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

  Column lineDivider() {
    return Column(
      children: [
        Divider(
          height: 1,
          thickness: 0.1,
          indent: 25,
          endIndent: 25,
          color: Colors.black45,
        ),
        SizedBox(
          height: 10,
        ),
      ],
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

  Widget listOfCheckBox({List filter}) {
    return Container(
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
        SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          child: ListView.builder(
            padding: EdgeInsets.all(1),
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

  Widget textTitle(BuildContext context, String text, Function onPress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsetsDirectional.only(top: 20, start: 30, end: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              GestureDetector(
                onTap: onPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: 25,
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
      padding: const EdgeInsetsDirectional.only(start: 25),
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

  Widget rating() {
    return Center(
      child: RatingBar.builder(
        itemSize: 35,
        initialRating: 3.5,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 5),
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

Widget textFiledPrice(BuildContext context, String text) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.4,
    child: TextField(
      cursorColor: Theme.of(context).bottomAppBarColor,
      decoration: InputDecoration(
        hintText: text,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF858289)),
        ),
      ),
    ),
  );
}
