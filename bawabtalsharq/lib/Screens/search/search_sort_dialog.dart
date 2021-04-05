import 'dart:ui';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bawabtalsharq/Utils/styles.dart';

enum ArrangeCharacter { lafayette, jefferson }
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
  ArrangeCharacter _arrangeCharacter = ArrangeCharacter.lafayette;
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
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 30, right: 30, bottom: 20),
                    child: buildText('Done', 14,
                        color: defaultOrangeColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: buildText('Arrange', 18,
                      color: defaultOrangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<ArrangeCharacter>(
                    dense: true,
                    title: const Text('Ascending'),
                    value: ArrangeCharacter.lafayette,
                    groupValue: _arrangeCharacter,
                    onChanged: (ArrangeCharacter value) {
                      setState(() {
                        _arrangeCharacter = value;
                      });
                    },
                  ),
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<ArrangeCharacter>(
                    dense: true,
                    title: const Text('Descending'),
                    value: ArrangeCharacter.jefferson,
                    groupValue: _arrangeCharacter,
                    onChanged: (ArrangeCharacter value) {
                      setState(() {
                        _arrangeCharacter = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: buildText('Popularity', 18,
                      color: defaultOrangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<PopularityCharacter>(
                    dense: true,
                    title: const Text('Most Popular'),
                    value: PopularityCharacter.mostPop,
                    groupValue: _popularCharacter,
                    onChanged: (PopularityCharacter value) {
                      setState(() {
                        _popularCharacter = value;
                      });
                    },
                  ),
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<PopularityCharacter>(
                    dense: true,
                    title: const Text('New In'),
                    value: PopularityCharacter.newIn,
                    groupValue: _popularCharacter,
                    onChanged: (PopularityCharacter value) {
                      setState(() {
                        _popularCharacter = value;
                      });
                    },
                  ),
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<PopularityCharacter>(
                    dense: true,
                    title: const Text('Best Rating'),
                    value: PopularityCharacter.bestRating,
                    groupValue: _popularCharacter,
                    onChanged: (PopularityCharacter value) {
                      setState(() {
                        _popularCharacter = value;
                      });
                    },
                  ),
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<PopularityCharacter>(
                    dense: true,
                    title: const Text('Lowest Price'),
                    value: PopularityCharacter.lowestPrice,
                    groupValue: _popularCharacter,
                    onChanged: (PopularityCharacter value) {
                      setState(() {
                        _popularCharacter = value;
                      });
                    },
                  ),
                ),
                Transform.scale(
                  scale: 0.9,
                  child: RadioListTile<PopularityCharacter>(
                    dense: true,
                    title: const Text('Highest Price'),
                    value: PopularityCharacter.highestPrice,
                    groupValue: _popularCharacter,
                    onChanged: (PopularityCharacter value) {
                      setState(() {
                        _popularCharacter = value;
                      });
                    },
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
