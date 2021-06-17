import 'dart:io';

import 'package:bawabtalsharq/Model/history_model.dart';
import 'package:bawabtalsharq/Model/home_model.dart';
import 'package:bawabtalsharq/Model/search_model.dart' as SearchItem;
import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/loader.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/Utils/validator_util.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/bloc/countryBloc/country_bloc.dart';
import 'package:bawabtalsharq/bloc/countryBloc/country_event.dart';
import 'package:bawabtalsharq/bloc/countryBloc/country_state.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_bloc.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_event.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_state.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_bloc.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_event.dart';
import 'package:bawabtalsharq/bloc/langBloc/lang_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            child: progressBar(),
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
        borderRadius:
            BorderRadiusDirectional.horizontal(end: Radius.circular(10)),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2ee16036),
            offset: Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
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
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: orangeColor,
                  letterSpacing: 0.192,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0x2ee16036),
              offset: Offset(0, 1),
              blurRadius: 6,
            ),
          ],
        ),
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
              height: MediaQuery.of(context).size.width * .48,
              aspectRatio: 16 / 14,
              viewportFraction: 0.83,
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
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0x336e6e6e),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
          placeholder: (context, url) => Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  placeHolder,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  placeHolder,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget sliderIndicator(int page,
    {bool noPadding = false, int count = 4, Color dotColor = orangeColor}) {
  return Padding(
    padding: noPadding
        ? const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
        : const EdgeInsetsDirectional.only(top: 5, bottom: 20, start: 50),
    child: AnimatedSmoothIndicator(
      activeIndex: page,
      count: count,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
          spacing: 5.0,
          radius: 8.0,
          dotWidth: 6.5,
          dotHeight: 6.5,
          expansionFactor: 2.7,
          dotColor: dotColor.withOpacity(0.2),
          activeDotColor: dotColor),
    ),
  );
}

Widget progressBar() {
  return Platform.isAndroid
      ? CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: new AlwaysStoppedAnimation<Color>(orangeColor),
        )
      : CupertinoActivityIndicator();
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
    mini: true,
    child: Icon(
      Icons.arrow_upward,
      color: defaultOrangeColor,
    ),
    backgroundColor: Colors.white,
    onPressed: onPressed,
  );
}

Text buildText(String text, double fontSize,
    {Color color = Colors.black,
    textAlign = TextAlign.start,
    fontWeight = FontWeight.normal,
    fontStyle = FontStyle.normal,
    int maxLine,
    String fontFamily,
    TextDecoration textDecoration = TextDecoration.none,
    Color decorationColor}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLine,
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
    child: ClipRRect(
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
                return LoadingLogo();
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
                return progressBar();
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
      color: orangeColor,
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

Widget searchTextField(
    {String hint,
    BuildContext context,
    Function onTap,
    TextEditingController controller}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    height: MediaQuery.of(context).size.width * 0.10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white.withOpacity(0.5),
    ),
    child: Center(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        autocorrect: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
          prefixIcon: InkWell(
            onTap: onTap,
            child: Container(
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
          ),
          hintStyle: TextStyle(color: Colors.black12),
          filled: true,
        ),
      ),
    ),
  );
}

AppBar appBarSearch(
    {@required String hint,
    @required Function onCancelPressed,
    @required BuildContext context,
    Function onTap,
    TextEditingController controller}) {
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
    title: searchTextField(
      hint: hint,
      context: context,
      onTap: onTap,
      controller: controller,
    ),
    actions: [
      FlatButton(
        child: buildText(Languages.of(context).cancel, 15.0,
            color: Colors.white70, fontWeight: FontWeight.w400),
        onPressed: onCancelPressed,
      ),
    ],
  );
}

Widget productItem(BuildContext context, {SearchItem.Datum product}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: (MediaQuery.of(context).size.width / 2) - 35 * 1.36,
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
                                  fontFamily: 'Segoe UI',
                                  fontSize: 10.0,
                                  color: Color(0xff303030),
                                  letterSpacing: 0.12,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.16),
                                      offset: Offset(0, 1.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                text: product.product),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 10.0,
                                  color: orangeColor,
                                  letterSpacing: 0.108,
                                  fontWeight: FontWeight.w600,
                                ),
                                text: '${product.price}'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.22,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(searchShadow),
                              fit: BoxFit.fill)),
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
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(product.companyImg),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 9.0,
                                  color: Color(0xff303030),
                                  letterSpacing: 0.084,
                                ),
                                text: product.company),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          RichText(
                            text: TextSpan(
                                text:
                                    removeAllHtmlTags(product.shortDescription),
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 9.0,
                                  color: Color(0xff303030),
                                  fontWeight: FontWeight.w600,
                                )),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Constants.getUserInfo2() == null
                        ? SizedBox()
                        : product.save == 1
                            ? Icon(Icons.bookmark, size: 20, color: orangeColor)
                            : Icon(Icons.bookmark,
                                size: 20, color: Colors.black26),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          right: LanguageHelper.isEnglish ? -10 : null,
          left: LanguageHelper.isEnglish ? null : -10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: CachedNetworkImage(
              imageUrl: product.imagePath,
              fit: BoxFit.cover,
              placeholder: (context, url) => Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  child: Image.asset(placeHolder),
                ),
              ),
              errorWidget: (context, url, error) => Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  child: Image.asset(placeHolder),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlText.replaceAll(exp, '');
}

