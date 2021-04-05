import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Screens/search/search_sort_dialog.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<bool> selections;
  bool _isSearchPressed = false;
  bool isGrid = true;

  @override
  void initState() {
    selections = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearchPressed
          ? appBarSearch(
              hint: Languages.of(context).search,
              onCancelPressed: () {
                setState(() {
                  _isSearchPressed = false;
                });
              },
              context: context)
          : appBarBuilder(
              title: '',
              onBackPressed: () {
                Navigator.pop(context);
              },
              actions: [
                appBarSearchButton(() {
                  setState(() {
                    _isSearchPressed = true;
                  });
                }),
                SizedBox(
                  width: 10,
                )
              ],
            ),
      floatingActionButton:
          buildFloatingActionBtn(icon: Icons.arrow_upward, onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ScreenRoutes.listFilter);
                  },
                  child: sortFilterContainer(
                      context: context,
                      text: 'Filter',
                      icon: Icons.filter_alt_rounded),
                ),
                GestureDetector(
                  onTap: () {
                    //   showAnimatedDialog(
                    //     context,
                    //     sortDialog(context),
                    //   );
                  },
                  child: sortFilterContainer(
                      context: context, text: 'Sort', icon: Icons.sort),
                ),
                Container(
                  padding: EdgeInsets.only(left: 7, right: 7),
                  margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: orangeColor.withOpacity(0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!isGrid) {
                              isGrid = true;
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: isGrid ? Colors.white : Colors.transparent,
                          ),
                          child: Icon(
                            Icons.widgets_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isGrid) {
                              isGrid = false;
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: isGrid ? Colors.transparent : Colors.white,
                          ),
                          child: Icon(
                            Icons.apps,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.width * 0.08,
              child: ListView.builder(
                itemCount: 30,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return roundText(context);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            isGrid
                ? Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: 30,
                      itemBuilder: (context, position) {
                        return productItem(context);
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 30,
                      itemBuilder: (context, position) {
                        return productItemLandscape(context);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

Container sortFilterContainer(
    {BuildContext context, String text, IconData icon}) {
  return Container(
    padding: EdgeInsets.only(left: 7, right: 7),
    margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
    width: MediaQuery.of(context).size.width * 0.2,
    height: MediaQuery.of(context).size.width * 0.08,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: orangeColor.withOpacity(0.1),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Icon(
          icon,
          color: orangeColor,
          size: 18,
        ),
      ],
    ),
  );
}

Container roundText(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: orangeColor.withOpacity(0.1),
    ),
    child: Center(
      child: Text(
        'Hand Made',
        style: TextStyle(),
      ),
    ),
  );
}

Widget productItem(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
              boxShadow: [makeShadow()],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 10.0, start: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            maxLines: 3,
                            text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                text: 'Blue Shoes'),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: orangeColor,
                                  fontSize: 12,
                                ),
                                text: '290.00 EGP'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width * 0.20,
                    decoration: BoxDecoration(
                      color: Color(0xfffff2e5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: LanguageHelper.isEnglish
                            ? Radius.circular(80)
                            : Radius.circular(0),
                        bottomRight: LanguageHelper.isEnglish
                            ? Radius.circular(0)
                            : Radius.circular(80),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: 3, left: 8, right: 8, bottom: 5),
                height: MediaQuery.of(context).size.height * 0.060,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.grey[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(profile_image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold),
                                text: 'Bahaa Robert'),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 9,
                                ),
                                text: 'Beauty \& Personal Care'),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.add_to_photos_rounded,
                      size: 16,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bookmark_border_outlined,
                      size: 16,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -5,
          right: LanguageHelper.isEnglish ? 0 : null,
          left: LanguageHelper.isEnglish ? null : 0,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(dress_image),
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.13,
          ),
        ),
      ],
    ),
  );
}

Widget productItemLandscape(BuildContext context) {
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            boxShadow: [makeShadow()],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color(0xfffff2e5),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(profile_image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                    text: 'Bahaa Robert'),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 9,
                                    ),
                                    text: 'Beauty \& Personal Care'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          maxLines: 3,
                          text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              text: 'Blue Shoes'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RichText(
                          maxLines: 2,
                          text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: orangeColor,
                                fontSize: 12,
                              ),
                              text: '290.00 EGP'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_to_photos_rounded,
                      size: 18,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bookmark_border_outlined,
                      size: 18,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 2,
        left: LanguageHelper.isEnglish
            ? MediaQuery.of(context).size.width * 0.18
            : null,
        right: LanguageHelper.isEnglish
            ? null
            : MediaQuery.of(context).size.width * 0.18,
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage(dress_image),
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.13,
        ),
      ),
    ],
  );
}
