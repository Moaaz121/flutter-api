import 'dart:ui';

import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Widgets {
  call() {}
}

Widget textField(String hintText, Function callback,
    {bool isPassword = false,
    bool isDense = true,
    Function showPassword,
    bool isPhoneKeyboard = false,
    bool isClicable,
    TextEditingController controller,
    Icon icon,
    Color color,
    double fontSize = 16,
    Widget prefixIcon,
    int maxLines = 1,
    Function onChange}) {
  return Container(
    height: 50,
    child: TextFormField(
      enabled: isClicable,
      style: Constants().labelStyle(fontSize: 20),
      controller: controller,
      autofocus: false,
      maxLines: maxLines,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(20),
        ),
        // labelText: hintText,
        // errorStyle: Constants.fontLight(color: Colors.red),
        hintStyle: titleStyle(color: Colors.grey),
        // isDense: true,
        hintText: hintText,
        fillColor: color == null ? Color.fromRGBO(242, 244, 247, 1) : color,
        filled: true,
        // labelStyle: Constants.fontLight(color: Colors.grey, fontSize: fontSize),
        // helperStyle: Constants.fontLight(color: Colors.grey),
        // suffixIcon: isPassword
        //     ? IconButton(
        //         icon: Icon(Icons.remove_red_eye, color: Colors.grey),
        //         onPressed: showPassword)
        //     : icon == null ? null : icon,
        prefixIcon: prefixIcon != null
            ? Container(
                child: prefixIcon,
                height: 30,
                width: 30,
              )
            : null,
      ),
      textInputAction: TextInputAction.done,
      keyboardType: isPhoneKeyboard ? TextInputType.phone : TextInputType.text,
      obscureText: isPassword ? isDense : false,
      onSaved: (value) {
        callback(value);
      },
      validator: (String arg) {
        if (arg.length < 3)
          return 'Please Enter $hintText';
        else
          return null;
      },
      onChanged: (value) {
        onChange != null ? onChange(value) : print('');
      },
    ),
  );
}

Widget button(Function onPress, String labelText,
    {bool isFilledColor = true, Color color}) {
  return Container(
    width: double.infinity,
    height: 50,
    child: MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.white),
      ),
      disabledColor: Color.fromRGBO(144, 156, 179, 1),
      disabledTextColor: Colors.white,
      elevation: 0,
      color: color != null
          ? color
          : (isFilledColor ? defaultBackgroundColor : Colors.white),
      child: Text(
        labelText,
        style: TextStyle(
            color: isFilledColor ? Colors.white : defaultBackgroundColor,
            fontSize: 16,
            fontFamily: isFilledColor ? semiBoldFontFamily : mediumFontFamily),
      ),
    ),
  );
}

Widget buttonChangeState(String image, String labelText,
    {bool isFActive = true}) {
  return Container(
    width: double.infinity,
    height: 50,
    child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.white),
      ),
      disabledColor: isFActive ? defaultBackgroundColor : genderColor,
      elevation: 0,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Row(
        children: <Widget>[
          Text(
            labelText,
            style: TextStyle(
                color: isFActive ? Colors.white : greyColor,
                fontSize: 16,
                fontFamily: isFActive ? semiBoldFontFamily : mediumFontFamily),
          ),
          SizedBox(width: 20),
          Image.asset(
            image,
            color: isFActive ? Colors.white : greyHeader,
          ),
        ],
      ),
    ),
  );
}

Widget buttonWithIcon(String image, String labelText,
    {bool isBackground = true}) {
  return Container(
    width: double.infinity,
    height: 55,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isBackground ? 15 : 0),
        side:
            BorderSide(color: isBackground ? buttonBorderColor : Colors.white),
      ),
      color: Colors.white,
      elevation: isBackground ? 5 : 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(image),
          SizedBox(width: 20),
          Text(
            labelText,
            style: TextStyle(
                color:
                    isBackground ? defaultBackgroundColor : buttonBorderColor,
                fontSize: 16,
                fontFamily: semiBoldFontFamily),
          ),
        ],
      ),
    ),
  );
}

Widget cardChangeState(
    bool isEmpty, String activeImage, String inactiveImage, String labelText,
    {bool isFActive = true}) {
  return isEmpty
      ? Container(
          height: 120,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Card(
            elevation: 5,
            color: isFActive ? Color.fromRGBO(221, 231, 247, 1) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  isFActive ? activeImage : inactiveImage,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Text(
                  labelText,
                  style: TextStyle(
                      color: isFActive
                          ? Color.fromRGBO(33, 99, 206, 1)
                          : medicineColor,
                      fontSize: 16,
                      fontFamily:
                          isFActive ? semiBoldFontFamily : mediumFontFamily),
                ),
              ],
            ),
          ),
        )
      : Container();
}

Widget headerBg() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Login_background), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      // child: Image.asset(
      //   Login_shape,
      //   fit: BoxFit.contain,
      // ),
    ),
  );
}

