import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  mainSlider(),
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
                      mainHeaderButton(() {}, Languages.of(context).joinUs,
                          joinUs, purpleColor.withOpacity(0.15)),
                    ],
                  ),
                  ourGoldenSupplier(context),
                  mostPopularIn(context),
                  mostPopularByCategoryHeader(context),
                  listOfCateWidget()
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [searchButton(context, () {}), chatButton(() {})],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget mostPopularByCategoryHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
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
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 15.0),
        child: Text(
          Languages.of(context).mostPopularByCategories,
          style: titlesStyle(),
        ),
      ),
    ),
  );
}

Widget listOfCateWidget() {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    reverse: false,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, position) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child: mostPopularByCategoryStable(context, () {}));
    },
  );
}

Widget mostPopularByCategoryStable(BuildContext context, Function onPress()) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Languages.of(context).allCategories,
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
            Positioned(left: 5, child: mainMostPopularCategory()),
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

Widget ourGoldenSupplier(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ourGoldenSupplierHeader(context),
      SizedBox(
        height: 190,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 12),
          reverse: false,
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, position) {
            return supplierView(
              onPress: () {},
              category: LanguageHelper.isEnglish
                  ? position.isOdd
                      ? 'Food & Beverages'
                      : 'Agriculture Crops'
                  : position.isOdd
                      ? 'المحاصيل الزارعية'
                      : 'الخضروات والفاكهة',
              nameSupplier: LanguageHelper.isEnglish
                  ? position.isOdd
                      ? 'Kareem Hassanien'
                      : 'Mohamed Mosadik'
                  : position.isOdd
                      ? 'كريم حسانين'
                      : 'محمد مصدق',
              supplierImg:
                  AssetImage(position.isOdd ? kareem_img : mosadaq_img),
              years: LanguageHelper.isEnglish
                  ? position.isOdd
                      ? '3'
                      : '5'
                  : position.isOdd
                      ? '٣'
                      : '٥',
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

Widget mostPopularIn(BuildContext context) {
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
                    items: [
                      popularSlider(context, 0),
                      popularSlider(context, 1),
                      popularSlider(context, 0),
                      popularSlider(context, 1),
                    ],
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
                productImg: AssetImage(productImage),
                backgroundColor: yellowColor.withOpacity(.3),
                onPress: () {},
                nameProduct: LanguageHelper.isEnglish ? 'Pasta' : 'بيتزا',
                nameCategory: LanguageHelper.isEnglish ? 'Food' : 'الطعام',
                price: LanguageHelper.isEnglish ? '\$\265.0' : ' ٢٥٦ ج.م',
                context: context),
          ],
        ),
      )
    ],
  );
}

Widget popularSlider(BuildContext context, int pos) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        subMostPopularProduct(
            productImg: AssetImage(productImage),
            backgroundColor:
                pos == 0 ? redColor.withOpacity(.3) : blueColor.withOpacity(.3),
            onPress: () {},
            nameProduct: LanguageHelper.isEnglish ? 'Pasta' : 'بيتزا',
            nameCategory: LanguageHelper.isEnglish ? 'Food' : 'الطعام',
            price: LanguageHelper.isEnglish ? '\$\265.0' : ' ٢٥٦ ج.م',
            context: context),
        subMostPopularProduct(
            productImg: AssetImage(productImage),
            backgroundColor: pos == 0
                ? orangeColor.withOpacity(.3)
                : purpleColor.withOpacity(.3),
            onPress: () {},
            nameProduct: LanguageHelper.isEnglish ? 'Pasta' : 'بيتزا',
            nameCategory: LanguageHelper.isEnglish ? 'Food' : 'الطعام',
            price: LanguageHelper.isEnglish ? '\$\265.0' : ' ٢٥٦ ج.م',
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
    AssetImage supplierImg}) {
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
                child: Image(
                  image: supplierImg,
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
    AssetImage productImg,
    String nameProduct,
    String nameCategory,
    String price,
    BuildContext context}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
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
                  child: Image(
                    image: AssetImage(productImage),
                    height: 120,
                    width: 120,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.add_to_photos,
                        size: MediaQuery.of(context).size.height * 0.020,
                        color: Colors.black54),
                    Icon(
                      Icons.bookmark_border,
                      size: MediaQuery.of(context).size.height * 0.020,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: 70.0, start: 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameProduct,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 17,
                          fontWeight: FontWeight.bold),
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
                          fontWeight: FontWeight.bold,
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
    AssetImage productImg,
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
      margin: EdgeInsets.all(3.0),
      width: MediaQuery.of(context).size.width / 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            PositionedDirectional(
                bottom: -50,
                end: -50,
                child: Image(
                  image: AssetImage(productImage),
                  height: 130,
                  width: 130,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.add_to_photos_rounded,
                    size: MediaQuery.of(context).size.height * 0.020,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5,
                  ),
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
                  Text(
                    nameProduct,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    nameCategory,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).textScaleFactor * 13),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
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

Widget mainMostPopularCategory() {
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
            nameProduct: LanguageHelper.isEnglish
                ? position.isOdd
                    ? 'Negrsgo'
                    : 'koshary'
                : position.isOdd
                    ? 'نجرسكو'
                    : 'كشري',
            productImg:
                AssetImage(position.isOdd ? productImage : productImage),
            price: LanguageHelper.isEnglish ? '80.00' : '٨٠',
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
    AssetImage productImg,
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
                  start: position == 2 ? -20 : null,
                  end: position == 0 ? -20 : null,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image(image: AssetImage(productImage)),
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
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            child: Text(
                              LanguageHelper.isEnglish
                                  ? '$price\EGP'
                                  : '$price \ج.م',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:
                              1.1 * MediaQuery.of(context).size.width * 0.020,
                        ),
                        Icon(
                          Icons.add_to_photos,
                          size: MediaQuery.of(context).size.height * 0.020,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: MediaQuery.of(context).size.height * 0.020,
                          color: Colors.black54,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ));
}
