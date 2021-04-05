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
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.grey,
        toggleableActiveColor: orangeColor,
      ),
      child: Material(
        child: Container(
          padding: EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: buildText('Done', 14,
                    color: defaultOrangeColor, fontWeight: FontWeight.bold),
              ),
              buildText('Arrange', 18,
                  color: defaultOrangeColor, fontWeight: FontWeight.bold),
              SizedBox(
                height: 10,
              ),
              RadioListTile<ArrangeCharacter>(
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
              RadioListTile<ArrangeCharacter>(
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
              SizedBox(
                height: 30,
              ),
              buildText('Popularity', 18,
                  color: defaultOrangeColor, fontWeight: FontWeight.bold),
              RadioListTile<PopularityCharacter>(
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
              RadioListTile<PopularityCharacter>(
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
              RadioListTile<PopularityCharacter>(
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
              RadioListTile<PopularityCharacter>(
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
              RadioListTile<PopularityCharacter>(
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
            ],
          ),
        ),
      ),
    );
  }
}