showLoadingDialog(BuildContext context) async {
  Future.delayed(Duration(milliseconds: 10), () {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  });
}

// Start Karem
Widget bottomAppBar(Function(int x) _selectionFunction,
    PageController controller, int currentPage) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: BottomNavigationBar(
        backgroundColor: orangeColor,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        showUnselectedLabels: true,
        currentIndex: currentPage,
        selectedItemColor: Color(0xffffffff),
        unselectedItemColor: Color(0xccffffff),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(currentPage == 0 ? tabHomeS : tabHome,
                width: 30, height: 30),
            title: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(Strings().home()),
            ),
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentPage == 1 ? tabFeatureS : tabFeature,
                width: 30,
                height: 30,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(Strings().feature()),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentPage == 2 ? tabNotificationS : tabNotification,
                width: 30,
                height: 30,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(Strings().notifications()),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentPage == 3 ? tabAccountS : tabAccount,
                width: 30,
                height: 30,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(Strings().myAccount()),
              )),
        ],
        onTap: _selectionFunction,
      ),
    ),
  );
}

Widget searchButton(Function _function) {
  return SizedBox(
    height: 35,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: orangeShadowColor,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(10, 0))
          ]),
      child: FlatButton(
          splashColor: orangeColor.withOpacity(0.4),
          highlightColor: orangeShadowColor,
          onPressed: _function,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
              borderSide: BorderSide.none),
          child: Row(
            children: [
              Text(
                Strings().search(),
                style: TextStyle(
                  color: orangeColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.search,
                color: orangeColor,
              )
            ],
          )),
    ),
  );
}

Widget chatButton(Function _function) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      width: 45,
      height: 45,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: orangeShadowColor, spreadRadius: 2, blurRadius: 10)
        ]),
        child: ClipOval(
          child: Material(
            shadowColor: orangeShadowColor,
            color: Colors.white,
            child: InkWell(
              onTap: _function,
              splashColor: orangeColor.withOpacity(0.4),
              highlightColor: orangeShadowColor,
              child: Image.asset(
                chat,
                width: 55,
                height: 55,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class mainSlider extends StatefulWidget {
  @override
  _mainSliderState createState() => _mainSliderState();
}

class _mainSliderState extends State<mainSlider> {
  CarouselController control = CarouselController();
  int position = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            carouselController: control,
            items: [
              sliderItem(context, slider1),
              sliderItem(context, slider2),
              sliderItem(context, slider3),
              sliderItem(context, slider2),
            ],
            options: CarouselOptions(
              onPageChanged: (int page, CarouselPageChangedReason reason) {
                setState(() {
                  position = page;
                });
              },
              height: 170,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              pauseAutoPlayInFiniteScroll: true,
              pauseAutoPlayOnTouch: true,
              initialPage: 0,
              disableCenter: true,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
        sliderIndicator(position)
      ],
    );
  }
}

Widget sliderItem(BuildContext context, String image) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    child: Image.asset(
      image,
      fit: BoxFit.fill,
    ),
  );
}

Widget sliderIndicator(int page) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 55),
    child: AnimatedSmoothIndicator(
      activeIndex: page,
      count: 4,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
          spacing: 5.0,
          radius: 8.0,
          dotWidth: 8.0,
          dotHeight: 8.0,
          expansionFactor: 2.7,
          dotColor: orangeShadowColor,
          activeDotColor: orangeColor),
    ),
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

Widget ourGoldenSupplier() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ourGoldenSupplierHeader(),
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
              category:
                  position.isOdd ? 'Food & Beverages' : 'Agriculture Crops',
              nameSupplier:
                  position.isOdd ? 'Kareem Hassanien' : 'Mohamed Mosadik',
              supplierImg:
                  AssetImage(position.isOdd ? kareem_img : mosadaq_img),
              years: position.isOdd ? 3 : 5,
            );
          },
        ),
      )
    ],
  );
}

Widget ourGoldenSupplierHeader() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Strings().ourGoldenSupplier(),
          style: titlesStyle(),
        ),
        FlatButton(
          splashColor: orangeColor.withOpacity(0.4),
          highlightColor: orangeShadowColor,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings().more(),
                style: moreStyle(),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_rounded,
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
      mostPopularInHeader(),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 3 * .205,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 165,
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
                nameProduct: 'Pasta',
                nameCategory: 'Food',
                iconAdd: AssetImage(productIcon1),
                iconFavo: AssetImage(productIcon2),
                price: '\$\265.0',
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
            nameProduct: 'Pasta',
            nameCategory: 'Food',
            iconAdd: AssetImage(productIcon1),
            iconFavo: AssetImage(productIcon2),
            price: '\$\590.0',
            context: context),
        subMostPopularProduct(
            productImg: AssetImage(productImage),
            backgroundColor: pos == 0
                ? orangeColor.withOpacity(.3)
                : purpleColor.withOpacity(.3),
            onPress: () {},
            nameProduct: 'Pasta',
            nameCategory: 'Food',
            iconAdd: AssetImage(productIcon1),
            iconFavo: AssetImage(productIcon2),
            price: '\$\125.0',
            context: context),
      ],
    ),
  );
}

