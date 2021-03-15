import 'dart:ui';

import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
Widget bottomAppBar(Function(int x) _selectionFunction, PageController controller,int currentPage){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
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
          BottomNavigationBarItem(icon: Image.asset(currentPage == 0 ? tabHomeS : tabHome, width: 30,height: 30), title: Padding(
            padding: const EdgeInsets.only(top: 7,),
            child: Text(Strings().home),
          ),),
          BottomNavigationBarItem(icon: Image.asset(currentPage == 1 ? tabFeatureS : tabFeature, width: 30,height: 30,), title: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(Strings().feature),
          )),
          BottomNavigationBarItem(icon: Image.asset(currentPage == 2 ? tabNotificationS : tabNotification, width: 30,height: 30,), title: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(Strings().notifications),
          )),
          BottomNavigationBarItem(icon: Image.asset(currentPage == 3 ? tabAccountS : tabAccount, width: 30,height: 30,), title: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(Strings().myAccount),
          )),
        ],
        onTap: _selectionFunction,
        // child: Container(
        //   height: 70,
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //   ),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       IconButton(
        //         iconSize: 42,
        //         padding: EdgeInsets.only(left: 28),
        //         icon:Image.asset(_pageSelected == 0 ? 'assets/images/tab_1s.png' : 'assets/images/tab_1.png',),
        //         onPressed: () {
        //           _selectionFunction(0);
        //           // widget.controller.animateToPage(0,duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
        //         },
        //       ),
        //       IconButton(
        //         iconSize: 42.0,
        //         padding: EdgeInsets.only(right: 28.0),
        //         icon:Image.asset(_pageSelected == 1  ? 'assets/images/tab_2s.png' : 'assets/images/tab_2.png'),
        //         onPressed: () {
        //             _selectionFunction(1);
        //             // widget.controller.animateToPage(1,duration: Duration(milliseconds: 1), curve: Curves.ease);
        //           // setState(() {
        //           //   widget.controller.animateToPage(1, duration: Duration(seconds: 500), curve: Curves.bounceIn);
        //           // });
        //         },
        //       ),
        //       IconButton(
        //         iconSize: 42.0,
        //         padding: EdgeInsets.only(left: 28.0),
        //         icon:Image.asset(_pageSelected == 2  ? 'assets/images/tab_3s.png' : 'assets/images/tab_3.png'),
        //         onPressed: () {
        //           _selectionFunction(2);
        //             // widget.controller.animateToPage(2,duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
        //           // setState(() {
        //           //   _tab2Toggled = _tab3Toggled;
        //           //   _tab1Toggled = _tab3Toggled;
        //           //   _tab4Toggled = _tab3Toggled;
        //           //   _tab3Toggled = !_tab3Toggled;
        //           //   widget.controller.animateToPage(2, duration: Duration(seconds: 500), curve: Curves.bounceIn);
        //           // });
        //         },
        //       ),
        //       IconButton(
        //         iconSize: 42.0,
        //         padding: EdgeInsets.only(right: 28.0),
        //         icon:Image.asset(_pageSelected == 3  ? 'assets/images/tab_4s.png' : 'assets/images/tab_4.png'),
        //         onPressed: () {
        //           _selectionFunction(3);
        //             // widget.controller.animateToPage(3, duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
        //           // setState(() {
        //           //   _tab2Toggled = _tab4Toggled;
        //           //   _tab3Toggled = _tab4Toggled;
        //           //   _tab1Toggled = _tab4Toggled;
        //           //   _tab4Toggled = !_tab4Toggled;
        //           //   widget.controller.animateToPage(3, duration: Duration(seconds: 500), curve: Curves.bounceIn);
        //           // });
        //         },
        //       )
        //     ],
        //   ),
        // ),
      ),
    ),
  );
}

