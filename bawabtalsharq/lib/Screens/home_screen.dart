import 'package:auto_size_text/auto_size_text.dart';
import 'package:bawabtalsharq/Model/home_model.dart';
import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Screens/search/search_result_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/loader.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_bloc.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_event.dart';
import 'package:bawabtalsharq/bloc/homeBloc/home_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    // AnalyticsService().sendAnalyticsEvent(eventName: 'HomeScreenView', param: {
    //   'msg':
    //       'Home screen view; Search, Chat, All categories, RFQ, Technical Support, Our Golden Supplier, Most Popular in Egypt, Most Popular by Categories.',
    //   'bool': true,
    // });
    // AnalyticsService().setScreenName(name: 'HomeScreenView');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: _homeBloc,
        builder: (context, state) {
          print(state);
          if (state is HomeLoadingState) {
            // AnalyticsService().sendAnalyticsEvent(eventName: 'On_Load', param: {
            //   'msg': 'view home screen',
            //   'bool': true,
            // });
            return Center(
              child: LoadingLogo(),
            );
          } else if (state is HomeLoadedState) {
            print(state.homeResponse.data);
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3 - 25,
                              child: mainHeaderButton(context, () {
                                // AnalyticsService().sendAnalyticsEvent(
                                //     eventName: 'All_Categories',
                                //     param: {
                                //       'msg': 'Open categories',
                                //       'bool': true,
                                //     });
                                Navigator.pushNamed(
                                    context, ScreenRoutes.categoriesScreen);
                              }, Languages.of(context).allCategories,
                                  allCategories, blueColor.withOpacity(0.15)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3 - 25,
                              child: mainHeaderButton(context, () {
                                // AnalyticsService().sendAnalyticsEvent(
                                //     eventName: 'RQF',
                                //     param: {
                                //       'msg': 'Open categories',
                                //       'bool': true,
                                //     });
                                Navigator.pushNamed(
                                    context, ScreenRoutes.requestForQuotation);
                              }, Languages.of(context).requestForQ, requestForQ,
                                  const Color(0x26ff8b4b)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3 - 25,
                              child: mainHeaderButton(context, () {
                                // AnalyticsService().sendAnalyticsEvent(
                                //     eventName: 'Technical_Support',
                                //     param: {
                                //       'msg': 'View Technical Support',
                                //       'bool': true,
                                //     });
                                Navigator.pushNamed(
                                    context, ScreenRoutes.sendMessage);
                              },
                                  Languages.of(context).technical,
                                  technical_icon,
                                  purpleColor.withOpacity(0.15)),
                            ),
                          ],
                        ),
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
                            // AnalyticsService().sendAnalyticsEvent(
                            //     eventName: 'Search',
                            //     param: {'bool': true, 'msg': 'Open Search'});
                            Navigator.pushNamed(
                                context, ScreenRoutes.searchScreen);
                          }),
                          chatButton(() {
                            // AnalyticsService().sendAnalyticsEvent(
                            //     eventName: 'Chat',
                            //     param: {'bool': true, 'msg': 'Open Chat'});

                            Navigator.pushNamed(
                                context, ScreenRoutes.chatsScreen);
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (state is HomeNoInternetState) {
            return Center(
              child: Text(Languages.of(context).noNetwork),
            );
          } else {
            print(state);
            return Center(
              child: LoadingLogo(),
            );
          }
        },
      ),
    );
  }
}

Widget mostPopularByCategoryStable(
    BuildContext context, CategoryElement category) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.name,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff303030),
                letterSpacing: 0.192,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: const Color(0x297d7d7d),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new SearchResult(
                        searchQuery: new SearchQueryModel(
                          '',
                          Categories: [category.categoryId.toString()],
                        ),
                      ),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Languages.of(context).seeAll,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xff6d6d6d),
                      letterSpacing: 0.132,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          color: const Color(0x297d7d7d),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        )
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
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
        height: 190,
        child: Stack(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: orangeShadowColor.withOpacity(0.1),
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
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: orangeShadowColor.withOpacity(0.1),
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
            Positioned(
                top: 5,
                left: 5,
                child: mainMostPopularCategory(category, context)),
          ],
        ),
      ),
    ],
  );
}

