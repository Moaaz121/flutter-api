import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bawabtalsharq/Model/home_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_bloc.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_event.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: _homeBloc,
        builder: (context, state) {
          print(state);
          if (state is HomeLoadingState) {
            print('Loading');
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            print(state.homeResponse.data);
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      mainSlider(
                        imgs: state.homeResponse.data.slider,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          mainHeaderButton(() {
                            Navigator.pushNamed(
                                context, ScreenRoutes.categoriesScreen);
                          }, Languages.of(context).allCategories, allCategories,
                              blueColor.withOpacity(0.15)),
                          mainHeaderButton(() {
                            Navigator.pushNamed(
                                context, ScreenRoutes.requestForQuotation);
                          }, Languages.of(context).requestForQ, requestForQ,
                              orangeColor.withOpacity(0.15)),
                          mainHeaderButton(
                              () {},
                              Languages.of(context).technical,
                              technical_icon,
                              purpleColor.withOpacity(0.15)),
                        ],
                      ),
                      ourGoldenSupplier(
                          context, state.homeResponse.data.suppliers),
                      mostPopularIn(
                          context, state.homeResponse.data.categories.first),
                      mostPopularByCategoryHeader(context),
                      listOfCateWidget(state.homeResponse.data.categories)
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          searchButton(context, () {
                            Navigator.pushNamed(
                                context, ScreenRoutes.searchScreen);
                          }),
                          chatButton(() {})
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            print(state);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget mostPopularByCategoryStable(
    BuildContext context, Function onPress, CategoryElement category) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.name,
              style: titlesStyle(),
            ),
            GestureDetector(
              onTap: onPress,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Languages.of(context).seeAll,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 175,
        child: Stack(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                  ),
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: -1.0,
                      blurRadius: 8.0,
                      offset: Offset(0, 8)),
                ],
              ),
            ),
            Positioned(
              top: 135,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                    ),
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1.0,
                        blurRadius: 8.0,
                        offset: Offset(0, -8)),
                  ],
                ),
              ),
            ),
            Positioned(left: 5, child: mainMostPopularCategory(category)),
          ],
        ),
      ),
    ],
  );
}

Widget mainHeaderButton(
    Function function, String title, String image, Color color) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
      BoxShadow(color: orangeShadowColor, blurRadius: 10, spreadRadius: 1),
    ]),
    child: FlatButton(
        splashColor: orangeColor.withOpacity(0.4),
        highlightColor: orangeShadowColor,
        onPressed: function,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    image,
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: mainHeaderTitleStyle(),
              ),
            ],
          ),
        )),
  );
}

Widget ourGoldenSupplier(BuildContext context, List<Supplier> suppliers) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ourGoldenSupplierHeader(
        context,
        onPress: () {
          Navigator.pushNamed(context, ScreenRoutes.goldenSuppliers);
        },
      ),
      SizedBox(
        height: 190,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 12),
          reverse: false,
          scrollDirection: Axis.horizontal,
          itemCount: suppliers.length,
          itemBuilder: (context, position) {
            return supplierView(
              onPress: () {
                Navigator.pushNamed(
                    context, ScreenRoutes.supplierProfileScreen);
              },
              category: LanguageHelper.isEnglish
                  ? suppliers[position].articipate
                  : suppliers[position].articipate,
              nameSupplier: LanguageHelper.isEnglish
                  ? suppliers[position].title
                  : suppliers[position].title,
              supplierImg: suppliers[position].image,
              years: LanguageHelper.isEnglish ? '3' : '٥',
            );
          },
        ),
      )
    ],
  );
}

Widget ourGoldenSupplierHeader(BuildContext context, {Function onPress()}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Languages.of(context).ourGoldenSupplier,
          style: titlesStyle(),
        ),
        GestureDetector(
          onTap: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Languages.of(context).more,
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
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget mostPopularIn(BuildContext context, CategoryElement category) {
  List<List<Datum>> _cates = new List<List<Datum>>();
  for (int x = 1; x < category.data.length / 2; x++) {
    List<Datum> _listSingle = List<Datum>();
    _listSingle.add(category.data[x * 2]);
    if (category.data.length >= x * 2 + 2) {
      _listSingle.add(category.data[x * 2 + 1]);
    }
    _cates.add(_listSingle);
  }
  return Column(
    children: [
      mostPopularInHeader(context),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PositionedDirectional(
              start: MediaQuery.of(context).size.width / 3 * .205,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                    items: _cates
                        .map(
                          (List<Datum> datums) => popularSlider(
                              context, Random().nextInt(2), datums),
                        )
                        .toList(),
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.45,
                      pauseAutoPlayInFiniteScroll: true,
                      pauseAutoPlayOnTouch: true,
                      initialPage: 0,
                      disableCenter: true,
                      enableInfiniteScroll: true,
                      reverse: true,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
              ),
            ),
            mainMostPopularProduct(
                img: category.data[0].image,
                backgroundColor: yellowColor.withOpacity(.3),
                onPress: () {
                  Navigator.pushNamed(context, ScreenRoutes.individualProduct);
                },
                nameProduct: category.data[0].name,
                nameCategory: category.data[0].category.index.toString(),
                price: category.data[0].price,
                context: context),
          ],
        ),
      )
    ],
  );
}