Widget searchButton(Function _function){
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
                spreadRadius:2,
                offset: Offset(10,0)
            )
          ]
      ),
      child: FlatButton(
          splashColor: orangeColor.withOpacity(0.4),
          highlightColor: orangeShadowColor,
          onPressed: _function,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
              borderSide: BorderSide.none
          ),
          child : Row(
            children: [
              Text(Strings().search,
                style: TextStyle(
                  color: orangeColor,
                ),),
              SizedBox(width: 5,),
              Icon(Icons.search,color: orangeColor,)
            ],
          )),
    ),
  );
}

Widget chatButton(Function _function){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
        width: 45,
        height: 45,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: orangeShadowColor,
                    spreadRadius: 2,
                    blurRadius: 10
                )
              ]
          ),
          child: ClipOval(
            child: Material(
              shadowColor: orangeShadowColor,
              color: Colors.white,
              child: InkWell(
                splashColor: orangeColor.withOpacity(0.4),
                highlightColor: orangeShadowColor,
                child: Image.asset(chat,width: 55,height: 55,),
                onTap: () {},
              ),
            ),
          ),
        )
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
              sliderItem(context,slider1),
              sliderItem(context,slider2),
              sliderItem(context,slider3),
              sliderItem(context,slider2),
            ],
            options: CarouselOptions(
              onPageChanged: (int page, CarouselPageChangedReason reason){
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
            )
        ),
        sliderIndicator(position)
      ],
    );
  }
}


Widget sliderItem(BuildContext context,String image){
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    child: Image.asset(image,
      fit: BoxFit.fill,),
  );
}

Widget sliderIndicator(int page){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 65),
    child: AnimatedSmoothIndicator(
      activeIndex: page,
      count: 4,
      axisDirection: Axis.horizontal,
      effect:  ExpandingDotsEffect(
          spacing:  5.0,
          radius:  3.0,
          dotWidth:  12.0,
          dotHeight:  8.0,
          expansionFactor: 2,
          dotColor:  orangeShadowColor,
          activeDotColor:  orangeColor
      ),
    ),
  );
}

// end karem

// Start Asmaa

// end Asmaa

// Start Bahaa

// end Bahaa

// Start Mosdik
Widget supplierView(
    {Function onPress,
    Colors colors,
    String nameSupplier,
    String category,
    String years,
    AssetImage supplierImg,
    AssetImage icon}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      color: Colors.white38,
      height: 210.0,
      width: 150.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: supplierImg,
              height: 100.0,
              width: 120.0,
            ),
            Text(
              nameSupplier,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              category,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(image: icon),
                SizedBox(
                  width: 10.0,
                ),
                Text(years)
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
    String price}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(20.0),
      height: 200.0,
      width: 150.0,
      child: Stack(
        children: [
          Positioned(
              top: -50,
              left: -50,
              child: Image(
                image: AssetImage(productImage),
                height: 170,
                width: 170,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Row(
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
            padding: const EdgeInsets.only(top: 100.0, left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameProduct,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  nameCategory,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
        ],
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
    String price}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(20.0),
      height: 120.0,
      width: 230.0,
      child: Stack(
        children: [
          Positioned(
              bottom: -50,
              right: -50,
              child: Image(
                image: AssetImage(productImage),
                height: 170,
                width: 170,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 180.0),
            child: Row(
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameProduct,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  nameCategory,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget mostPopularCateg(
    {Function onPress,
    Color backgroundColor,
    AssetImage productImg,
    AssetImage iconAdd,
    AssetImage iconFavo,
    String nameProduct,
    String price}) {
  return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 120.0,
        width: 230.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(productImage),
              fit: BoxFit.fitWidth,

            ),
            
            // borderRadius: BorderRadius.circular(15.0),
            // color: backgroundColor,
          ),
          margin: EdgeInsets.all(20.0),

          // child: Stack(
          //   children: [
          //     Positioned(
          //         top: -50,
          //         right: -110,
          //         child: Image(
          //           image: AssetImage(productImage),
          //           height: 170,
          //           width: 170,
          //         )
          //     ),
          //   ],
          // )
      )
  );
}
// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam
