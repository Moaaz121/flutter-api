import 'package:bawabtalsharq/Model/contactUs_model.dart';
import 'package:bawabtalsharq/Model/currency_model.dart';
import 'package:bawabtalsharq/Screens/profile_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_bloc.dart';
import 'package:bawabtalsharq/bloc/currancyBloc/currency_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/settingBloc/setting_block.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/settingBloc/setting_event.dart';
import 'package:bawabtalsharq/bloc/profileBlocs/settingBloc/setting_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switchValue = true;
  SettingBloc _settingBloc;
  CurrencyBloc _currencyBloc;
  ContactModel location;
  CurrencyData currencyData;

  @override
  void initState() {
    super.initState();

    _settingBloc = SettingBloc();
    _settingBloc.add(GetSettingEvent());
    _currencyBloc = CurrencyBloc();
    _currencyBloc.add(GetCurrencyData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilderWithWidget(
        titleWidget: buildText(Languages.of(context).settings, 18.0,
            fontFamily: boldFontFamily,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => _settingBloc),
          BlocProvider(create: (BuildContext context) => _currencyBloc)
        ],
        child: SingleChildScrollView(
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
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 22, right: 11),
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
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: _switchValue,
                            activeColor: orangeColor,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 40, bottom: 10),
                    child: buildText(
                      Languages.of(context).main,
                      16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  cardSetting(
                      onPress: () {
                        showCountryDialog(context);
                      },
                      text: buildText(
                        Languages.of(context).country,
                        12,
                        fontWeight: FontWeight.w600,
                      ),
                      extraText: buildText(
                          Constants.getCountry2() == 'Egypt'
                              ? Languages.of(context).egypt
                              : Constants.getCountry2(),
                          10,
                          fontWeight: FontWeight.w400,
                          color: orangeColor),
                      icon: Icons.flag,
                      iconColor: Colors.blue),
                  cardSetting(
                      onPress: () {
                        showLanguagesDialog(context);
                      },
                      text: buildText(
                        Languages.of(context).languages,
                        12,
                        fontWeight: FontWeight.w600,
                      ),
                      extraText: buildText(Languages.of(context).lan, 12,
                          fontWeight: FontWeight.w400, color: orangeColor),
                      icon: Icons.language,
                      iconColor: Colors.deepOrange),

                  cardSetting(
                    onPress: () {
                      showCurrencyDialog(context);
                    },
                    text: buildText(
                      Languages.of(context).currency,
                      12,
                      fontWeight: FontWeight.w600,
                    ),
                    extraText: buildText(
                        Constants.getCurrency2() == '4'
                            ? Languages.of(context).egp
                            : Languages.of(context).usd,
                        10,
                        fontWeight: FontWeight.w400,
                        color: orangeColor),
                    icon: Icons.monetization_on,
                    iconColor: Colors.green,
                  ),

                  // cardSetting(
                  //   text: buildText(
                  //     'Change Password',
                  //     12,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  //   icon: Icons.lock,
                  //   iconColor: Colors.red,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 50, bottom: 10),
                    child: buildText(
                      Languages.of(context).help,
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
                        Languages.of(context).contactUs,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.width * 0.46,
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                                  Languages.of(context).phoneNumber,
                                  () {
                                    showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            cupertinoActionSheet(
                                                context, '+215453',
                                                action:
                                                    launch("tel://+215453")));
                                  },
                                  textSize: 12,
                                ),
                                unExpansionProfileItem(
                                  Icon(
                                    Icons.email,
                                    size: 20,
                                    color: Colors.deepOrange,
                                  ),
                                  Languages.of(context).sendMessage,
                                  () {
                                    Navigator.pushNamed(
                                        context, ScreenRoutes.sendMessage);
                                  },
                                  textSize: 12,
                                ),
                                BlocBuilder<SettingBloc, SettingState>(
                                  bloc: _settingBloc,
                                  builder: (context, state) {
                                    if (state is SettingLoadedState &&
                                        state.SettingResponse != null) {
                                      return unExpansionProfileItem(
                                        Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        Languages.of(context).location,
                                        () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  cupertinoActionSheet(
                                                    context,
                                                    state.SettingResponse
                                                        .companyAddress,
                                                  ));
                                        },
                                        drawDivider: false,
                                        textSize: 12,
                                      );
                                    } else if (state is SettingLoadingState) {
                                      return SizedBox();
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  cardSetting(
                      text: buildText(
                        Languages.of(context).aboutUs,
                        12,
                        fontWeight: FontWeight.w600,
                      ),
                      icon: Icons.info,
                      iconColor: Colors.teal,
                      onPress: () {
                        Navigator.pushNamed(context, ScreenRoutes.aboutUs);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardSetting(
      {Function onPress,
      Widget text,
      IconData icon,
      Color iconColor,
      Widget extraText}) {
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: extraText,
            ),

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
