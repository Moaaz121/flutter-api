import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
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
    PageController controller, int currentPage, BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
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
                child: Text(
                  Languages.of(context).home,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.014,
                  ),
                ),
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
                  child: Text(
                    Languages.of(context).feature,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.014,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  currentPage == 2 ? tabNotificationS : tabNotification,
                  width: 30,
                  height: 30,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    Languages.of(context).notification,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.014,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  currentPage == 3 ? tabAccountS : tabAccount,
                  width: 30,
                  height: 30,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    Languages.of(context).myAccount,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.014,
                    ),
                  ),
                )),
          ],
          onTap: _selectionFunction,
        ),
      ),
    ),
  );
}

Widget searchButton(BuildContext context, Function _function) {
  return SizedBox(
    height: 35,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.horizontal(end: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: orangeShadowColor,
              blurRadius: 5,
              spreadRadius: 2,
            )
          ]),
      child: FlatButton(
          splashColor: orangeColor.withOpacity(0.4),
          highlightColor: orangeShadowColor,
          onPressed: _function,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                  right: LanguageHelper.isEnglish
                      ? Radius.circular(15)
                      : Radius.zero,
                  left: !LanguageHelper.isEnglish
                      ? Radius.circular(15)
                      : Radius.zero),
              borderSide: BorderSide.none),
          child: Row(
            children: [
              Text(
                Languages.of(context).search,
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
            LanguageHelper.isEnglish
                ? Icons.keyboard_arrow_left_outlined
                : Icons.keyboard_arrow_right_outlined,
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
    fontStyle: FontStyle.normal,
    letterSpacing: 0.192,
    String fontFamily}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      decoration: TextDecoration.none,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.192,
      color: color,
    ),
  );
}

BoxShadow makeShadow() {
  return BoxShadow(
    color: Color(0xFF727272).withOpacity(0.2),
    blurRadius: 6,
    offset: Offset(0, 2),
    spreadRadius: 0,
  );
}
// end Asmaa

// Start Bahaa
void showLanguagesDialog(BuildContext context) {
  int selectedLanguageIndex = LanguageHelper.isEnglish ? 0 : 1;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: languagesArr.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  LanguageHelper.changeLanguage(
                      context, index == 0 ? 'en' : 'ar');
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: buildText(languagesArr[index], 15,
                              fontFamily: mediumFontFamily,
                              fontWeight: FontWeight.w600)),
                      selectedLanguageIndex == index
                          ? Image.asset(
                              checkBox,
                              width: 40,
                              height: 40,
                            )
                          : Text(''),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                height: 1,
                thickness: 1,
              ),
            ),
          ),
        ),
      );
    },
  );
}

// end Bahaa

// Start Mosdik

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam
TextField customTextField(
    {String label,
    IconButton rightBtn,
    IconData leftIcon,
    bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    decoration: InputDecoration(
        //hintText: 'username',
        prefixIcon: Icon(
          leftIcon,
          color: Colors.grey,
        ),
        suffixIcon: rightBtn,
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: 'Roboto-Thin.ttf', fontWeight: FontWeight.w200),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
  );
}

// end Islam