Widget popularSlider(BuildContext context, int pos, List<Datum> datums) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        subMostPopularProduct(
            img: datums[0].image,
            backgroundColor:
                pos == 0 ? redColor.withOpacity(.3) : blueColor.withOpacity(.3),
            onPress: () {},
            nameProduct: datums[0].name,
            nameCategory: datums[0].category.index.toString(),
            price: datums[0].price,
            context: context),
        subMostPopularProduct(
            img: datums[0].image,
            backgroundColor: pos == 0
                ? orangeColor.withOpacity(.3)
                : purpleColor.withOpacity(.3),
            onPress: () {},
            nameProduct: datums[1].name,
            nameCategory: datums[1].category.index.toString(),
            price: datums[1].price,
            context: context),
      ],
    ),
  );
}

Widget mostPopularInHeader(BuildContext context, {Function onPress()}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Languages.of(context).mostPopularIn + Languages.of(context).egypt,
          style: titlesStyle(),
        ),
        GestureDetector(
          onTap: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Languages.of(context).more,
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
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget mostPopularByCategoryAfterProd() {
  return Container(
    height: 50,
    width: 430,
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(1),
              Colors.black.withOpacity(0.3)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.repeated),
        color: Colors.black12,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(20),
          left: Radius.circular(20),
        )),
  );
}

Widget supplierView(
    {Function onPress,
    Colors colors,
    String nameSupplier,
    String category,
    String years,
    String supplierImg}) {
  return GestureDetector(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 8),
      child: Container(
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  supplierImg,
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              nameSupplier,
              style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              category,
              style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 13,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  LanguageHelper.isEnglish ? '$years YRS' : '$years سنة ',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget mainMostPopularProduct(
    {Function onPress,
    Color backgroundColor,
    String img,
    String nameProduct,
    String nameCategory,
    String price,
    BuildContext context}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      margin: EdgeInsetsDirectional.only(start: 20, end: 3, bottom: 3, top: 3),
      width: MediaQuery.of(context).size.width / 3 * 0.85,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              PositionedDirectional(
                  top: -40,
                  start: -50,
                  child: Image.network(
                    img,
                    height: 120,
                    width: 120,
                  )),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.bookmark_border,
                    size: MediaQuery.of(context).size.height * 0.020,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: 70.0, start: 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      nameProduct,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      minFontSize: 10,
                      stepGranularity: 10,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      nameCategory,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 15),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        price,
                        style: TextStyle(
                          color: orangeColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).textScaleFactor * 15,
                        ),
                      ),
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

Widget subMostPopularProduct(
    {Function onPress,
    Color backgroundColor,
    String img,
    String nameProduct,
    String nameCategory,
    String price,
    BuildContext context}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(3.0),
      width: MediaQuery.of(context).size.width / 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            PositionedDirectional(
                bottom: -5,
                end: -5,
                child: Image.network(
                  img,
                  height: 55,
                  width: 55,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.bookmark_border_rounded,
                    size: MediaQuery.of(context).size.height * 0.020,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: AutoSizeText(
                      nameProduct,
                      minFontSize: 10,
                      stepGranularity: 10,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 50,
                    child: AutoSizeText(
                      nameCategory,
                      minFontSize: 10,
                      stepGranularity: 10,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).textScaleFactor * 13,
                    ),
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

Widget mainMostPopularCategory(CategoryElement category) {
  return SizedBox(
    height: 170,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, position) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child: mostPopularCateg(
            context: context,
            onPress: () {},
            position: position,
            backgroundColor: position == 2
                ? redColor
                : (position == 1 ? orangeColor : blueColor),
            nameProduct: category.data[position].name,
            productImg: category.data[position].image,
            price: category.data[position].price,
          ),
        );
      },
    ),
  );
}

Widget mostPopularCateg(
    {Function onPress,
    int position,
    Color backgroundColor,
    String productImg,
    String nameProduct,
    String price,
    BuildContext context}) {
  return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Stack(
            alignment: position == 2
                ? AlignmentDirectional.topEnd
                : (position == 1
                    ? AlignmentDirectional.topCenter
                    : AlignmentDirectional.topStart),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, bottom: 15, right: 5, top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 0.1,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                        alignment: position == 2
                            ? AlignmentDirectional.centerEnd
                            : (position == 1
                                ? AlignmentDirectional.center
                                : AlignmentDirectional.centerStart),
                        children: [
                          PositionedDirectional(
                            top: -50,
                            start: position == 2 ? -50 : null,
                            end: position == 0 ? -50 : null,
                            child: SizedBox(
                                height: 115,
                                width: 115,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [
                                            backgroundColor.withOpacity(0.5),
                                            backgroundColor.withOpacity(0.0)
                                          ],
                                          begin: position == 2
                                              ? AlignmentDirectional.topStart
                                              : (position == 1
                                                  ? Alignment.topCenter
                                                  : AlignmentDirectional
                                                      .topEnd),
                                          end: position == 2
                                              ? AlignmentDirectional.bottomEnd
                                              : (position == 1
                                                  ? Alignment.bottomCenter
                                                  : AlignmentDirectional
                                                      .bottomStart),
                                          tileMode: TileMode.clamp)),
                                )),
                          ),
                        ]),
                  ),
                ),
              ),
              PositionedDirectional(
                  top: 7,
                  start: position == 2 ? -5 : null,
                  end: position == 0 ? -5 : null,
                  child: SizedBox(
                    width: 70,
                    height: 60,
                    child: Image.network(productImg),
                  )),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 12.0, top: 110.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameProduct,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              LanguageHelper.isEnglish ? '$price' : '$price',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                          Icon(
                            Icons.bookmark_border,
                            size: MediaQuery.of(context).size.height * 0.020,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ));
}