Widget mainHeaderButton(BuildContext context, Function function, String title,
    String image, Color color) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white.withOpacity(0.87),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFE16036).withOpacity(0.2),
          offset: Offset(0, 1.0),
          blurRadius: 16.0,
        ),
      ],
    ),
    child: FlatButton(
        splashColor: orangeColor.withOpacity(0.4),
        highlightColor: orangeShadowColor,
        onPressed: function,
        padding: EdgeInsets.zero,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    image,
                    height: MediaQuery.of(context).size.width * .085,
                    width: MediaQuery.of(context).size.width * .085,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 9.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
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
          // AnalyticsService()
          //     .sendAnalyticsEvent(eventName: 'Our_Golden_Supplier', param: {
          //   'msg': 'View golden supplier',
          //   'bool': true,
          // });
          Navigator.pushNamed(context, ScreenRoutes.goldenSuppliers);
        },
      ),
      SizedBox(
        height: 160,
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
                Navigator.pushNamed(context, ScreenRoutes.supplierProfileScreen,
                    arguments: suppliers[position].id.toString());
                print(suppliers[position].id);
              },
              category: suppliers[position].category,
              nameSupplier: LanguageHelper.isEnglish
                  ? suppliers[position].title
                  : suppliers[position].title,
              supplierImg: suppliers[position].image,
              date: suppliers[position].articipate,
            );
          },
        ),
      )
    ],
  );
}

Widget ourGoldenSupplierHeader(BuildContext context, {Function onPress()}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 45, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Languages.of(context).ourGoldenSupplier,
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 18,
            color: const Color(0xff303030),
            letterSpacing: 0.24,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                color: const Color(0x297d7d7d),
                offset: Offset(0, 3),
                blurRadius: 6,
              )
            ],
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
        ),
        GestureDetector(
          onTap: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Languages.of(context).more,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 11,
                  color: const Color(0xff6d6d6d),
                  letterSpacing: 0.132,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: const Color(0x297d7d7d),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
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
  int pos = -1;
  return Column(
    children: [
      mostPopularInHeader(context),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            PositionedDirectional(
              start: MediaQuery.of(context).size.width / 3 * .4,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                    items: _cates.map((List<Datum> datums) {
                      pos = pos + 1;

                      return popularSlider(context, pos, datums);
                    }).toList(),
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.width * 0.488 > 174
                          ? MediaQuery.of(context).size.width * 0.488
                          : 174,
                      aspectRatio: 16 / 14,
                      viewportFraction: 0.52,
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
                  Navigator.pushNamed(context, ScreenRoutes.individualProduct,
                      arguments: category.data[0].id);
                },
                nameProduct: category.data[0].name,
                nameCategory: category.data[0].category,
                price: category.data[0].price,
                context: context),
          ],
        ),
      )
    ],
  );
}

Widget popularSlider(
  BuildContext context,
  int pos,
  List<Datum> datums,
) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: subMostPopularProduct(
              img: datums[0].image,
              backgroundColor: pos.isOdd
                  ? redColor.withOpacity(.3)
                  : blueColor.withOpacity(.3),
              onPress: () {
                Navigator.pushNamed(context, ScreenRoutes.individualProduct,
                    arguments: datums[0].id);
              },
              nameProduct: datums[0].name,
              nameCategory: datums[0].category,
              price: datums[0].price,
              context: context),
        ),
        Expanded(
          flex: 1,
          child: subMostPopularProduct(
              img: datums[pos].image,
              backgroundColor: pos.isOdd
                  ? orangeColor.withOpacity(.3)
                  : purpleColor.withOpacity(.3),
              onPress: () {
                Navigator.pushNamed(context, ScreenRoutes.individualProduct,
                    arguments: datums[1].id);
              },
              nameProduct: datums[1].name,
              nameCategory: datums[1].category,
              price: datums[1].price,
              context: context),
        ),
      ],
    ),
  );
}

