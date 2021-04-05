import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset:
                false, // to keep the size, when opening the keyboard

            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 35, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          radius: 9,
                          backgroundColor: orangeColor,
                          child: Icon(
                            LanguageHelper.isEnglish
                                ? Icons.keyboard_arrow_left_outlined
                                : Icons.keyboard_arrow_right_outlined,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      buildTextField(
                          hint: (Languages.of(context).search),
                          context: context),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 35, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: .2,
                        endIndent: 20,
                        indent: 20,
                        color: Colors.grey,
                      ),
                      buildText((Languages.of(context).searchByCategories), 14,
                          FontWeight.w600, Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 11,
                          itemBuilder: (context, position) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              height: 42,
                              width: 42,
                              decoration: new BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 1),
                                      blurRadius: 6,
                                      spreadRadius: 0)
                                ],
                              ),
                              child: Image.asset(
                                cold_drinks,
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: .2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildText((Languages.of(context).resentSearch), 14,
                          FontWeight.w600, Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: height * 0.5,
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 44,
                          itemBuilder: (context, position) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: buildText(
                                    'handmade crafts',
                                    13,
                                    FontWeight.w400,
                                    Color(0xff646464),
                                  )),
                                  CircleAvatar(
                                    radius: 6,
                                    backgroundColor: orangeColor,
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text buildText(
    String text,
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SegoeUI',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}

Widget buildTextField({String hint, BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    height: MediaQuery.of(context).size.width * 0.10,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22), color: Colors.grey[100]),
    child: Center(
      child: TextField(
        onSubmitted: (value) {
          Navigator.pushNamed(context, ScreenRoutes.searchResultScreen);
        },
        keyboardType: TextInputType.text,
        autocorrect: true,
        cursorRadius: Radius.circular(50),
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black12),
          filled: true,
        ),
      ),
    ),
  );
}