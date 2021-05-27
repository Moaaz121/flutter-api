import 'package:bawabtalsharq/Model/checkPointFliter.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _checked1 = false;
  bool _checked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseOrange,
        title: Center(
          child: titleText(Languages.of(context).filter,
              size: 20, color: Colors.white),
        ),
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
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(bottom: 40),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle(context, Languages.of(context).category, () {
              Navigator.pushNamed(context, ScreenRoutes.categoriesFilterScreen);
            }, Languages.of(context).seeAll, Colors.black,
                icon: Icons.arrow_forward),
            listOfCate(cold_drinks),
            titleText(Languages.of(context).expressShipping),
            listOfCheckBox(),
            buildSizedBox(10),
            lineDivider(),
            titleText(Languages.of(context).shippedFrom),
            buildCheckbox(1, text: Languages.of(context).egypt),
            buildCheckbox(2, text: Languages.of(context).shippedFromAbroad),
            buildSizedBox(25),
            lineDivider(),
            titleText(Languages.of(context).rating),
            rating(),
            buildSizedBox(25),
            lineDivider(),
            titleText(Languages.of(context).sellerScore),
            list3OfCheckBox(),
            lineDivider(),
            textTitle(context, Languages.of(context).brand, () {
              Navigator.pushNamed(context, ScreenRoutes.listFilter);
            }, Languages.of(context).seeAll, Colors.black,
                icon: Icons.arrow_forward),
            listOfCate(starBocks),
            titleText(Languages.of(context).price),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textFiledPrice(context, Languages.of(context).from, width: 0.4),
                textFiledPrice(context, Languages.of(context).to, width: 0.4),
              ],
            ),
            buildSizedBox(25),
            titleText(Languages.of(context).discount),
            list4OfCheckBox(),
            lineDivider(),
            textTitle(context, Languages.of(context).sizes, () {
              Navigator.pushNamed(context, ScreenRoutes.listFilter);
            }, 'X, XL', Colors.deepOrangeAccent, icon: Icons.arrow_forward_ios),
            buildSizedBox(25),
            lineDivider(),
            textTitle(context, Languages.of(context).colors, () {
              Navigator.pushNamed(context, ScreenRoutes.colorFilterScreen);
            }, 'Orange', Colors.deepOrange, icon: Icons.arrow_forward_ios),
            buildSizedBox(25),
            lineDivider(),
            textTitle(context, Languages.of(context).gender, () {
              Navigator.pushNamed(context, ScreenRoutes.listFilter);
            }, 'Male', Colors.deepOrange, icon: Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height);

  SizedBox buildCheckbox(int pos, {String text = '', double size = 14}) {
    return SizedBox(
      height: 30,
      child: CheckboxListTile(
        contentPadding: EdgeInsetsDirectional.only(start: 30),
        title: Text(
          text,
          style: TextStyle(
            fontSize: size,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: pos == 1 ? _checked1 : _checked2,
        onChanged: (bool value) {
          setState(() {
            pos == 1 ? _checked1 = value : _checked2 = value;
          });
        },
        activeColor: orangeColor,
        checkColor: Colors.white,
      ),
    );
  }

  Widget checkboxBuilder(
      {@required String text,
      @required Function onChanged,
      @required bool value,
      double size = 13}) {
    return Transform.scale(
      scale: 1.1,
      child: SizedBox(
        height: 30,
        child: CheckboxListTile(
          contentPadding: EdgeInsetsDirectional.only(start: 40),
          title: Text(
            text,
            style: TextStyle(
              fontSize: size,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: value,
          onChanged: onChanged,
          activeColor: orangeColor,
          checkColor: Colors.white,
        ),
      ),
    );
  }

  Column lineDivider({double height = 10}) {
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
          height: height,
        ),
      ],
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
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(placeHolder),
                    ),
                  ),
                  errorWidget: (context, url, error) => Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(placeHolder),
                    ),
                  ),
                ),
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

  Widget textTitle(BuildContext context, String text, Function onPress,
      String centerText, Color color,
      {double size = 15, IconData icon}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, start: 30, end: 30),
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
              children: [
                Text(
                  centerText,
                  style: TextStyle(color: color, fontSize: size),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  icon,
                  size: 18,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget titleText(String text,
      {double size = 15, Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 25),
      child: Text(text,
          style: TextStyle(
            color: color,
            fontSize: size,
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
        itemPadding: EdgeInsets.symmetric(horizontal: 3),
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
