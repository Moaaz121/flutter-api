import 'dart:ui';

import 'package:bawabtalsharq/Screens/search/search_sort_dialog.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/searchBloc/search_bloc.dart';
import 'package:bawabtalsharq/bloc/searchBloc/search_event.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatefulWidget {
  final String q;
  final List<String> Categories;

  const SearchResult({Key key, this.q, this.Categories}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<bool> selections;
  bool _isSearchPressed = false;
  bool isGrid = true;
  ScrollController _resultScrollController = ScrollController();
  SearchBloc _bloc;

  @override
  void initState() {
    selections = [true, false];
    _bloc = new SearchBloc();
    _bloc
        .add(DoSearchEvent(widget.q, page: '0', categories: widget.Categories));
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: buildFloatingActionBtn(
          icon: Icons.arrow_upward,
          onPressed: () {
            _resultScrollController.animateTo(0.0,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }),
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
                    Navigator.pushNamed(context, ScreenRoutes.filterScreen);
                  },
                  child: sortFilterContainer(
                      context: context,
                      text: Languages.of(context).filter,
                      icon: Icons.filter_alt_rounded),
                ),
                GestureDetector(
                  onTap: () {
                    showAnimatedDialog(
                      context,
                      SortScreen(),
                    );
                  },
                  child: sortFilterContainer(
                      context: context,
                      text: Languages.of(context).sort,
                      icon: Icons.sort),
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
            BlocBuilder(
                bloc: _bloc,
                builder: (context, event) {
                  if (event is SearchLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (event is SearchLoadedState) {
                    return isGrid
                        ? Expanded(
                            child: GridView.builder(
                              controller: _resultScrollController,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: event.searchResponse.data.length,
                              itemBuilder: (context, position) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        ScreenRoutes.individualProduct);
                                  },
                                  child: productItem(context,
                                      datum:
                                          event.searchResponse.data[position]),
                                );
                              },
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              controller: _resultScrollController,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: event.searchResponse.data.length,
                              itemBuilder: (context, position) {
                                return GestureDetector(
                                  child: productItemLandscape(context,
                                      datum:
                                          event.searchResponse.data[position]),
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        ScreenRoutes.individualProduct);
                                  },
                                );
                              },
                            ),
                          );
                  } else {
                    return SizedBox();
                  }
                }),
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