Widget mostPopularInHeader() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${Strings().mostPopularIn()}Egypt',
          style: titlesStyle(),
        ),
        FlatButton(
          splashColor: orangeColor.withOpacity(0.4),
          highlightColor: orangeShadowColor,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings().more(),
                style: moreStyle(),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_rounded,
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

// end karem

// Start Asmaa
AppBar appBarBuilder(
    {@required String title,
    @required Function onBackPressed,
    List<Widget> actions}) {
  return AppBar(
      centerTitle: true,
      actions: actions,
      toolbarHeight: 60.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      backgroundColor: defaultOrangeColor.withOpacity(0.8),
      title: buildText(title, 18.0,
          fontFamily: boldFontFamily,
          color: Colors.white,
          fontWeight: FontWeight.bold),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 20,
            color: defaultOrangeColor,
          ),
        ),
      ));
}

FloatingActionButton buildFloatingActionBtn(
    {@required IconData icon, @required Function onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed,
    child: Icon(
      icon,
      color: defaultOrangeColor,
    ),
    backgroundColor: Colors.white,
  );
}

Text buildText(String text, double fontSize,
    {Color color = Colors.black,
    textAlign = TextAlign.start,
    fontWeight = FontWeight.normal,
    String fontFamily}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
// end Asmaa

// Start Bahaa

// end Bahaa

// Start Mosdik

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
          '${Strings().mostPopularByCategories()}',
          style: titlesStyle(),
        ),
      ),
    ),
  );
}

Widget mostPopularByCategoryStable(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${Strings().allCategories()}',
              style: titlesStyle(),
            ),
            FlatButton(
              splashColor: orangeColor.withOpacity(0.4),
              highlightColor: orangeShadowColor,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings().seeAll(),
                    style: moreStyle(),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
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
    int years,
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
                  '$years YRS',
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
    AssetImage iconAdd,
    AssetImage iconFavo,
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
      margin: EdgeInsets.only(left: 20, right: 3, bottom: 3, top: 3),
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
              Positioned(
                  top: -40,
                  left: -50,
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
                    Image(
                      image: iconAdd,
                      width: 20.0,
                      height: 20.0,
                    ),
                    Image(
                      image: iconFavo,
                      width: 20.0,
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 3.0),
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
    AssetImage iconAdd,
    AssetImage iconFavo,
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
      height: 75,
      width: MediaQuery.of(context).size.width / 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                bottom: -50,
                right: -50,
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
                    size: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.bookmark_border_rounded,
                    size: MediaQuery.of(context).size.width * 0.045,
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
            nameProduct: position.isOdd ? 'Negrsgo' : 'koshary',
            productImg:
                AssetImage(position.isOdd ? productImage : productImage),
            price: '80.00',
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
                          Positioned(
                            top: -50,
                            left: position == 2 ? -50 : null,
                            right: position == 0 ? -50 : null,
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
                                              ? Alignment.topLeft
                                              : (position == 1
                                                  ? Alignment.topCenter
                                                  : Alignment.topRight),
                                          end: position == 2
                                              ? Alignment.bottomRight
                                              : (position == 1
                                                  ? Alignment.bottomCenter
                                                  : Alignment.bottomLeft),
                                          tileMode: TileMode.clamp)),
                                )),
                          ),
                        ]),
                  ),
                ),
              ),
              Positioned(
                  left: position == 2 ? -20 : null,
                  right: position == 0 ? -20 : null,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image(image: AssetImage(productImage)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 110.0),
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
                      height: 9.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            child: Text(
                              '$price\EGP',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.add_to_photos,
                          size: 14,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: 14,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ));
}


Widget notification(BuildContext context, ScrollController controller){
return
  Container(

    height: MediaQuery.of(context).size.height,
    child: ListView.builder(

      controller: controller,
      scrollDirection: Axis.vertical,
      itemCount: 15,

      itemBuilder: (context, position)


      {
        if (position == 14){
          return SizedBox(height: MediaQuery.of(context).size.height*0.10);
        }else{
          return Container(
            height: 80,
            margin: EdgeInsets.all(14),
            child: notificationItems(
              onPress: () {},
              title: position.isOdd
                  ? '50Off In Ultra boost All Terrain Ltd Shoes'
                  : 'check Out Quality Products From Global Star Suppliers',
              imageView: AssetImage(
                  position.isOdd ? productImage : productImage),
            ),
          );
        }

      },
    ),
  );

}


Widget notificationItems({
  Function onPress,
  String title,
  AssetImage imageView,
}) {
  return GestureDetector(
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white),
        child: Row(
          children: [
            Image(
              image: imageView,
              width: 90,
              height: 90,
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )),
            Icon(
              Icons.navigate_next,
              size: 30,
            )
          ],
        )),
  );
}
// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam
