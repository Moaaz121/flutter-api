import 'package:bawabtalsharq/Model/colorsModle.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: 'Color',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: listOfColors(context),
    );
  }

  Widget listOfColors(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 20,
          ),
          itemCount: colorsArray.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  colorsArray[index].isSelected =
                      !colorsArray[index].isSelected;
                });
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        boxShadow: [makeShadow()],
                        borderRadius: BorderRadius.circular(50),
                        color: colorsArray[index].color),
                  ),
                  Positioned(
                    child: Center(
                        child: colorsArray[index].isSelected
                            ? Icon(
                                Icons.done,
                                size: MediaQuery.of(context).size.longestSide *
                                    0.04,
                                color: colorsArray[index].color == Colors.white
                                    ? Colors.black
                                    : Colors.white,
                              )
                            : SizedBox()),
                  )
                ],
              ),
            );
          }),
    );
  }
}
