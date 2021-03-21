
import 'package:bawabtalsharq/Screens/profile_screen.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'feature_screen.dart';
import 'home_screen.dart';
import 'notificationScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  PageController controller = PageController(initialPage: 0, keepPage: true);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,

      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: bottomAppBar((int position){

          controller.animateToPage(position, duration: Duration(milliseconds: 200), curve: Curves.linear);

        },controller,currentPage),
        body: PageView(
            controller: controller,
            children: [
              HomeScreen(),
              FeatureScreen(),
              NotificationScreen(),
              ProfileScreen(),
            ],
            onPageChanged: (page){
              setState(() {
                currentPage = page;
              });
            },
          ),

      ),
    );
  }
}
