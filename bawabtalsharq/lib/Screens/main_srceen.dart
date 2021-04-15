import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Screens/profile_screen.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'superior_screen.dart';
import 'notification_screen.dart';

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
      bottom: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: bottomAppBar((int position) {
          controller.animateToPage(position,
              duration: Duration(milliseconds: 1), curve: Curves.linear);
        }, controller, currentPage, context),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeScreen(),
            SuperiorScreen(),
            NotificationScreen(),
            ProfileScreen(),
          ],
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
        ),
      ),
    );
  }
}
