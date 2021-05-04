import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ArrangeCharacter { ascending, descending }
enum PopularityCharacter {
  mostPop,
  newIn,
  bestRating,
  lowestPrice,
  highestPrice,
}

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  ArrangeCharacter _arrangeCharacter = ArrangeCharacter.ascending;
  PopularityCharacter _popularCharacter = PopularityCharacter.mostPop;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.grey,
          toggleableActiveColor: orangeColor,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: LanguageHelper.isEnglish
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 30, right: 30, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: buildText(
                        Languages.of(context).done,
                        14,
                        color: defaultOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: buildText(Languages.of(context).arrange, 18,
                      color: defaultOrangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<ArrangeCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).ascending),
                      value: ArrangeCharacter.ascending,
                      groupValue: _arrangeCharacter,
                      onChanged: (ArrangeCharacter value) {
                        setState(() {
                          _arrangeCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 170,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<ArrangeCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).descending),
                      value: ArrangeCharacter.descending,
                      groupValue: _arrangeCharacter,
                      onChanged: (ArrangeCharacter value) {
                        setState(() {
                          _arrangeCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: buildText(Languages.of(context).popularity, 18,
                      color: defaultOrangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                  width: 170,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).mostPop),
                      value: PopularityCharacter.mostPop,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).newIn),
                      value: PopularityCharacter.newIn,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).bestRating),
                      value: PopularityCharacter.bestRating,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).lowestPrice),
                      value: PopularityCharacter.lowestPrice,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 30,
                  child: Transform.scale(
                    scale: 0.9,
                    child: RadioListTile<PopularityCharacter>(
                      dense: true,
                      title: Text(Languages.of(context).highestPrice),
                      value: PopularityCharacter.highestPrice,
                      groupValue: _popularCharacter,
                      onChanged: (PopularityCharacter value) {
                        setState(() {
                          _popularCharacter = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
