import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travelappproject/core/constants/color_constants.dart';
import 'package:travelappproject/core/helpers/local_storage_helper.dart';
import 'package:travelappproject/representation/screen/splash_screen.dart';
import 'package:travelappproject/routes.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel and Hotel App',
      theme: ThemeData(
       primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

}
