import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
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
      child: Scaffold(
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                IconButton(
                  icon: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(
                      LanguageHelper.isEnglish
                          ? Icons.keyboard_arrow_left_outlined
                          : Icons.keyboard_arrow_right_outlined,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: height * .3,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffefefef),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'search',
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: height * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 17,
                left: 42,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: .5,
                    endIndent: 20,
                    color: Colors.grey,
                  ),
                  buildText(
                    'search by categories',
                    13,
                    FontWeight.w600,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: SizedBox(
                      height: height * .05,
                      child: ListView.builder(
                        padding: EdgeInsets.all(2),
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 11,
                        itemBuilder: (context, position) {
                          return Container(
                            margin: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            height: 37,
                            width: 38,
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
                              width: 38,
                              height: 37,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(
                    thickness: .5,
                    indent: 1,
                    endIndent: 20,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 9,
                    ),
                    child: buildText(
                      'Recent search',
                      13,
                      FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, right: 37),
                    child: SizedBox(
                      height: height * .5,
                      child: ListView.builder(
                        padding: EdgeInsets.all(2),
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (context, position) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                buildText(
                                  'Recent search',
                                  13,
                                  FontWeight.w400,
                                ),
                                Expanded(child: Text('text')),
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(
    String text,
    double fontSize,
    FontWeight fontWeight,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SegoeUI',
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
