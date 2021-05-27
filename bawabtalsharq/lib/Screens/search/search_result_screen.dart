import 'dart:ui';

import 'package:bawabtalsharq/Model/checkPointFliter.dart';
import 'package:bawabtalsharq/Model/filter_model.dart';
import 'package:bawabtalsharq/Model/mainCategoryModel.dart';
import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Screens/individual_product_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/filterBloc/filter_bloc.dart';
import 'package:bawabtalsharq/bloc/notificationsBloc/notifications_bloc.dart';
import 'package:bawabtalsharq/bloc/searchBloc/search_bloc.dart';
import 'package:bawabtalsharq/bloc/searchBloc/search_event.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

enum ArrangeCharacter { ASC, DESC }

enum PopularityCharacter {
  popular,
  date,
  bestRating,
  price,
}

ArrangeCharacter _arrangeCharacter = ArrangeCharacter.ASC;
PopularityCharacter _popularCharacter = PopularityCharacter.popular;

SearchQueryModel searchQuery;
SearchBloc _bloc;

Function blockEvent() {
  print(_popularCharacter.toString());
  _bloc.add(DoSearchEvent(searchQuery));
}

class SearchResult extends StatefulWidget {
  final List<CategoryModel> subCategories;
  List<String> Categories = List<String>();
  SearchQueryModel searchQuery;

  SearchResult({Key key, this.subCategories, this.searchQuery, this.Categories})
      : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<bool> selections;
  bool _isSearchPressed = false;
  bool isGrid = true;
  ScrollController _resultScrollController = ScrollController();

