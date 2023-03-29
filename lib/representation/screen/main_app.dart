import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travelappproject/core/constants/color_constants.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  static const routeName = 'main_app';

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white ,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.3),
        selectedColorOpacity: 0.2,
        //can le
        margin: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: kDefaultPadding,
            ),
            title: Text("Trang chủ"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              size: kDefaultPadding,
            ),
            title: Text("Yêu thích"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.briefcase,
              size: kDefaultPadding,
            ),
            title: Text("Đặt phòng"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultPadding,
            ),
            title: Text("Cá nhân"),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
