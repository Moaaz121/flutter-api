import 'package:bawabtalsharq/Screens/profile_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Screens/profile/contact_us/location_dialog.dart';
import 'package:bawabtalsharq/Screens/profile/contact_us/send_message_dialog.dart';
import 'package:bawabtalsharq/Screens/profile/contact_us/phone_dialog.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).settings,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: buildText(
                    Languages.of(context).allowing,
                    16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 65,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 22, right: 11),
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [makeShadow()],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_alert,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: buildText(
                        Languages.of(context)
                            .allowNotificationFromBawabtAlsharq,
                        12,
                        fontWeight: FontWeight.w600,
                      )),
                      CupertinoSwitch(
                        value: _switchValue,
                        activeColor: orangeColor,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40, bottom: 10),
                  child: buildText(
                    'Main',
                    16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                cardSetting(
                    text: buildText(
                      'Country',
                      12,
                      fontWeight: FontWeight.w600,
                    ),
                    icon: Icons.flag,
                    iconColor: Colors.blue),
                cardSetting(
                    text: buildText(
                      'Language',
                      12,
                      fontWeight: FontWeight.w600,
                    ),
                    icon: Icons.language,
                    iconColor: Colors.deepOrange),
                cardSetting(
                  text: buildText(
                    'Currency',
                    12,
                    fontWeight: FontWeight.w600,
                  ),
                  icon: Icons.monetization_on,
                  iconColor: Colors.green,
                ),
                cardSetting(
                  text: buildText(
                    'Change Password',
                    12,
                    fontWeight: FontWeight.w600,
                  ),
                  icon: Icons.lock,
                  iconColor: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50, bottom: 10),
                  child: buildText(
                    'Help',
                    16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [makeShadow()],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTileCard(
                    baseColor: Colors.white,
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Contact us',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            child: Column(
                              children: [
                                unExpansionProfileItem(
                                  Icon(
                                    Icons.phone,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  'Phone Number',
                                  () {
                                    showAnimatedDialog(
                                      context,
                                      phoneNumberDialog(context),
                                    );
                                  },
                                  textSize: 12,
                                ),
                                unExpansionProfileItem(
                                  Icon(
                                    Icons.email,
                                    size: 20,
                                    color: Colors.deepOrange,
                                  ),
                                  'Send Message',
                                  () {
                                    showAnimatedDialog(
                                      context,
                                      sendMessageDialog(context),
                                    );
                                  },
                                  textSize: 12,
                                ),
                                unExpansionProfileItem(
                                  Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  'Location',
                                  () {
                                    showAnimatedDialog(
                                      context,
                                      locationDialog(context),
                                    );
                                  },
                                  drawDivider: false,
                                  textSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                cardSetting(
                  text: buildText(
                    'About us',
                    12,
                    fontWeight: FontWeight.w600,
                  ),
                  icon: Icons.info,
                  iconColor: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardSetting(
      {Widget text, IconData icon, Color iconColor, Function onPress}) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 65,
        padding: EdgeInsets.only(left: 22, right: 11),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [makeShadow()],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 20),
            Expanded(child: text),

            Icon(
              Icons.navigate_next,
            ),
            //Icon(Icons.ac_unit),
          ],
        ),
      ),
    );
  }
}
