import 'dart:ui';

import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:bawabtalsharq/Model/currency_model.dart';
import 'package:bawabtalsharq/Model/history_model.dart';
import 'package:bawabtalsharq/Model/home_model.dart';
import 'package:bawabtalsharq/Model/search_model.dart' as SearchItem;
import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/countryBloc/country_bloc.dart';
import 'package:bawabtalsharq/bloc/countryBloc/country_event.dart';
import 'package:bawabtalsharq/bloc/countryBloc/country_state.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_bloc.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_event.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_state.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_bloc.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_event.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_state.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  width: 23, height: 23),
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
                  currentPage == 1 ? superior_fill_icon : superior_icon,
                  width: 23,
                  height: 23,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    Languages.of(context).superior,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.014,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  currentPage == 2 ? tabNotificationS : tabNotification,
                  width: 23,
                  height: 23,
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
                  width: 23,
                  height: 23,
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
              ),
            ],
          )),
    ),
  );
}

Widget chatButton(Function _function,
    {double size = 45, double sizeIcon = 10, double padOfIcon = 16}) {
  return Padding(
    padding: EdgeInsets.all(padOfIcon),
    child: SizedBox(
      width: size,
      height: size,
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
              child: Padding(
                padding: EdgeInsets.all(sizeIcon),
                child: Image.asset(
                  chat,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class mainSlider extends StatefulWidget {
  final List<String> imgs;

  const mainSlider({Key key, this.imgs}) : super(key: key);
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
            items: widget.imgs
                .map((String img) => sliderItem(context, img))
                .toList(),
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
        sliderIndicator(position, count: widget.imgs.length)
      ],
    );
  }
}

Widget sliderItem(BuildContext context, String image) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    child: Image.network(
      image,
      fit: BoxFit.fill,
    ),
  );
}

Widget sliderIndicator(int page, {bool noPadding = false, int count = 4}) {
  return Padding(
    padding: noPadding
        ? const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
        : const EdgeInsets.symmetric(vertical: 16, horizontal: 55),
    child: AnimatedSmoothIndicator(
      activeIndex: page,
      count: count,
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
      backgroundColor: defaultOrangeColor,
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

AppBar appBarBuilderWithWidget(
    {@required Widget titleWidget,
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
      backgroundColor: defaultOrangeColor,
      title: titleWidget,
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
    fontStyle = FontStyle.normal,
    String fontFamily,
    TextDecoration textDecoration = TextDecoration.none,
    Color decorationColor}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      decoration: textDecoration,
      decorationColor: decorationColor,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
    ),
  );
}

BoxShadow makeShadow({int color = 0xFF727272, double offset = 2}) {
  return BoxShadow(
    color: Color(color).withOpacity(0.2),
    blurRadius: 6,
    offset: Offset(0, offset),
    spreadRadius: 0,
  );
}

Widget appBarSearchButton(Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(15),
      child: Icon(
        Icons.search,
        color: orangeColor,
        size: 22,
      ),
    ),
  );
}

Widget callInfo(
    BuildContext context, bool isVideo, String partnerName, bool isCaller) {
  return Container(
    margin: EdgeInsets.only(top: 100),
    child: Column(
      children: [
        Center(
          child: buildText(
              isCaller
                  ? Languages.of(context).calling
                  : isVideo
                      ? Languages.of(context).incomingVideoCall
                      : Languages.of(context).incomingCall,
              18.0,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: buildText(partnerName, 30.0,
              color: Colors.black, fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}

// end Asmaa

// Start Bahaa
void showLanguagesDialog(BuildContext context) {
  int selectedLanguageIndex = LanguageHelper.isEnglish ? 0 : 1;
  LangBloc _bloc = LangBloc();
  _bloc.add(GetLangData());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: BlocBuilder<LangBloc, LangState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is LangLoadingState) {
                return CircularProgressIndicator();
              } else if (state is LangLoadedState &&
                  state.langResponse != null) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.langResponse.langData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          LanguageHelper.changeLanguage(context,
                              state.langResponse.langData[index].langCode);
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
                                  child: buildText(
                                      state.langResponse.langData[index].name,
                                      15,
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
                    separatorBuilder: (BuildContext context, int index) =>
                        Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      );
    },
  );
}

RawMaterialButton iconRound(IconData icon) {
  return RawMaterialButton(
    constraints: BoxConstraints(
        minWidth: 38.0, maxWidth: 38.0, minHeight: 38.0, maxHeight: 38.0),
    onPressed: () {},
    elevation: 2.0,
    fillColor: Colors.white,
    child: Icon(
      icon,
      color: Colors.black54,
    ),
    shape: CircleBorder(),
  );
}

void showAnimatedDialog(
  BuildContext context,
  dynamic widget,
) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Color(0xffcfcece).withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(alignment: Alignment.center, child: widget);
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: widget,
      );
    },
  );
}