Widget mostPopularInHeader(BuildContext context, {Function onPress()}) {
  return Align(
    alignment: AlignmentDirectional.centerStart,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        Languages.of(context).mostPopularIn + Languages.of(context).egypt,
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 19,
          color: const Color(0xff303030),
          letterSpacing: 0.24,
          fontWeight: FontWeight.w700,
          shadows: [
            Shadow(
              color: const Color(0x297d7d7d),
              offset: Offset(0, 3),
              blurRadius: 6,
            )
          ],
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.left,
      ),
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
    String date,
    String supplierImg}) {
  return GestureDetector(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 8),
      child: Container(
        width: 72.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 72,
                    width: 72,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: supplierImg,
                      placeholder: (context, url) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset(
                            placeHolder,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset(
                            placeHolder,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            AutoSizeText(
              nameSupplier,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 10,
                color: const Color(0xff303030),
                letterSpacing: 0.12,
                fontWeight: FontWeight.w700,
              ),
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),
            AutoSizeText(
              category,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 8.5,
                color: const Color(0xff848484),
                fontWeight: FontWeight.w600,
              ),
              minFontSize: 8.5,
              stepGranularity: 8.5,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 10,
                ),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  LanguageHelper.isEnglish
                      ? '${DateTime.now().year - DateTime.parse(date + ' 00:00:00.000').year} YRS'
                      : '${DateTime.now().year - DateTime.parse(date + ' 00:00:00.000').year} سنة ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 8,
                    color: const Color(0xff646464),
                    fontWeight: FontWeight.w600,
                  ),
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
      height: MediaQuery.of(context).size.width * 0.488 > 174
          ? MediaQuery.of(context).size.width * 0.488
          : 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      margin: EdgeInsetsDirectional.only(start: 20, end: 3, bottom: 3, top: 3),
      width: MediaQuery.of(context).size.width / 3 * 0.93,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0x06676767),
              offset: Offset(0, 1),
              blurRadius: 6,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              PositionedDirectional(
                top: -5,
                start: -5,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: CachedNetworkImage(
                    imageUrl: img,
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
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.bookmark_border,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: MediaQuery.of(context).size.width * 0.273, start: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      nameProduct,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: const Color(0xff303030),
                        letterSpacing: 0.14400000000000002,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 1),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      minFontSize: 12,
                      stepGranularity: 12,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText(
                      nameCategory,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 10,
                        color: const Color(0xff303030),
                        letterSpacing: 0.12,
                        fontWeight: FontWeight.w600,
                      ),
                      minFontSize: 10,
                      stepGranularity: 10,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 11.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        price,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xffe16036),
                          letterSpacing: 0.12,
                          fontWeight: FontWeight.w600,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.left,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(2.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            PositionedDirectional(
              bottom: -5,
              end: -5,
              child: Container(
                height: 53,
                width: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: img,
                  placeholder: (context, url) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        placeHolder,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        placeHolder,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.bookmark_border_rounded,
                    size: 19,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.365,
                        child: AutoSizeText(
                          nameProduct,
                          minFontSize: 10,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 12,
                            color: const Color(0xff303030),
                            letterSpacing: 0.14400000000000002,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 1),
                                blurRadius: 6,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: AutoSizeText(
                          nameCategory,
                          minFontSize: 10,
                          stepGranularity: 10,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 10,
                            color: const Color(0xff303030),
                            letterSpacing: 0.12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xffe16036),
                      letterSpacing: 0.132,
                      fontWeight: FontWeight.w600,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget mainMostPopularCategory(CategoryElement category, BuildContext context) {
  return SizedBox(
    height: 170,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: false,
      itemCount: category.data.length,
      itemBuilder: (context, position) {
        int pos = position;
        if (pos == 0 || pos % 5 == 0) {
          pos = 0;
        } else if (pos == 1 || pos % 4 == 0) {
          pos = 1;
        } else {
          pos = 2;
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child: mostPopularCateg(
            context: context,
            onPress: () {
              Navigator.pushNamed(context, ScreenRoutes.individualProduct,
                  arguments: category.data[position].id);
            },
            position: pos,
            backgroundColor:
                pos == 2 ? redColor : (pos == 1 ? orangeColor : blueColor),
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
              padding:
                  const EdgeInsets.only(left: 5, bottom: 15, right: 5, top: 30),
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
                          top: -40,
                          start: position == 0 ? -40 : null,
                          end: position == 2 ? -40 : null,
                          child: SizedBox(
                              height: 115,
                              width: 115,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: [
                                          backgroundColor.withOpacity(0.4),
                                          backgroundColor.withOpacity(0.35),
                                          backgroundColor.withOpacity(0.28),
                                          backgroundColor.withOpacity(0.0),
                                          backgroundColor.withOpacity(0.0),
                                        ],
                                        begin: position == 0
                                            ? AlignmentDirectional.topStart
                                            : (position == 1
                                                ? Alignment.topCenter
                                                : AlignmentDirectional.topEnd),
                                        end: position == 0
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
                start: position == 0 ? -5 : null,
                end: position == 2 ? -5 : null,
                child: SizedBox(
                  width: 70,
                  height: 60,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: productImg,
                    placeholder: (context, url) => Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        placeHolder,
                        fit: BoxFit.fill,
                      ),
                    ),
                    errorWidget: (context, url, error) => Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        placeHolder,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 12.0, top: 110.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameProduct,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
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
                        SizedBox(
                          width:
                              1.1 * MediaQuery.of(context).size.width * 0.020,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: MediaQuery.of(context).size.height * 0.020,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    ),
  );
}
