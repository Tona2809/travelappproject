import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travelappproject/core/constants/color_constants.dart';
import 'package:travelappproject/core/helpers/local_storage_helper.dart';
import 'package:travelappproject/representation/screen/splash_screen.dart';
import 'package:travelappproject/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  await Firebase.initializeApp(
      options: const FirebaseOptions(apiKey: "AIzaSyBzwK2CzkRa3SRyfDwkbdrE_-ho_BWFVvs"
          , appId: "1:209055630468:android:4175cb90e2d1cc344f2ed1"
          , messagingSenderId: "209055630468	",
          projectId: "flutterfirebasedemo-a7efb")
  );
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
        primarySwatch: Colors.blue
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