Widget searchTextField({String hint, BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    height: MediaQuery.of(context).size.width * 0.10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white.withOpacity(0.5),
    ),
    child: Center(
      child: TextField(
        keyboardType: TextInputType.text,
        autocorrect: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
          prefixIcon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(5),
            child: Icon(
              Icons.search,
              color: orangeColor,
            ),
          ),
          hintStyle: TextStyle(color: Colors.black12),
          filled: true,
        ),
      ),
    ),
  );
}

AppBar appBarSearch({
  @required String hint,
  @required Function onCancelPressed,
  @required BuildContext context,
}) {
  return AppBar(
    leading: SizedBox(),
    centerTitle: true,
    toolbarHeight: 60.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    backgroundColor: defaultOrangeColor,
    title: searchTextField(hint: hint, context: context),
    actions: [
      FlatButton(
        child: buildText(Languages.of(context).cancel, 15.0,
            color: Colors.white70, fontWeight: FontWeight.w400),
        onPressed: onCancelPressed,
      ),
    ],
  );
}

Widget productItem(BuildContext context,
    {bool fillSaved = false, SearchItem.Product product}) {
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
                                text: product.product),
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
                                text: '${product.price} L.E'),
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
                    SizedBox(
                      width: 5,
                    ),
                    fillSaved
                        ? Icon(
                            Icons.bookmark,
                            size: 20,
                            color: orangeColor,
                          )
                        : Icon(
                            Icons.bookmark_border_outlined,
                            size: 20,
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
          child: Image.network(
            product.imagePath,
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.13,
          ),
        ),
      ],
    ),
  );
}

Widget productItemLandscape(
  BuildContext context, {
  SearchItem.Product product,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        margin: EdgeInsets.all(10),
        height: height * 0.2,
        decoration: BoxDecoration(
            boxShadow: [makeShadow()],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        height: height * 0.16,
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          color: Color(0xfffff2e5),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 10,
                        right: 15,
                        bottom: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 2,
                                right: 18,
                              ),
                              child: RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    text: (product.product)),
                                // Languages.of(context).blueShoes),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: height * .03,
                          // ),

                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: orangeColor,
                                  fontSize: 12,
                                ),
                                text: '${product.price} L.E'),
                          ),

                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(profile_image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400),
                                      text: 'Bahaa Robert'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 2,
        left: LanguageHelper.isEnglish ? width * 0.15 : null,
        right: LanguageHelper.isEnglish ? null : width * 0.18,
        child: Image.network(
          product.imagePath,
          fit: BoxFit.fill,
          width: width * 0.17,
          height: height * 0.16,
        ),
      ),
      Positioned.directional(
          textDirection: Directionality.of(context),
          top: height * -.11,
          end: width * .05,
          bottom: height * 0.03,
          child: Icon(
            LanguageHelper.isEnglish
                ? Icons.bookmark_border
                : Icons.bookmark_border,
            size: 25,
            color: Colors.black.withOpacity(0.7),
          )),
      Positioned.directional(
        textDirection: Directionality.of(context),
        top: height * -.11,
        end: width * .05,
        bottom: height * 0.03,
        child: Icon(
          LanguageHelper.isEnglish
              ? Icons.bookmark_border
              : Icons.bookmark_border,
          size: 25,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    ],
  );
}

Widget productItemLandscape2(BuildContext context,
    {List<Product> products, int index}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        margin: EdgeInsets.all(10),
        height: height * 0.2,
        decoration: BoxDecoration(
            boxShadow: [makeShadow()],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        height: height * 0.16,
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          color: Color(0xfffff2e5),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 10,
                        right: 15,
                        bottom: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 2,
                                right: 18,
                              ),
                              child: RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    text: (products[index].product)),
                                // Languages.of(context).blueShoes),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: height * .03,
                          // ),

                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: orangeColor,
                                  fontSize: 12,
                                ),
                                text: '${products[index].price} L.E'),
                          ),

                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(profile_image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400),
                                      text: 'Bahaa Robert'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 2,
        left: LanguageHelper.isEnglish ? width * 0.15 : null,
        right: LanguageHelper.isEnglish ? null : width * 0.18,
        child: Image.network(
          products[index].imagePath,
          fit: BoxFit.fill,
          width: width * 0.17,
          height: height * 0.16,
        ),
      ),
      Positioned.directional(
          textDirection: Directionality.of(context),
          top: height * -.11,
          end: width * .05,
          bottom: height * 0.03,
          child: Icon(
            LanguageHelper.isEnglish
                ? Icons.bookmark_border
                : Icons.bookmark_border,
            size: 25,
            color: Colors.black.withOpacity(0.7),
          )),
      Positioned.directional(
        textDirection: Directionality.of(context),
        top: height * -.11,
        end: width * .05,
        bottom: height * 0.03,
        child: Icon(
          LanguageHelper.isEnglish
              ? Icons.bookmark_border
              : Icons.bookmark_border,
          size: 25,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    ],
  );
}

