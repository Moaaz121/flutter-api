import 'package:bawabtalsharq/Screens/all_categories_screen.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  mainSlider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mainHeaderButton(() {
                        Navigator.pushNamed(context, ScreenRoutes.categoriesScreen);
                      }, Strings().allCategories(), allCategories,
                          blueColor.withOpacity(0.15)),
                      mainHeaderButton(() {}, Strings().requestForQ(),
                          requestForQ, orangeColor.withOpacity(0.15)),
                      mainHeaderButton(() {}, Strings().joinUs(), joinUs,
                          purpleColor.withOpacity(0.15)),
                    ],
                  ),
                  ourGoldenSupplier(),
                  mostPopularIn(context),
                  mostPopularByCategoryHeader(context),
                  listOfCateWidget()
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [searchButton(() {}), chatButton(() {})],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
