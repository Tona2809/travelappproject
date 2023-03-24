import 'dart:js';

import 'package:flutter/material.dart';
import 'package:travelappproject/representation/screen/intro_screen.dart';
import 'package:travelappproject/representation/screen/main_app.dart';
import 'package:travelappproject/representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  MainApp.routeName: (context) =>  MainApp(),
};