Widget productItemLandscape(
  BuildContext context, {
  SearchItem.Datum product,
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
                                      image: NetworkImage(product.companyImg),
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
                                      text: product.company),
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
        child: Container(
          width: width * 0.17,
          height: height * 0.16,
          child: CachedNetworkImage(
            imageUrl: product.imagePath,
            fit: BoxFit.cover,
            placeholder: (context, url) => Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Image.asset(placeHolder),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Image.asset(placeHolder),
              ),
            ),
          ),
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
                                      image: NetworkImage(
                                          products[index].companyImg),
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
                                      text: products[index].company),
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
        child: Container(
          width: width * 0.17,
          height: height * 0.16,
          child: CachedNetworkImage(
            imageUrl: products[index].imagePath,
            fit: BoxFit.cover,
            placeholder: (context, url) => Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Image.asset(placeHolder),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Image.asset(placeHolder),
              ),
            ),
          ),
        ),

        // Image.network(
        //
        //
        // ),
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

showToast(
    {@required String text, ToastGravity toastGravity = ToastGravity.TOP}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: orangeColor,
      textColor: Colors.white,
      fontSize: 14);
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

Widget infoCartSupplier(String name, String years, String country,
    String category, String imagFlag, Function onPress) {
  return Column(
    children: [
      GestureDetector(
        onTap: onPress,
        child: Container(
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
                                image: NetworkImage(imagFlag),
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
      ),
    ],
  );
}

Widget textFiledPrice(BuildContext context, String text,
    {double width = 1,
    IconButton dropIcon,
    TextEditingController controller,
    bool isPassword = false,
    errorText,
    String errorMessage,
    TextInputType keyboardType = TextInputType.text}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      inputFormatters: keyboardType == TextInputType.number
          ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
          : null,
      cursorColor: Theme.of(context).bottomAppBarColor,
      decoration: InputDecoration(
        errorText: errorMessage,
        suffixIcon: dropIcon,
        labelText: text,
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
    ),
  );
}

String numberValidator(String value) {
  if (value == null) {
    return null;
  }
  final n = num.tryParse(value);
  if (n == null) {
    return '"$value" is not a valid number';
  }
  return null;
}

Widget listOfCateWidget(List<CategoryElement> cats) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    // reverse: true,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: cats.length - 1,
    itemBuilder: (context, position) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child: mostPopularByCategoryStable(context, cats[position + 1]));
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
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20),
        child: Text(
          Languages.of(context).mostPopularByCategories,
          style: titlesStyle(),
        ),
      ),
    ),
  );
}

void showCurrencyDialog(BuildContext context) {
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
                return LoadingLogo();
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
                          state.currencyResponse.data[index].isSelected = true;
                          Constants.saveCurrencyId(
                              currency: state
                                  .currencyResponse.data[index].currencyId);
                          Navigator.popAndPushNamed(
                              context, ScreenRoutes.mainScreen);
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
                              state.currencyResponse.data[index].currencyId ==
                                      Constants.getCurrency2()
                                  ? Image.asset(
                                      checkBox,
                                      width: 40,
                                      height: 40,
                                    )
                                  : SizedBox(),
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
                return progressBar();
              }
            }),
      );
    },
  );
}

void showCountryDialog(BuildContext context) {
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
                return LoadingLogo();
              } else if (state is CountryLoadedState &&
                  state.countryResponse != null) {
                // print(state.countryResponse.data[0].country);
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
                          state.countryResponse.data[index].isSelected = true;
                          Constants.saveCountryCode(
                              country:
                                  state.countryResponse.data[index].country);
                          Navigator.popAndPushNamed(
                              context, ScreenRoutes.mainScreen);
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
                              state.countryResponse.data[index].country ==
                                      Constants.getCountry2()
                                  ? Image.asset(
                                      checkBox,
                                      width: 40,
                                      height: 40,
                                    )
                                  : SizedBox(),
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
                return progressBar();
              }
            }),
      );
    },
  );
}

Widget cupertinoActionSheet(BuildContext context, String headerText,
    {Future action}) {
  return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(headerText),
          onPressed: () => action,
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(Languages.of(context).cancel),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ));
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
            fontSize: 12,
          ),
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

//Start Asmaa
void showPhoneDialog(BuildContext context) async {
  Future.delayed(Duration(milliseconds: 10), () {
    RegisterBloc _registerBloc = RegisterBloc();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: BlocProvider(
          create: (context) => _registerBloc,
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ReReisgterWithNewNumber) {
                Navigator.pushReplacementNamed(
                    context, ScreenRoutes.signUpScreen);
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Languages.of(context).phoneAlreadyRegistered,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FlatButton(
                                        child: Text(
                                          Languages.of(context).cancel,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 2,
                                        endIndent: 25,
                                        indent: 25,
                                      ),
                                      FlatButton(
                                        child: Text(
                                          Languages.of(context).signUp,
                                          style: TextStyle(color: orangeColor),
                                        ),
                                        onPressed: () {
                                          _registerBloc.add(ReRegister());
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
              },
            ),
          ),
        ));
      },
    );
  });
}

Widget customTextFormField(BuildContext context,
    {String label,
    IconButton rightBtn,
    IconData leftIcon,
    TextEditingController controller,
    double width = 1,
    TextInputType textInputType,
    errorText,
    bool isPassword = false,
    String hintText}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    child: TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        print(value);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (label == Languages.of(context).email &&
            !emailValidator(controller.text.trim())) {
          return 'please enter correct email address';
        } else if (label == Languages.of(context).tel &&
            !phoneValidator(controller.text.trim())) {
          return 'please enter correct Phone Number';
        } else if (label == Languages.of(context).loginPass &&
            !passwordValidator(controller.text.trim())) {
          return 'Weak Password';
        } else if (label == Languages.of(context).countryCode &&
                value == null ||
            value.isEmpty) {
          return 'Enter code';
        } else
          return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            leftIcon,
            color: Colors.grey,
          ),
          suffixIcon: rightBtn,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    ),
  );
}

//End Asmaa
