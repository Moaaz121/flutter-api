import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/material.dart';

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

// end karem

// Start Asmaa
AppBar appBarBuilder(
    {@required String title,
    @required Function onBackPressed,
    List<Widget> actions}) {
  return AppBar(
      actions: actions,
      toolbarHeight: 60.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.deepOrange[400],
      title: Text(
        title,
        style: TextStyle(
            fontFamily: boldFontFamily,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
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

// end Asmaa

// Start Bahaa

// end Bahaa

// Start Mosdik

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam
