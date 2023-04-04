import 'package:flutter/material.dart';
import 'package:travelappproject/representation/screen/date_select_screen.dart';
import 'package:travelappproject/representation/screen/detail_hotel_screen.dart';
import 'package:travelappproject/representation/screen/guess_and_room_screen.dart';
import 'package:travelappproject/representation/screen/hotel_booking_screen.dart';
import 'package:travelappproject/representation/screen/hotel_screen.dart';
import 'package:travelappproject/representation/screen/intro_screen.dart';
import 'package:travelappproject/representation/screen/main_app.dart';
import 'package:travelappproject/representation/screen/rooms_screen.dart';
import 'package:travelappproject/representation/screen/splash_screen.dart';

import 'data/model/hotel_model.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  MainApp.routeName: (context) => MainApp(),
  HotelScreen.routeName: (context) => HotelScreen(),
  HotelBookingScreen.routeName: (context) => HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  RoomAndGuessScreen.routeName: (context) => RoomAndGuessScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),
};
MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelScreen(
          hotelModel: hotelModel,
        ),
      );


    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}