Widget backIconRounded({Function onBackPressed}) {
  return GestureDetector(
    onTap: onBackPressed,
    child: CircleAvatar(
      radius: 9,
      backgroundColor: orangeColor,
      child: Icon(
        LanguageHelper.isEnglish
            ? Icons.keyboard_arrow_left_outlined
            : Icons.keyboard_arrow_right_outlined,
        size: 17,
        color: Colors.white,
      ),
    ),
  );
}

// end Bahaa

// Start Mosdik

Widget ListOfProduct() {
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
      ),
      reverse: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, position) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: productItem(context),
        );
      });
}

Widget infoCartSupplier(
    String name, String years, String country, String category) {
  return Column(
    children: [
      Container(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [makeShadow(color: (0x29e16036), offset: 3)],
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 10, start: 10, bottom: 10, end: 10),
                child: Column(
                  children: [
                    buildText(name, 10.0,
                        color: Colors.black, fontWeight: FontWeight.w700),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            buildText(years, 7.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage(medalImage),
                              width: 14,
                              height: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            buildText(country, 7.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        buildText(category, 7.0,
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 1,
            left: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [makeShadow(color: (0x29e16036), offset: 3)],
              ),
              child: Image(
                image: AssetImage(
                  medalImage,
                ),
                height: 40,
                width: 40,
              ),
            ),
          ),
        ]),
      ),
    ],
  );
}

Widget textFiledPrice(BuildContext context, String text, double width,
    {IconButton dropIcon,
    TextEditingController controller,
    bool isPassword = false,
    String errorMessage,
    TextInputType keyboardType = TextInputType.text}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      cursorColor: Theme.of(context).bottomAppBarColor,
      decoration: InputDecoration(
        errorText: errorMessage,
        suffixIcon: dropIcon,
        labelText: text,
        labelStyle: TextStyle(
            fontFamily: 'Roboto-Thin.ttf', fontWeight: FontWeight.w200),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
    ),
  );
}

Widget listOfCateWidget(List<CategoryElement> cats) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    reverse: false,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: cats.length - 1,
    itemBuilder: (context, position) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child:
              mostPopularByCategoryStable(context, () {}, cats[position + 1]));
    },
  );
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

void showCurrencyDialog(BuildContext context) {
  CurrencyData currency;
  String selectedCurrencyIndex = currency.currencyId;
  CurrencyBloc _bloc = CurrencyBloc();
  _bloc.add(GetCurrencyData());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is CurrencyLoadingState) {
                return CircularProgressIndicator();
              } else if (state is CurrencyLoadedState &&
                  state.currencyResponse != null) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.currencyResponse.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          LanguageHelper.changeLanguage(context,
                              state.currencyResponse.data[index].currencyCode);
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
                                  child: buildText(
                                      state.currencyResponse.data[index]
                                          .description,
                                      15,
                                      fontFamily: mediumFontFamily,
                                      fontWeight: FontWeight.w600)),
                              selectedCurrencyIndex == index
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
                    separatorBuilder: (BuildContext context, int index) =>
                        Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      );
    },
  );
}

void showCountryDialog(BuildContext context) {
  CountryData Country;
  String selectedCountryIndex = Country.country;
  CountryBloc _bloc = CountryBloc();
  _bloc.add(GetCountryData());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: BlocBuilder<CountryBloc, CountryState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is CountryLoadingState) {
                return CircularProgressIndicator();
              } else if (state is CountryLoadedState &&
                  state.countryResponse != null) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.countryResponse.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          LanguageHelper.changeLanguage(
                              context, state.countryResponse.data[index].code);
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
                                  child: buildText(
                                      state.countryResponse.data[index].country,
                                      15,
                                      fontFamily: mediumFontFamily,
                                      fontWeight: FontWeight.w600)),
                              selectedCountryIndex == index
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
                    separatorBuilder: (BuildContext context, int index) =>
                        Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      );
    },
  );
}

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam
Widget customTextField(BuildContext context,
    {String label,
    IconButton rightBtn,
    IconData leftIcon,
    TextEditingController controller,
    double width = 1,
    TextInputType textInputType,
    errorText,
    bool isPassword = false}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    child: TextField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          //hintText: 'username',
          errorText: errorText,
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
    ),
  );
}

FlatButton signInFlatButton(
    BuildContext context, double height, String text, Function onPress,
    {double widthOfBtn = 0.1}) {
  return FlatButton(
    minWidth: MediaQuery.of(context).size.width * widthOfBtn,
    padding: EdgeInsetsDirectional.only(
      start: 25,
      end: 25,
      top: 11,
      bottom: 11,
    ),
    splashColor: orangeColor.withOpacity(0.5),
    highlightColor: orangeColor.withOpacity(0.2),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(9),
    ),
    onPressed: onPress,
    color: Colors.white,
    child: Text(
      text,
      style: TextStyle(fontSize: height * .015, color: Colors.red),
    ),
  );
}

// end Islam