  @override
  void initState() {
    selections = [true, false];
    _bloc = new SearchBloc();
    searchQuery = widget.searchQuery;
    blockEvent();
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
                duration: Duration(milliseconds: 400), curve: Curves.easeOut);
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
                            Icons.menu_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            widget.subCategories != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
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
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            BlocBuilder(
                bloc: _bloc,
                builder: (context, event) {
                  if (event is SearchLoadingState) {
                    return Expanded(
                      child: SizedBox(
                        child: Center(
                          child: progressBar(),
                        ),
                      ),
                    );
                  } else if (event is SearchLoadedState) {
                    if (event.searchResponse.code != 200) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            event.searchResponse.msg,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                              color: Color(0xff303030),
                              letterSpacing: 0.18,
                              fontWeight: FontWeight.w600,
                              height: 0.07,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return isGrid
                          ? Expanded(
                              child: GridView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                controller: _resultScrollController,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 0),
                                itemCount: event.searchResponse.products.length,
                                itemBuilder: (context, position) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  IndividualProduct(event
                                                      .searchResponse
                                                      .products[position]
                                                      .productId)));
                                    },
                                    child: productItem(context,
                                        product: event
                                            .searchResponse.products[position]),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                controller: _resultScrollController,
                                scrollDirection: Axis.vertical,
                                itemCount: event.searchResponse.products.length,
                                itemBuilder: (context, position) {
                                  return GestureDetector(
                                    child: productItemLandscape(context,
                                        product: event
                                            .searchResponse.products[position]),
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          ScreenRoutes.individualProduct);
                                    },
                                  );
                                },
                              ),
                            );
                    }
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
        'hand made',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14.0,
          color: Colors.white,
          letterSpacing: 0.168,
        ),
      ),
    ),
  );
}

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.grey,
          toggleableActiveColor: orangeColor,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: LanguageHelper.isEnglish
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 30, right: 30, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        blockEvent();
                        Navigator.pop(context);
                      },
                      child: buildText(
                        Languages.of(context).done,
                        14,
                        color: defaultOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: buildText(Languages.of(context).arrange, 18,
                      color: defaultOrangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<ArrangeCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).ascending),
                      value: ArrangeCharacter.ASC,
                      groupValue: _arrangeCharacter,
                      onChanged: (ArrangeCharacter value) {
                        setState(() {
                          _arrangeCharacter = value;
                          searchQuery.sort = 'ASC';
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 170,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<ArrangeCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).descending),
                      value: ArrangeCharacter.DESC,
                      groupValue: _arrangeCharacter,
                      onChanged: (ArrangeCharacter value) {
                        setState(() {
                          _arrangeCharacter = value;
                          searchQuery.sort = 'DESC';
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: buildText(Languages.of(context).popularity, 18,
                      color: defaultOrangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                  width: 170,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).mostPop),
                      value: PopularityCharacter.popular,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                          searchQuery.sortBy = 'popular';
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).newIn),
                      value: PopularityCharacter.date,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                          searchQuery.sortBy = 'date';
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).bestRating),
                      value: PopularityCharacter.bestRating,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                          searchQuery.sortBy = '';
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).lowestPrice),
                      value: PopularityCharacter.price,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                          searchQuery.sortBy = value.toString();
                        });
                      },
                    ),
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

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _checked1 = false;
  bool _checked2 = false;
  FilterBloc _bloc = FilterBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(DoFilterEvent());
  }

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
        child: BlocBuilder<FilterBloc, FilterState>(
            bloc: _bloc,
            builder: (context, snapshot) {
              var errorMessage = '';
              if (snapshot is LoadingState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: progressBar(),
                  ),
                );
              } else if (snapshot is FilterErrorState) {
                errorMessage = snapshot.message;
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 15.0,
                        color: Color(0xff303030),
                        letterSpacing: 0.18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              } else if (snapshot is FilterLoadedState) {
                if (snapshot.filterResponse.code != 200) {
                  errorMessage = snapshot.filterResponse.msg;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Text(
                        errorMessage,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 15.0,
                          color: Color(0xff303030),
                          letterSpacing: 0.18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                } else {
                  return StatefulBuilder(builder: (context, setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textTitle(context, Languages.of(context).category, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchCategories(
                                        cates: snapshot
                                            .filterResponse.data.categories,
                                      )));
                        }, Languages.of(context).seeAll, Colors.black,
                            icon: Icons.arrow_forward),
                        listOfCate(snapshot.filterResponse.data.categories),
                        titleText(Languages.of(context).expressShipping),
                        listOfExpressShipping(
                            snapshot.filterResponse.data.shipping),
                        buildSizedBox(10),
                        lineDivider(),
                        titleText(Languages.of(context).shippedFrom),
                        listOfExpressShippedFrom(
                            snapshot.filterResponse.data.shipping),
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
                        listOfBrands(snapshot.filterResponse.data.suppliers),
                        titleText(Languages.of(context).price),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            textFiledPrice(context, Languages.of(context).from,
                                width: 0.4),
                            textFiledPrice(context, Languages.of(context).to,
                                width: 0.4),
                          ],
                        ),
                        buildSizedBox(25),
                        titleText(Languages.of(context).discount),
                        list4OfCheckBox(),
                        lineDivider(),
                        textTitle(context, Languages.of(context).sizes, () {
                          Navigator.pushNamed(context, ScreenRoutes.listFilter);
                        }, 'X, XL', Colors.deepOrangeAccent,
                            icon: Icons.arrow_forward_ios),
                        buildSizedBox(25),
                        lineDivider(),
                        textTitle(context, Languages.of(context).colors, () {
                          Navigator.pushNamed(
                              context, ScreenRoutes.colorFilterScreen);
                        }, 'Orange', Colors.deepOrange,
                            icon: Icons.arrow_forward_ios),
                        buildSizedBox(25),
                        lineDivider(),
                        textTitle(context, Languages.of(context).gender, () {
                          Navigator.pushNamed(context, ScreenRoutes.listFilter);
                        }, 'Male', Colors.deepOrange,
                            icon: Icons.arrow_forward_ios),
                      ],
                    );
                  });
                }
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 15.0,
                        color: Color(0xff303030),
                        letterSpacing: 0.18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height);

  SizedBox buildCheckbox(int pos, {String text = '', double size = 14}) {
    return SizedBox(
      height: 40,
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
    return SizedBox(
      height: 40,
      child: Container(
        child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 14.0,
              color: Color(0xff646464),
              letterSpacing: 0.168,
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

  Widget listOfExpressShipping(List<Shipping> shippings) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: shippings.length,
        itemBuilder: (context, position) {
          return checkboxBuilder(
            text: shippings[position].name,
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

  Widget listOfExpressShippedFrom(List<Shipping> shippings) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: shippings.length,
        itemBuilder: (context, position) {
          return checkboxBuilder(
            text: shippings[position].shippingId,
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

  Widget listOfCate(List<Category> categries) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 55,
          child:
              StatefulBuilder(builder: (BuildContext context, StateSetter ss) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 35),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemCount: categries.length < 20 ? categries.length : 20,
              itemBuilder: (context, position) {
                return Container(
                  width: 38.0,
                  height: 37.0,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  decoration: BoxDecoration(
                    border: searchQuery.Categories != null &&
                            searchQuery.Categories.contains(
                                categries[position].categoryId)
                        ? Border.all(color: orangeColor, width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: Offset(0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                      onTap: () {
                        ss(() {
                          if (searchQuery.Categories.contains(
                              categries[position].categoryId)) {
                            searchQuery.Categories.remove(
                                categries[position].categoryId);
                          } else {
                            searchQuery.Categories.add(
                                categries[position].categoryId);
                          }
                        });
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        child: CachedNetworkImage(
                          imageUrl: categries[position].image,
                          placeholder: (context, url) => Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Image.asset(placeHolder),
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset(placeHolder),
                        ),
                      )),
                );
              },
            );
          }),
        ),
        SizedBox(
          height: 15,
        ),
        lineDivider(),
      ],
    );
  }

  Widget listOfBrands(List<Supplier> brands) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 55,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 35),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, position) {
              return Container(
                  width: 38.0,
                  height: 37.0,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: Offset(0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Container(
                    height: 48,
                    width: 48,
                    child: CachedNetworkImage(
                      imageUrl: brands[position].logo,
                      placeholder: (context, url) => Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          child: Image.asset(placeHolder),
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(placeHolder),
                    ),
                  ));
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
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15.0,
              color: Color(0xff303030),
              letterSpacing: 0.18,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onPress,
            child: Row(
              children: [
                Text(
                  centerText,
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 13.0,
                    color: Color(0xff646464),
                    letterSpacing: 0.156,
                  ),
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
      padding: const EdgeInsetsDirectional.only(start: 37.9),
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
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 3),
        itemBuilder: (context, _i) => Icon(
          Icons.star_border_rounded,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}

class SearchCategories extends StatefulWidget {
  final List<Category> cates;

  const SearchCategories({Key key, this.cates}) : super(key: key);

  @override
  _SearchCategoriesState createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  bool _isSearchPressed = false;
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
              title: Languages.of(context).categories,
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
      body: ListView.builder(
          itemCount: widget.cates.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (searchQuery.Categories.contains(widget.cates[position])) {
                    searchQuery.Categories.add(
                        widget.cates[position].categoryId);
                  } else {
                    searchQuery.Categories.remove(
                        widget.cates[position].categoryId);
                  }
                });
              },
              child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                      value: searchQuery.Categories.contains(
                          widget.cates[position].categoryId),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (searchQuery.Categories.contains(
                              widget.cates[position].categoryId)) {
                            searchQuery.Categories.remove(
                                widget.cates[position].categoryId);
                          } else {
                            searchQuery.Categories.add(
                                widget.cates[position].categoryId);
                          }
                        });
                      },
                      activeColor: defaultOrangeColor,
                      checkColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [makeShadow()],
                        ),
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          height: 58,
                          width: 58,
                          child: CachedNetworkImage(
                            imageUrl: widget.cates[position].image,
                            placeholder: (context, url) => Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                child: Image.asset(placeHolder),
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset(placeHolder),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: buildText(
                        widget.cates[position].category,
                        16,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
